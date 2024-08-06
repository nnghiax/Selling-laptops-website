/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.marketing;

import dal.BlogListDAO;
import dal.ProductDBContext;
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
import model.Blog;
import model.BlogPostType;
import model.Product;

/**
 *
 * @author Nguyen Bao
 */
public class BlogSearch extends HttpServlet {
   
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
            out.println("<title>Servlet BlogSearch</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogSearch at " + request.getContextPath () + "</h1>");
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
            String a = request.getParameter("searchbox").trim();
            ProductDBContext proDB = new ProductDBContext();
            BlogListDAO bld = new BlogListDAO();
            ArrayList<Blog> b = bld.getBlogListBySearch(a);
            ArrayList<BlogPostType> lstblog = bld.getBlogType();
            ArrayList<Product> p = proDB.getProductsBlog();

            request.setAttribute("newsproduct", p);
            request.setAttribute("lstBlogType", lstblog);
            request.setAttribute("newsdown", b);
            request.getRequestDispatcher("blogsearch.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BlogSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            String a = request.getParameter("searchbox");
            BlogListDAO bld = new BlogListDAO();
            ArrayList<Blog> b = bld.getBlogListBySearch(a);
            
            request.setAttribute("newsdown", b);
            request.getRequestDispatcher("blogsearch.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BlogSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
