/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import com.oracle.wls.shaded.org.apache.bcel.generic.DDIV;
import dal.DashboardDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BlogNumByDate;
import model.BlogStatusByDate;
import model.BrandProductQuantity;
import model.RichCustomer;
import model.StarRate;

/**
 *
 * @author Nguyen Bao
 */
public class DashboardServlet extends HttpServlet {

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
            out.println("<title>Servlet DashboardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardServlet at " + request.getContextPath() + "</h1>");
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
        try {
            DashboardDAO dd = new DashboardDAO();
            String from = request.getParameter("from-start");
            String end = request.getParameter("from-end");

            int blognum = dd.getBlogQuantity();
            int productnum = dd.getProductQuantity();
            int customernum = dd.getCustomerQuantity();
            int feedbacknum = dd.getFeedbackrQuantity();
            ArrayList<BlogStatusByDate> stt2 = dd.getStatusQuantityByDate(from, end);
            ArrayList<BlogNumByDate> statistic = dd.getBlogQuantityByDate(from, end);
            ArrayList<BrandProductQuantity> brandproductquantity = dd.getBrandProductQuantity();
            ArrayList<StarRate> starrate = dd.getStarRate();

            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter dateFormatter = new DateTimeFormatterBuilder()
                    .appendPattern("yyyy-MM-dd")
                    .parseDefaulting(ChronoField.HOUR_OF_DAY, 0)
                    .parseDefaulting(ChronoField.MINUTE_OF_HOUR, 0)
                    .parseDefaulting(ChronoField.SECOND_OF_MINUTE, 0)
                    .toFormatter();
            String currentDate = now.format(dateFormatter);
            LocalDateTime sevenDaysAgo = now.minusDays(7);
            String sevenDaysAgoDate = sevenDaysAgo.format(dateFormatter);

            request.setAttribute("starrate", starrate);
            request.setAttribute("now", currentDate);
            request.setAttribute("sevendaysago", sevenDaysAgoDate);
            request.setAttribute("productquantity", brandproductquantity);
            request.setAttribute("statistic2", stt2);
            request.setAttribute("statistic", statistic);
            request.setAttribute("blognum", blognum);
            request.setAttribute("productnum", productnum);
            request.setAttribute("customernum", customernum);
            request.setAttribute("feedbacknum", feedbacknum);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DashboardServlet.class.getName()).log(Level.SEVERE, null, ex);
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
