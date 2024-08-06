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
import java.util.ArrayList;
import model.ProductImg;

/**
 *
 * @author VietAnh
 */
public class ManagerProductIMG extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ManagerMarketingDBContext manaDB = new ManagerMarketingDBContext();
        String pid = request.getParameter("pid");
        ArrayList<ProductImg> listImage = manaDB.getListImage(pid);
        request.setAttribute("listImage", listImage);
        
        
        request.getRequestDispatcher("manaProductIMG.jsp").forward(request, response);
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
    String pid = request.getParameter("pid");

    ArrayList<ProductImg> existingImages = manaDB.getListImage(pid);
    int currentImageCount = existingImages.size();
    int maxImages = 4;

    // Update existing images
    for (int i = 0; i < currentImageCount; i++) {
        String imgUrl = request.getParameter("image" + (i + 1));
        if (imgUrl != null && !imgUrl.trim().isEmpty()) {
            existingImages.get(i).setImg_url(imgUrl);
            manaDB.updateListImageProduct(existingImages.get(i));
        }
    }

    // Add new images
    for (int i = currentImageCount + 1; i <= maxImages; i++) {
        String imgUrl = request.getParameter("image" + i);
        if (imgUrl != null && !imgUrl.trim().isEmpty()) {
            ProductImg pimg = new ProductImg();
            pimg.setProductID(pid);
            pimg.setImg_url(imgUrl);
            manaDB.addListImageProduct(pimg);
        }
    }
        
        response.sendRedirect("manaProductIMG?pid=" +pid );
        
//        pimg.setProductID(request.getParameter(pid));
//        manaDB.updateListImageProduct(pimg);
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
