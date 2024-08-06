/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.lang.invoke.VarHandle;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.CartItem;
import model.CartProduct;
import model.Customer;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author vutie
 */
public class CheckOutDAO extends DBContext {

    public Customer getCustomerInfoByID(String id) {
        try {
            String sql = "SELECT [Customer_Phone]\n"
                    + "      ,[Customer_Name]\n"
                    + "      ,[Customer_Address]\n"
                    + "  FROM [dbo].[Customer]"
                    + "where [Customer_Phone] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String phone = rs.getString("Customer_Phone");
                String name = rs.getString("Customer_Name");
                String address = rs.getString("Customer_Address");
                return new Customer(phone, name, address);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addCustomer(Customer customer) {
        try {
            String sql = "INSERT INTO [dbo].[Customer]\n"
                    + "           ([Customer_Phone]\n"
                    + "           ,[Customer_Name]\n"
                    + "           ,[Customer_Address])\n"
                    + "     VALUES (?, ?, ?)";
            PreparedStatement sta = connection.prepareStatement(sql);
            sta.setString(1, customer.getPhone());
            sta.setString(2, customer.getName());
            sta.setString(3, customer.getAddress());
            sta.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addOrder(Order order) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([Order_ID]\n"
                + "           ,[Customer_Phone]\n"
                + "           ,[Order_TotalPrice]\n"
                + "           ,[OrderStatus_ID]\n"
                + "           ,[Order_Date]\n"
                + "           ,[Order_PaymentMethod]\n"
                + "           ,[Order_ShippingFee])\n"
                + "     VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, order.getId());
            ps.setString(2, order.getPhone());
            ps.setFloat(3, order.getTotalPrice());
            ps.setInt(4, order.getStatusID());
            ps.setString(5, order.getDate());
            ps.setString(6, order.getPaymentMethod());
            ps.setFloat(7, order.getShippingFee());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addOrderDetails(OrderDetail detail) {
        String sql = "INSERT INTO [dbo].[Order_Detail]\n"
                + "           ([Order_ID]\n"
                + "           ,[Product_ID]\n"
                + "           ,[Quantity]\n"
                + "           ,[ProductPrice])\n"
                + "     VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, detail.getOrderID());
            ps.setString(2, detail.getProductID());
            ps.setInt(3, detail.getQuantity());
            ps.setFloat(4, detail.getPrice());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean isCustomerExists(String phone) {
        String sql = "SELECT * FROM [dbo].[Customer] WHERE [Customer_Phone] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void updateCustomer(Customer customer) {
        try {
            String sql = "UPDATE [dbo].[Customer]\n"
                    + "SET [Customer_Name] = ?, [Customer_Address] = ?\n"
                    + "WHERE [Customer_Phone] = ?";
            PreparedStatement sta = connection.prepareStatement(sql);
            sta.setString(1, customer.getName());
            sta.setString(2, customer.getAddress());
            sta.setString(3, customer.getPhone());
            sta.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addOrUpdateCustomer(Customer customer) {
        if (isCustomerExists(customer.getPhone())) {
            updateCustomer(customer);
        } else {
            addCustomer(customer);
        }
    }

    public void deleteOrderDetailsByOrderID(String orderID) {
        String sql = "DELETE FROM [dbo].[Order_Detail] WHERE [Order_ID] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, orderID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrderByID(String orderID) {
        String sql = "DELETE FROM [dbo].[Order] WHERE [Order_ID] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, orderID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        CheckOutDAO db = new CheckOutDAO();
        db.addCustomer(new Customer("0907665142", "Vuong", "123 Giang Vo"));
        db.addOrder(new Order("456456456", "0907665142", 2420, 1, "07/11/2024", "Vnpay", 0));
    }
}
