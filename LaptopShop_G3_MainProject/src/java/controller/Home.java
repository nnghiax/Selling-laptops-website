    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDBContext;
import dal.ProductDBContext;
import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Brand;
import model.Category;
import model.Product;
import model.ProductDetail;
import model.Slider;

/**
 *
 * @author VietAnh
 */
public class Home extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        // Danh sách danh mục
        CategoryDBContext caDB = new CategoryDBContext();
        SliderDAO sliderDao = new SliderDAO();
        ArrayList<Category> listCategory = caDB.getListCategory();
        request.setAttribute("listCategory", listCategory);
        
        // Danh sách sản phẩm bởi category
        String cidStr = request.getParameter("cid");
        if (cidStr != null) {
            int cid = Integer.parseInt(cidStr);
            ArrayList<Product> productByCategory = caDB.getProductByCategory(cid);
            request.setAttribute("products", productByCategory);
        }

        
        ProductDBContext proDB = new ProductDBContext();

        // Lấy các tham số từ yêu cầu
        String txtSearch = request.getParameter("txt");
        String sortType = request.getParameter("sort");
        String warranty = request.getParameter("warranty");
        String brandID = request.getParameter("brand");
        String color = request.getParameter("color");
        int page = 1;
        int pageSize = 9;

        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        ArrayList<Product> products;
        int totalProducts;

        if (txtSearch != null && !txtSearch.isEmpty()) {
            products = proDB.SearchProductByName(txtSearch);
            totalProducts = products.size();
        } else if (brandID != null && !brandID.isEmpty()) {
            products = proDB.getListProductByBrand(brandID);
            totalProducts = products.size();
        } else if (warranty != null && !warranty.isEmpty()) {
            products = proDB.getListProductByWarranty(warranty);
            totalProducts = products.size();
        } else if (color != null && !color.isEmpty()) {
            products = proDB.getListProductByColor(color);
            totalProducts = products.size();
        } else if (sortType != null && sortType.equals("asc")) {
            products = proDB.SortProductByPriceASC(page, pageSize);
            totalProducts = proDB.getTotalProducts();
        } else if (sortType != null && sortType.equals("desc")) {
            products = proDB.SortProductByPriceDES(page, pageSize);
            totalProducts = proDB.getTotalProducts();
        } else {
            products = proDB.getProducts(page, pageSize);
            totalProducts = proDB.getTotalProducts();
        }

        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        request.setAttribute("products", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);


        // Danh sách bảo hành
        ArrayList<Product> listWarranty = proDB.getListWarranty();
        request.setAttribute("listWarranty", listWarranty);
        List<Slider> sliders = sliderDao.selectAllSlidersActive();
        request.setAttribute("sliders", sliders);

        // Đếm số lượng sản phẩm theo bảo hành
        Map<String, Integer> countWarranty = new HashMap<>();
        for (Product product : listWarranty) {
            int count = proDB.CountWarranty(product.getWarranty());
            countWarranty.put(product.getWarranty(), count);
        }
        request.setAttribute("countW", countWarranty);

        // Danh sách thương hiệu
        ArrayList<Brand> listBrand = proDB.getListBrand();
        request.setAttribute("listBrand", listBrand);

        // Đếm số lượng sản phẩm theo thương hiệu
        Map<String, Integer> countProductByBrand = new HashMap<>();
        for (Brand brand : listBrand) {
            int count = proDB.CountProductByBrand(brand.getId());
            countProductByBrand.put(brand.getId(), count);
        }
        request.setAttribute("countP", countProductByBrand);

        // Danh sách màu sắc
        ArrayList<ProductDetail> listColor = proDB.getListColor();
        request.setAttribute("listColor", listColor);

        // Đếm số lượng sản phẩm theo màu sắc
        Map<String, Integer> CountProductByColor = new HashMap<>();
        for (ProductDetail pd : listColor) {
            int count = proDB.CountProductByColor(pd.getColor());
            CountProductByColor.put(pd.getColor(), count);
        }
        request.setAttribute("countC", CountProductByColor);

        // Đặt các tham số bộ lọc và sắp xếp làm thuộc tính để chuyển tiếp tới JSP
        request.setAttribute("txt", txtSearch);
        request.setAttribute("sort", sortType);
        request.setAttribute("warranty", warranty);
        request.setAttribute("brand", brandID);
        request.setAttribute("color", color);

        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
