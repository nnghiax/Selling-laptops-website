/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Config.Config;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.CheckOutDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.CartItem;
import model.Customer;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author vutie
 */
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String city = request.getParameter("cityName");
        String district = request.getParameter("districtName");
        String ward = request.getParameter("wardName");
        String detailAddress = request.getParameter("detailAddress");
        String paymentMethod = request.getParameter("paymentMethod");
        float shippingFee = Float.parseFloat(request.getParameter("shippingFee"));
        String fullAddress = detailAddress + ", " + ward + ", " + district + ", " + city;
        float totalPrice = Float.parseFloat(request.getParameter("totalPrice"));
        String orderID = generateOrderID(phone);
        String orderDate = orderDate();

        //Chuyen doi tien te sang Vnpay
        float exchangeRate = 25455.0f;
        long totalPriceInVND = Math.round(totalPrice * exchangeRate);

        CheckOutDAO db = new CheckOutDAO();
        // Add customer
        Customer customer = new Customer(phone, fullName, fullAddress);
        db.addOrUpdateCustomer(customer);

        // Take order from session
        Cart cart = (Cart) session.getAttribute("cart");
        List<CartItem> listItems = cart.getItems();

        // Add order
        Order order = new Order();
        order.setId(orderID);
        order.setPhone(phone);
        order.setTotalPrice(totalPrice);
        order.setStatusID(1);
        order.setDate(orderDate);
        order.setPaymentMethod(paymentMethod);
        order.setShippingFee(shippingFee);
        db.addOrder(order);

        // Add orderDetails
        for (CartItem item : listItems) {
            for (int i = 0; i < item.getQuantity(); i++) {
                OrderDetail detail = new OrderDetail();
                detail.setOrderID(orderID);
                detail.setProductID(item.getCartProduct().getId());
                detail.setQuantity(1);
                detail.setPrice(item.getPrice());
                db.addOrderDetails(detail);
            }
        }
        session.setAttribute("orderID", orderID);
        session.setAttribute("customerName", fullName);
        session.setAttribute("customerPhone", phone);
        session.setAttribute("customerAddress", fullAddress);
        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("shippingFee", shippingFee);
        session.setAttribute("orderDate", orderDate);
        session.setAttribute("paymentMethod", paymentMethod);
        session.setAttribute("statusID", order.getStatusID());

        //Vnpay
        if ("VnPay".equals(paymentMethod)) {
            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String orderType = "other";
            long amount = totalPriceInVND * 100;
            String bankCode = request.getParameter("bankCode");

            String vnp_TxnRef = orderID;
            String vnp_IpAddr = Config.getIpAddress(request);

            String vnp_TmnCode = Config.vnp_TmnCode;

            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amount));
            vnp_Params.put("vnp_CurrCode", "VND");

            if (bankCode != null && !bankCode.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bankCode);
            }
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
            vnp_Params.put("vnp_OrderType", orderType);

            String locate = request.getParameter("language");
            if (locate != null && !locate.isEmpty()) {
                vnp_Params.put("vnp_Locale", locate);
            } else {
                vnp_Params.put("vnp_Locale", "vn");
            }
            vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

            List fieldNames = new ArrayList(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = (String) itr.next();
                String fieldValue = (String) vnp_Params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    //Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    //Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }
            String queryUrl = query.toString();
            String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
            queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
            String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", paymentUrl);
            Gson gson = new Gson();
            response.getWriter().write(gson.toJson(job));
            response.sendRedirect(paymentUrl);
        } else {
            session.removeAttribute("cart");
            response.sendRedirect("completion.jsp");
        }
    }

    private String generateOrderID(String phone) {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("H'H'm'M'-d'-'M'-'uuuu");
        String formattedDateTime = now.format(formatter);
        return formattedDateTime + "U" + phone;
    }

    private String orderDate() {
        LocalDate current = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = current.format(formatter);
        return formattedDate;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
