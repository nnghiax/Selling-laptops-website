/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.marketing;

import dal.CategoryDBContext;
import dal.ManagerMarketingDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author VietAnh
 */
public class ManagerProduct extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ManagerMarketingDBContext proDB = new ManagerMarketingDBContext();
        ProductDBContext db = new ProductDBContext();
        

         // List category
        CategoryDBContext cateDB = new CategoryDBContext();
        ArrayList<Category> listCategory = cateDB.getListCategory();
        request.setAttribute("listCategory", listCategory);

        // List brand
        ArrayList<Brand> listBrand = db.getListBrand();
        request.setAttribute("listBrand", listBrand);

        // Count total product
        int countP = proDB.countTotalProduct();
        request.setAttribute("countP", countP);

        // Get total product
        int count = proDB.getTotalProduct();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }
        request.setAttribute("endP", endPage);

        // Paging product
        String indexStr = request.getParameter("index");
        int index = (indexStr == null || indexStr.isEmpty()) ? 1 : Integer.parseInt(indexStr);
        ArrayList<Product> pagingProduct = proDB.pagingProduct(index);
        request.setAttribute("products", pagingProduct);

        // Filter product by name || minPrice || maxPrice || brand
        String name = request.getParameter("name");
        String maxPriceStr = request.getParameter("upPrice");
        String minPriceStr = request.getParameter("downPrice");
        String brand = request.getParameter("brand");

        Float minPrice = (minPriceStr != null && !minPriceStr.isEmpty()) ? Float.parseFloat(minPriceStr) : null;
        Float maxPrice = (maxPriceStr != null && !maxPriceStr.isEmpty()) ? Float.parseFloat(maxPriceStr) : null;

        if (name != null || minPrice != null || maxPrice != null || brand != null) {
            ArrayList<Product> filteredProducts = proDB.FilterProduct(name, minPrice, maxPrice, brand);
            request.setAttribute("products", filteredProducts);
        } else {
            request.setAttribute("products", pagingProduct);
        }

        request.getRequestDispatcher("manaProduct.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
