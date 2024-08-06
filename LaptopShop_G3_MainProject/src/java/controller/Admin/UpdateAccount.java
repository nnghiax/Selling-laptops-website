/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Admin;

import dal.ManagerAdminDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import model.User;

/**
 *
 * @author VietAnh
 */
public class UpdateAccount extends HttpServlet {
   
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
        ManagerAdminDBContext ad = new ManagerAdminDBContext();
        String uid = request.getParameter("userID");
        User userById = ad.getUserById(uid);
        

        
        request.setAttribute("user", userById);
        request.getRequestDispatcher("UpdateAccount.jsp").forward(request, response);
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
        ManagerAdminDBContext ad = new ManagerAdminDBContext();
        User u = new User();
        u.setUser_id(Integer.parseInt(request.getParameter("id")));
        u.setUser_name(request.getParameter("name"));
        u.setUser_password(request.getParameter("password"));
        u.setUser_email(request.getParameter("email"));
        u.setRole_id(request.getParameter("role"));
        u.setUser_phone(request.getParameter("phone"));
        u.setUser_image(request.getParameter("image_URL"));
        
        ad.updateUserById(u);
        
        //response.getWriter().println(u.getUserID());
        //response.getWriter().println(u.getUserName());
        //response.getWriter().println(u.getUserEmail());
        //response.getWriter().println(u.getUserRole());
        //response.getWriter().println(u.getUserImage());
        
        if(u.getUser_id() == 1){
            response.sendRedirect("profileAdmin");
        }else{
            response.sendRedirect("manaAccount");
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
