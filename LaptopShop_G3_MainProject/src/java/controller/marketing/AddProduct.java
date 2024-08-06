/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.marketing;

import dal.ManagerMarketingDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Brand;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author VietAnh
 */
public class AddProduct extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("AddNewProduct.jsp").forward(request, response);
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
        ManagerMarketingDBContext manaDB = new ManagerMarketingDBContext();
        String productId = request.getParameter("productCode");
        
        // Add new product
        String priceStr = request.getParameter("price");
        String salePriceStr = request.getParameter("salePrice");
        
        Product p = new Product();
        p.setId(productId);
        p.setName(request.getParameter("name"));
        p.setImage(request.getParameter("image"));
        p.setWarranty(request.getParameter("warranty"));
        p.setDescription(request.getParameter("description"));
        
        if(priceStr != null && !priceStr.isEmpty()){
            float price = Float.parseFloat(priceStr);
            p.setPrice(price);
        }
        
        if(salePriceStr != null && !salePriceStr.isEmpty()){
            float salePrice = Float.parseFloat(salePriceStr);
            p.setSalePrice(salePrice);
        }
        
        Brand b = new Brand();
        b.setId(request.getParameter("brand"));
        p.setBrand_ID(b);
        
        manaDB.addNewProduct(p);
        
        
        // Add detail product
        ProductDetail pd = new ProductDetail();
        pd.setCpu(request.getParameter("cpu"));
        pd.setRam(request.getParameter("ram"));
        pd.setStorage(request.getParameter("storage"));
        pd.setGpu(request.getParameter("gpu"));
        pd.setScreen(request.getParameter("screen"));
        pd.setBattery(request.getParameter("battery"));
        pd.setWeight(request.getParameter("weight"));
        pd.setColor(request.getParameter("color"));
        pd.setOs(request.getParameter("os"));
        
        manaDB.addDetailProduct(pd, productId);
        
//        response.getWriter().println(p.getId());
//        response.getWriter().println(p.getName());
//        response.getWriter().println(p.getPrice());
//        response.getWriter().println(p.getImage());
//        response.getWriter().println(p.getDescription());
//        response.getWriter().println(p.getSalePrice());
//        response.getWriter().println(p.getWarranty());
//        response.getWriter().println(pd.getBattery());
//        response.getWriter().println(pd.getGpu());
//        response.getWriter().println(pd.getWeight());
//        
          response.sendRedirect("manaProduct");
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
