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
import model.Customer;
import model.Instock;
import model.Order;
import model.OrderItem;
import model.OrderList;

/**
 *
 * @author vutie
 */
public class OrderListDAO extends DBContext {

    public List<OrderList> getOrderList() {
        List<OrderList> orderLists = new ArrayList<>();
        try {
            String sql = "SELECT o.[Order_ID]\n"
                    + "      ,o.[Order_TotalPrice]\n"
                    + "	  ,o.[Order_PaymentMethod]\n"
                    + "	  ,os.OrderStatus_Name\n"
                    + "      ,o.[Order_Date]\n"
                    + "      ,o.[Order_ShippingFee]\n"
                    + "	  ,o.[Customer_Phone]\n"
                    + "	  ,o.[OrderStatus_ID]\n"
                    + "    ,o.[Sale_Staff]\n"
                    + "    ,o.[Warehouse_Staff]\n"
                    + "  FROM [dbo].[Order] o\n"
                    + "  JOIN Order_Status os on o.OrderStatus_ID=os.OrderStatus_ID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderList o = new OrderList();
                o.setId(rs.getString(1));
                o.setTotalPrice(rs.getFloat(2));
                o.setPaymentMethod(rs.getString(3));
                o.setStatus(rs.getString(4));
                o.setDate(rs.getString(5));
                o.setShippingFee(rs.getFloat(6));
                o.setOrderItem(getOrderItems(rs.getString(1)));
                o.setCustomer(getCustomer(rs.getString(7)));
                o.setStatusID(rs.getInt(8));
                o.setSaleStaff(rs.getString(9));
                o.setWhStaff(rs.getString(10));
                orderLists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderLists;
    }

    public List<OrderList> searchOrders(String search) {
        List<OrderList> orderLists = new ArrayList<>();
        try {
            String sql = "SELECT o.[Order_ID]\n"
                    + ",o.[Order_TotalPrice]\n"
                    + ",o.[Order_PaymentMethod]\n"
                    + ",os.OrderStatus_Name\n"
                    + ",o.[Order_Date]\n"
                    + ",o.[Order_ShippingFee]\n"
                    + ",o.[Customer_Phone]\n"
                    + ",o.[OrderStatus_ID]\n"
                    + ",o.[Sale_Staff]\n"
                    + ",o.[Warehouse_Staff]\n"
                    + "FROM [dbo].[Order] o\n"
                    + "JOIN Order_Status os on o.OrderStatus_ID=os.OrderStatus_ID\n"
                    + "WHERE o.[Order_ID] LIKE ? or o.Customer_Phone LIKE ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + search + "%");
            statement.setString(2, "%" + search + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderList o = new OrderList();
                o.setId(rs.getString(1));
                o.setTotalPrice(rs.getFloat(2));
                o.setPaymentMethod(rs.getString(3));
                o.setStatus(rs.getString(4));
                o.setDate(rs.getString(5));
                o.setShippingFee(rs.getFloat(6));
                o.setOrderItem(getOrderItems(rs.getString(1)));
                o.setCustomer(getCustomer(rs.getString(7)));
                o.setStatusID(rs.getInt(8));
                o.setSaleStaff(rs.getString(9));
                o.setWhStaff(rs.getString(10));
                orderLists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderLists;
    }

    public List<OrderList> getOrderListByStatus(String status) {
        List<OrderList> orderLists = new ArrayList<>();
        try {
            String sql = "SELECT o.[Order_ID]\n"
                    + "      ,o.[Order_TotalPrice]\n"
                    + "	  ,o.[Order_PaymentMethod]\n"
                    + "	  ,os.OrderStatus_Name\n"
                    + "      ,o.[Order_Date]\n"
                    + "      ,o.[Order_ShippingFee]\n"
                    + "	  ,o.[Customer_Phone]\n"
                    + "	  ,o.[OrderStatus_ID]\n"
                    + ",o.[Sale_Staff]\n"
                    + ",o.[Warehouse_Staff]\n"
                    + "  FROM [dbo].[Order] o\n"
                    + "  JOIN Order_Status os on o.OrderStatus_ID=os.OrderStatus_ID\n"
                    + "  WHERE os.OrderStatus_Name = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderList o = new OrderList();
                o.setId(rs.getString(1));
                o.setTotalPrice(rs.getFloat(2));
                o.setPaymentMethod(rs.getString(3));
                o.setStatus(rs.getString(4));
                o.setDate(rs.getString(5));
                o.setShippingFee(rs.getFloat(6));
                o.setOrderItem(getOrderItems(rs.getString(1)));
                o.setCustomer(getCustomer(rs.getString(7)));
                o.setStatusID(rs.getInt(8));
                o.setSaleStaff(rs.getString(9));
                o.setWhStaff(rs.getString(10));
                orderLists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderLists;
    }

    public OrderList getOrderListDetail(String orderID) {
        try {
            String sql = "SELECT o.[Order_ID]\n"
                    + ",o.[Order_TotalPrice]\n"
                    + ",o.[Order_PaymentMethod]\n"
                    + ",os.OrderStatus_Name\n"
                    + ",o.[Order_Date]\n"
                    + ",o.[Order_ShippingFee]\n"
                    + ",o.[Customer_Phone]\n"
                    + ",o.[OrderStatus_ID]\n"
                    + ",o.[Sale_Staff]\n"
                    + ",o.[Warehouse_Staff]\n"
                    + "FROM [dbo].[Order] o\n"
                    + "JOIN Order_Status os on o.OrderStatus_ID=os.OrderStatus_ID\n"
                    + "WHERE o.[Order_ID] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, orderID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderList o = new OrderList();
                o.setId(rs.getString(1));
                o.setTotalPrice(rs.getFloat(2));
                o.setPaymentMethod(rs.getString(3));
                o.setStatus(rs.getString(4));
                o.setDate(rs.getString(5));
                o.setShippingFee(rs.getFloat(6));
                o.setOrderItem(getOrderItems(rs.getString(1)));
                o.setCustomer(getCustomer(rs.getString(7)));
                o.setStatusID(rs.getInt(8));
                o.setSaleStaff(rs.getString(9));
                o.setWhStaff(rs.getString(10));
                return o;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<OrderItem> getOrderItems(String orderID) {
        List<OrderItem> orderItems = new ArrayList<>();
        try {
            String sql = "SELECT od.[OrderDetail_ID]\n"
                    + ",od.[Product_ID]\n"
                    + ",p.Product_Name\n"
                    + ",p.Product_Image\n"
                    + ",od.[Quantity]\n"
                    + ",od.[ProductPrice]\n"
                    + ",od.[OrderDetail_Note]\n"
                    + ",od.[ProductSerial]"
                    + " FROM [dbo].[Order_Detail] od\n"
                    + "JOIN Product p ON p.Product_ID = od.Product_ID\n"
                    + "WHERE od.Order_ID=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, orderID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderItem o = new OrderItem();
                o.setOrderDetailID(rs.getInt(1));
                o.setProductID(rs.getString(2));
                o.setProductName(rs.getString(3));
                o.setProductImg(rs.getString(4));
                o.setQuantity(rs.getInt(5));
                o.setProductPrice(rs.getFloat(6));
                o.setNote(rs.getString(7));
                o.setSerial(rs.getString(8));
                orderItems.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderItems;
    }

    public Customer getCustomer(String phone) {
        try {
            String sql = "SELECT [Customer_Phone]\n"
                    + "      ,[Customer_Name]\n"
                    + "      ,[Customer_Address]\n"
                    + "  FROM [dbo].[Customer]\n"
                    + "  WHERE [Customer_Phone] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, phone);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setPhone(rs.getString(1));
                c.setName(rs.getString(2));
                c.setAddress(rs.getString(3));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateOrderStatus(int orderStatusID, String orderID) throws SQLException {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [OrderStatus_ID] = ?\n"
                + " WHERE [Order_ID] = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderStatusID);
            st.setString(2, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateOrderNote(int orderStatusID, String note) throws SQLException {
        String sql = "UPDATE [dbo].[Order_Detail]\n"
                + "   SET [OrderDetail_Note] = ?\n"
                + " WHERE [OrderDetail_ID] = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, note);
            st.setInt(2, orderStatusID);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateOrderSerial(int orderStatusID, String productSerial) throws SQLException {
        String sql = "UPDATE [dbo].[Order_Detail]\n"
                + "   SET [ProductSerial] = ?\n"
                + " WHERE [OrderDetail_ID] = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, productSerial);
            st.setInt(2, orderStatusID);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateOrderSaleStaff(String orderid, String saleStaff) throws SQLException {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [Sale_Staff] = ?\n"
                + " WHERE [Order_ID] = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, orderid);
            st.setString(2, saleStaff);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateOrderWHStaff(String orderid, String whStaff) throws SQLException {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [Warehouse_Staff] = ?\n"
                + " WHERE [Order_ID] = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, orderid);
            st.setString(2, whStaff);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<Order> selectOrdersByDateRange(String startDate, String endDate) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM [Order] WHERE Order_Date BETWEEN ? AND ?";
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, startDate);
            preparedStatement.setString(2, endDate);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String id = rs.getString("Order_ID");
                String phone = rs.getString("Customer_Phone");
                float totalPrice = rs.getFloat("Order_TotalPrice");
                int statusID = rs.getInt("OrderStatus_ID");
                String date = rs.getString("Order_Date");
                String paymentMethod = rs.getString("Order_PaymentMethod");
                float shippingFee = rs.getFloat("Order_ShippingFee");
                orders.add(new Order(id, phone, totalPrice, statusID, date, paymentMethod, shippingFee));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> selectOrdersLast7Days() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM [Order] WHERE Order_Date >= DATEADD(day, -7, GETDATE())";
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(sql); ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                String id = rs.getString("Order_ID");
                String phone = rs.getString("Customer_Phone");
                float totalPrice = rs.getFloat("Order_TotalPrice");
                int statusID = rs.getInt("OrderStatus_ID");
                String date = rs.getString("Order_Date");
                String paymentMethod = rs.getString("Order_PaymentMethod");
                float shippingFee = rs.getFloat("Order_ShippingFee");
                orders.add(new Order(id, phone, totalPrice, statusID, date, paymentMethod, shippingFee));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static void main(String[] args) throws SQLException {
        OrderListDAO db = new OrderListDAO();
        OrderList o = db.getOrderListDetail("3H57M-18-7-2024U0978564528");
        System.out.println(o);
    }
}
