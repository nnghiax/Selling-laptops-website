/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Category;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author HI
 */
public class CategoryDBContext extends DBContext {

     // List Category
    public ArrayList<Category> getListCategory() {
        ArrayList<Category> cats = new ArrayList<>();
        try {
            String sql = "SELECT [Category_ID]\n"
                    + "      ,[Category_Name]\n"
                    + "  FROM [Category]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getString("Category_ID"));
                c.setCategoryName(rs.getString("Category_Name"));
                cats.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cats;
    }

    // List product by category
    public ArrayList<Product> getProductByCategory(int cid) {
        ArrayList<Product> listPC = new ArrayList<>();
        try {
            String sql = "select p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image\n"
                    + "from Product p join Product_Category pc on p.Product_ID = pc.Product_ID\n"
                    + "where pc.Category_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                
                listPC.add(p);



            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPC;
    }

}
