/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Admin;

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
import model.BrandProductQuantity;
import model.BrandSold;
import model.ProductSoldOrInStock;
import model.RichCustomer;
import model.SaleTrend;
import model.StarRate;

/**
 *
 * @author Nguyen Bao
 */
public class admindashboardfeature extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet admindashboardfeature</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet admindashboardfeature at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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

            double revenues = dd.getRevenues();
            int productnum = dd.getProductQuantity();
            int customernum = dd.getCustomerQuantity();
            double staravg = dd.getStarAverage();
            ArrayList<StarRate> starrate = dd.getStarRate();
            ArrayList<ProductSoldOrInStock> prd = dd.getProductSoldOrInstock();
            ArrayList<RichCustomer> richcustomer = dd.getRichCustomers();
            ArrayList<BrandProductQuantity> brandproductquantity = dd.getBrandProductQuantity();
            ArrayList<SaleTrend> saletrend = dd.getSaleTrend(from, end);
            ArrayList<BrandSold> brandsold = dd.getBrandSold(from, end);

            LocalDateTime now = LocalDateTime.now();
// Định dạng thời gian thành chỉ ngày
            DateTimeFormatter dateFormatter = new DateTimeFormatterBuilder()
                    .appendPattern("yyyy-MM-dd")
                    .parseDefaulting(ChronoField.HOUR_OF_DAY, 0)
                    .parseDefaulting(ChronoField.MINUTE_OF_HOUR, 0)
                    .parseDefaulting(ChronoField.SECOND_OF_MINUTE, 0)
                    .toFormatter();
            String currentDate = now.format(dateFormatter);

// Lấy thời gian 7 ngày trước
            LocalDateTime sevenDaysAgo = now.minusDays(7);
            String sevenDaysAgoDate = sevenDaysAgo.format(dateFormatter);

            request.setAttribute("brandsold", brandsold);
            request.setAttribute("saletrend", saletrend);
            request.setAttribute("productquantity", brandproductquantity);
            request.setAttribute("rich", richcustomer);
            request.setAttribute("prd", prd);
            request.setAttribute("starrate", starrate);
            request.setAttribute("now", currentDate);
            request.setAttribute("sevendaysago", sevenDaysAgoDate);
            request.setAttribute("revenues", revenues);
            request.setAttribute("productnum", productnum);
            request.setAttribute("customernum", customernum);
            request.setAttribute("staravg", staravg);
            request.getRequestDispatcher("admindashboardfeature.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AdminDashboard.class.getName()).log(Level.SEVERE, null, ex);
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
