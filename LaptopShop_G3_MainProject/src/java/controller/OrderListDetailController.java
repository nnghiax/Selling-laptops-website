/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderListDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OrderList;

/**
 *
 * @author vutie
 */
public class OrderListDetailController extends HttpServlet {

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
            out.println("<title>Servlet OrderListDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderListDetailController at " + request.getContextPath() + "</h1>");
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
        OrderListDAO db = new OrderListDAO();
        String orderID = request.getParameter("orderID");
        OrderList orderList = db.getOrderListDetail(orderID);
        request.setAttribute("orderListDetail", orderList);
        request.getRequestDispatcher("orderListDetail.jsp").forward(request, response);
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
        try {
            String orderID = request.getParameter("orderId");
            int statusID = Integer.parseInt(request.getParameter("status"));
            String userID = (String) request.getSession().getAttribute("userID");

            OrderListDAO db = new OrderListDAO();
            db.updateOrderStatus(statusID, orderID);

            Enumeration<String> parameterNames = request.getParameterNames();

            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                if (paramName.startsWith("note_")) {
                    int orderDetailId = Integer.parseInt(paramName.substring(paramName.indexOf("_") + 1));
                    String note = request.getParameter(paramName);
                    if (note != null && !note.trim().isEmpty()) {
                        db.updateOrderNote(orderDetailId, note);
                    }
                } else if (paramName.startsWith("serial_")) {
                    int orderDetailId = Integer.parseInt(paramName.substring(paramName.indexOf("_") + 1));
                    String serial = request.getParameter(paramName);
                    if (serial != null && !serial.trim().isEmpty()) {
                        db.updateOrderSerial(orderDetailId, serial);
                    }
                }
            }
            
            if(statusID == 2){
                db.updateOrderSaleStaff(orderID, userID);
            } else if (statusID == 3) {
                db.updateOrderWHStaff(orderID, userID);
            }
            
            request.getSession().setAttribute("meassage", "Update order successfully");
            response.sendRedirect("orderList");
        } catch (SQLException ex) {
            Logger.getLogger(OrderListDetailController.class.getName()).log(Level.SEVERE, null, ex);
            request.getSession().setAttribute("meassage", "Update order successfully");
            response.sendRedirect("orderListDetail?orderID=" + request.getParameter("orderId"));
        }
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
