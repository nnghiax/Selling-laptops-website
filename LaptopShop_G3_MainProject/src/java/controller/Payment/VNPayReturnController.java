package controller.Payment;

import Config.Config;
import dal.CheckOutDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;
import model.CartItem;
import model.Customer;
import model.Order;
import model.OrderDetail;

public class VNPayReturnController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VNPayReturnController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VNPayReturnController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("vnpay_return.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String> fields = new HashMap<>();
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String[] paramValues = request.getParameterValues(paramName);
            String paramValue = "";
            if (paramValues.length > 0) {
                paramValue = paramValues[0];
            }
            fields.put(paramName, paramValue);
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }

        String signValue = Config.hashAllFields(fields);

        if (signValue.equals(vnp_SecureHash)) {
            String responseCode = fields.get("vnp_ResponseCode");
            if (!"00".equals(responseCode)) {
                CheckOutDAO db = new CheckOutDAO();
                HttpSession session = request.getSession();
                String orderID = (String) session.getAttribute("orderID");
                db.deleteOrderDetailsByOrderID(orderID);
                db.deleteOrderByID(orderID);
            }
            request.setAttribute("vnp_ResponseCode", responseCode);
            request.setAttribute("vnp_TransactionNo", fields.get("vnp_TransactionNo"));
            request.setAttribute("vnp_Amount", fields.get("vnp_Amount"));
            request.setAttribute("vnp_PaymentMethod", fields.get("vnp_PaymentMethod"));
            request.getRequestDispatcher("/vnpay_return.jsp").forward(request, response);
        } else {
            response.getWriter().write("Giao dịch that bai");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
