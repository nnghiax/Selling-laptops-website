/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.BlogListDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Nguyen Bao
 */
public class SortCustomerDashboard extends HttpServlet {

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
            out.println("<title>Servlet SortCustomerDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortCustomerDashboard at " + request.getContextPath() + "</h1>");
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
        BlogListDAO bld = new BlogListDAO();
        String attribute = request.getParameter("attribute");
        String order = request.getParameter("order");

        try {
            ArrayList<User> customersorted = null;
            if (attribute != null && order != null) {
                switch (attribute) {
                    case "name":
                        customersorted = "asc".equals(order) ? bld.sortCustomerByNameAsc() : bld.sortCustomerByNameDesc();
                        break;
                    case "email":
                        customersorted = "asc".equals(order) ? bld.sortCustomerByEmailAsc() : bld.sortCustomerByEmailDesc();
                        break;
                    case "phone":
                        customersorted = "asc".equals(order) ? bld.sortCustomerByPhoneAsc() : bld.sortCustomerByPhoneDesc();
                        break;
                }
                request.setAttribute("customer", customersorted);
                request.setAttribute("attribute", attribute);
                request.setAttribute("order", order);
            }
            request.getRequestDispatcher("customerdashboard.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SortCustomerDashboard.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        processRequest(request, response);
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
