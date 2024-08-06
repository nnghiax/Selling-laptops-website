/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.MyOrderList;
import model.Product;
import model.ProductDetail;
import model.ProductImg;

/**
 *
 * @author vutie
 */
public class ImportGoodsDAO extends DBContext {
    
    public List<Product> getProductList() {
        List<Product> productLists = new ArrayList<>();
        try {
            String sql = "SELECT [Product_ID]\n"
                    + "      ,[Product_Name]\n"
                    + "      ,[Product_Image]\n"
                    + "  FROM [dbo].[Product]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString(1));
                p.setName(rs.getString(2));
                p.setImage(rs.getString(3));
                productLists.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productLists;
    }
    
    public void importGoods(String productID, String productSerial, String date) {
        String sql = "INSERT INTO [dbo].[Product_Serial]\n"
                + "           ([ProductSerial_ID]\n"
                + "           ,[Product_ID]\n"
                + "           ,[ProductSerial_Status]\n"
                + "           ,[ProductSerial_CheckInDate])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productSerial);
            ps.setString(2, productID);
            ps.setString(3, "1");
            ps.setString(4, date);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Product getProduct(String productID) {
        try {
            String sql = "SELECT \n"
                    + "      [Product_ID]\n"
                    + "      ,[Product_Name]\n"
                    + "      ,[Product_Image]\n"
                    + "  FROM [LaptopShop_Grp3].[dbo].[Product]\n"
                    + "where Product_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, productID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setImage(rs.getString("Product_Image"));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        ImportGoodsDAO db = new ImportGoodsDAO();
//        Product product = db.getProduct("NBDE0857");
//        System.out.println(product.getName());
//        System.out.println(product.getId());
//        System.out.println(product.getImage());

        String productID = "NBLG0041TL";
        String productSerial = "LG1239as";
        String date = "2024/07/26";
        db.importGoods(productID, productSerial, date);
    }
}
