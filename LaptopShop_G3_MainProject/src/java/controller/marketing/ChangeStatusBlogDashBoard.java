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
import model.BlogPostType;
import model.BlogStatus;
import model.User;

/**
 *
 * @author Nguyen Bao
 */
public class ChangeStatusBlogDashBoard extends HttpServlet {

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
            out.println("<title>Servlet ChangeStatusBlogDashBoard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeStatusBlogDashBoard at " + request.getContextPath() + "</h1>");
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
            BlogListDAO bl = new BlogListDAO();

            String idtrue = request.getParameter("idtrue");
            String idfalse = request.getParameter("idfalse");
            String category = request.getParameter("name");
            String authors = request.getParameter("authors");
            String status = request.getParameter("status");

            // Hàm update khi click nút
            bl.UpdateStatusToFalse(idtrue);
            bl.UpdateStatusToTrue(idfalse);

            // Lấy danh sách bài đăng và các loại bài đăng
            ArrayList<BlogStatus> bs = bl.getAllBlogList();
            ArrayList<BlogPostType> bpt = bl.getBlogType();
            ArrayList<User> author = bl.listAllAuthorBlog();

            request.setAttribute("author", author);
            request.setAttribute("bpt", bpt);
            request.setAttribute("bs", bs);

            // Truyền dữ liệu filter lên và đặt lại thuộc tính bs nếu filter được áp dụng
            ArrayList<BlogStatus> bloglistcate = null;
            ArrayList<BlogStatus> bloglistautho = null;
            ArrayList<BlogStatus> blogliststat = null;

            if (authors != null && !authors.isEmpty()) {
                bloglistautho = bl.filterAllBlogListManageByAuthor(authors);
                if (!bloglistautho.isEmpty()) {
                    request.setAttribute("bs", bloglistautho);
                }
            } else if (category != null && !category.isEmpty()) {
                bloglistcate = bl.filterAllBlogListManage(category);
                if (!bloglistcate.isEmpty()) {
                    request.setAttribute("bs", bloglistcate);
                }
            } else if (status != null && !status.isEmpty()) {
                blogliststat = bl.filterAllBlogListManageByStatus(status);
                if (!blogliststat.isEmpty()) {
                    request.setAttribute("bs", blogliststat);
                }
            }

            // Kiểm tra xem có filter nào được áp dụng, nếu không thì chuyển hướng đến trang mặc định
            if (bloglistcate == null && bloglistautho == null && blogliststat == null) {
                request.getRequestDispatcher("blogpostdashboard.jsp").forward(request, response);
            } else {
            // Nếu có filter được áp dụng, giữ nguyên trang hiện tại
                request.getRequestDispatcher("filterinblogdashboard").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChangeStatusBlogDashBoard.class.getName()).log(Level.SEVERE, null, ex);
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
