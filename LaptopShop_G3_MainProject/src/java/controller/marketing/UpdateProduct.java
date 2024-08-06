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
public class UpdateProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ManagerMarketingDBContext proDB = new ManagerMarketingDBContext();
        String code = request.getParameter("code");
        Product productDetail = proDB.getProductDetail(code);
        request.setAttribute("product", productDetail);
        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
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
        String priceStr = request.getParameter("price");
        String salePriceStr = request.getParameter("salePrice");

        
        // Update product
        Product p = new Product();
        p.setId(productId);
        p.setName(request.getParameter("name"));
        p.setImage(request.getParameter("image"));
        p.setWarranty(request.getParameter("warranty"));
        p.setDescription(request.getParameter("description"));
        
        String brandId = request.getParameter("brand");
            Brand b = new Brand();
            b.setId(brandId);
            p.setBrand_ID(b);
        
        if (priceStr != null && !priceStr.isEmpty()) {
            float price = Float.parseFloat(priceStr);
            p.setPrice(price);
        }

        if (salePriceStr != null && !salePriceStr.isEmpty()) {
            float salePrice = Float.parseFloat(salePriceStr);
            p.setSalePrice(salePrice);
        }
       
        manaDB.updateProduct(p);
        
        
        // Update product detail
        ProductDetail pd = new ProductDetail();
        pd.setBattery(request.getParameter("battery"));
        pd.setColor(request.getParameter("color"));
        pd.setCpu(request.getParameter("cpu"));
        pd.setGpu(request.getParameter("gpu"));
        pd.setOs(request.getParameter("os"));
        pd.setRam(request.getParameter("ram"));
        pd.setScreen(request.getParameter("screen"));
        pd.setStorage(request.getParameter("storage"));
        pd.setWeight(request.getParameter("weight"));
        

        manaDB.updateProductDetail(pd, productId);

        
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
