/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.CartProduct;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vutie
 */
public class CartDAO extends DBContext {

    public CartProduct getCartProductByID(String pid) {
        int stock = countInstockProduct(pid);
        try {
            String sql = "Select p.Product_ID, p.Product_Name, p.Product_SalePrice, p.Product_Image\n"
                    + "from Product p\n"
                    + "Where p.Product_ID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, pid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                Float price = rs.getFloat(3);
                String img = rs.getString(4);
                return new CartProduct(id, name, img, price, stock);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int countInstockProduct(String productID) {
        int instock = 0;
        try {
            String sql = "SELECT COUNT(*) AS Instock\n"
                    + "FROM [LaptopShop_Grp3].[dbo].[Product_Serial]\n"
                    + "WHERE [Product_ID] = ?\n"
                    + "AND [ProductSerial_Status] = 1;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, productID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                instock = rs.getInt("Instock");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return instock;
    }
    
    public static void main(String[] args) {
        String id = "NBAC0398";
        CartDAO db = new CartDAO();
        CartProduct product = db.getCartProductByID(id);
        System.out.println(product.getId() + product.getName() + "--"+  product.getStock());
    }
}
