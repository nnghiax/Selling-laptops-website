/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.ImportGoodsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import model.Product;

/**
 *
 * @author vutie
 */
public class ImportGoodsController extends HttpServlet {

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
            out.println("<title>Servlet ImportGoodsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportGoodsController at " + request.getContextPath() + "</h1>");
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
        String productID = request.getParameter("productId");

        if (productID != null && !productID.isEmpty()) {
            ImportGoodsDAO db = new ImportGoodsDAO();
            Product product = db.getProduct(productID);
            if (product != null) {
                Gson gson = new Gson();
                String productJson = gson.toJson(product);

                response.setContentType("application/json");
                try (PrintWriter out = response.getWriter()) {
                    out.print(productJson);
                    out.flush();
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            }
        } else {
            ImportGoodsDAO db = new ImportGoodsDAO();
            List<Product> productList = db.getProductList();

            request.setAttribute("productList", productList);
            request.getRequestDispatcher("importGoods.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String productID = request.getParameter("productID");
        String productSerials = request.getParameter("productSerials");
        String importGoodsDate = orderDate();

        session.removeAttribute("message");
        session.removeAttribute("error");

        if (productID != null && !productID.isEmpty() && productSerials != null && !productSerials.isEmpty()) {
            List<String> serialList = Arrays.asList(productSerials.split("\\r?\\n"));
            ImportGoodsDAO db = new ImportGoodsDAO();

            try {
                for (String serial : serialList) {
                    serial = serial.trim();
                    if (!serial.isEmpty() && serial.length() <= 20) {
                        db.importGoods(productID, serial, importGoodsDate);
                    } else {
                        session.setAttribute("error", "Serial length exceeds limit or is empty.");
                    }
                }
                if (session.getAttribute("error") == null) {
                    session.setAttribute("message", "Import successfully!");
                }
            } catch (Exception e) {
                session.setAttribute("error", "Error during import: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            session.setAttribute("error", "ProductID or Serials are empty!");
        }
        response.sendRedirect("importGoods");
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
