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
import model.CartProduct;
import model.Order;
import model.MyOrderList;

/**
 *
 * @author vutie
 */
public class MyOrderDAO extends DBContext {

    public List<MyOrderList> getOrderList(String phone) {
        List<MyOrderList> orderLists = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "     o.Order_ID,\n"
                    + "     o.Customer_Phone,\n"
                    + "     o.Order_TotalPrice,\n"
                    + "     prod.Product_Image,\n"
                    + "     prod.Product_Name,\n"
                    + "     o.Order_Date,\n"
                    + "     os.OrderStatus_Name,\n"
                    + "     prod.Other_Products_Count\n"
                    + " FROM \n"
                    + "     [Order] o\n"
                    + " JOIN \n"
                    + "     [Order_Status] os ON os.OrderStatus_ID = o.OrderStatus_ID\n"
                    + " JOIN \n"
                    + "(\n"
                    + "     SELECT \n"
                    + "          od.Order_ID,\n"
                    + "          p.Product_Image,\n"
                    + "          p.Product_Name,\n"
                    + "          ROW_NUMBER() OVER (PARTITION BY od.Order_ID ORDER BY od.Product_ID) as rn,	\n"
                    + "          COUNT(*) OVER (PARTITION BY od.Order_ID) - 1 AS Other_Products_Count\n"
                    + "          FROM \n"
                    + "             [Order_Detail] od\n"
                    + "          JOIN \n"
                    + "             [Product] p ON p.Product_ID = od.Product_ID\n"
                    + ") AS prod ON prod.Order_ID = o.Order_ID\n"
                    + "WHERE \n"
                    + "o.Customer_Phone = ?\n"
                    + "AND prod.rn = 1;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, phone);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                MyOrderList o = new MyOrderList();
                o.setId(rs.getString(1));
                o.setPhone(rs.getString(2));
                o.setTotalPrice(rs.getFloat(3));
                o.setProductImages(rs.getString(4));
                o.setProductNames(rs.getString(5));
                o.setDate(rs.getString(6));
                o.setStatus(rs.getString(7));
                o.setOtherProduct(rs.getInt(8));
                orderLists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderLists;
    }

    public static void main(String[] args) {
        MyOrderDAO db = new MyOrderDAO();
        List<MyOrderList> listOrder = db.getOrderList("0975935040");
        for (MyOrderList o : listOrder) {
            System.out.println("Order ID: " + o.getId());
            System.out.println("Customer Phone: " + o.getPhone());
            System.out.println("Total Price: " + o.getTotalPrice());
            System.out.println("Product Images: " + o.getProductImages());
            System.out.println("Product Names: " + o.getProductNames());
            System.out.println("Order Date: " + o.getDate());
            System.out.println("Order Status: " + o.getStatus());
            System.out.println();
        }

    }
}
