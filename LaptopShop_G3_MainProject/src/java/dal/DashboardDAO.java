/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author Nguyen Bao
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Blog;
import model.BlogNumByDate;
import model.BlogStatusByDate;
import model.BrandProductQuantity;
import model.BrandSold;
import model.ProductSoldOrInStock;
import model.RevenueByDate;
import model.RichCustomer;
import model.SaleTrend;
import model.StarRate;
import model.TopProduct;

public class DashboardDAO extends DBContext {

    public int getBlogQuantity() throws SQLException {
        String sql = "SELECT COUNT(*) AS BlogNumber FROM BlogPost";
        int blogNumber = 0;

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            if (rs.next()) {
                blogNumber = rs.getInt("BlogNumber");
            }

        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
        }
        return blogNumber;
    }

    public int getProductQuantity() throws SQLException {
        String sql = "SELECT COUNT(*) AS WarerhouseNumber FROM Product_Serial";
        int productNumber = 0;

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            if (rs.next()) {
                productNumber = rs.getInt("WarerhouseNumber");
            }

        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
        }
        return productNumber;
    }

    public int getCustomerQuantity() throws SQLException {
        String sql = "SELECT COUNT(*) AS CustomerNumber FROM [User] where Role_ID = 4";
        int customerNumber = 0;

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            if (rs.next()) {
                customerNumber = rs.getInt("CustomerNumber");
            }

        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
        }
        return customerNumber;
    }

    public int getFeedbackrQuantity() throws SQLException {
        String sql = "SELECT COUNT(*) AS FeedbackNumber FROM Feedback";
        int feedbackNumber = 0;

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            if (rs.next()) {
                feedbackNumber = rs.getInt("FeedbackNumber");
            }

        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
        }
        return feedbackNumber;
    }

    public ArrayList<BlogNumByDate> getBlogQuantityByDate(String from, String to) throws SQLException {
        String sql = "SELECT CONVERT(DATE, BlogPost_Date) AS BlogPost_Date, COUNT(*) AS BlogPost_Count\n"
                + "FROM BlogPost\n"
                + "WHERE BlogPost_Date BETWEEN ? AND ?\n"
                + "GROUP BY CONVERT(DATE, BlogPost_Date)\n"
                + "ORDER BY BlogPost_Date;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, from);
        st.setString(2, to);
        ResultSet rs = st.executeQuery();
        ArrayList<BlogNumByDate> lst = new ArrayList<>();
        while (rs.next()) {
            BlogNumByDate u = new BlogNumByDate(rs.getString(1), rs.getInt(2));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<BlogStatusByDate> getStatusQuantityByDate(String from, String to) throws SQLException {
        String sql = "SELECT\n"
                + "    SUM(CASE WHEN Blog_Status = 1 THEN 1 ELSE 0 END) AS True_Count,\n"
                + "    SUM(CASE WHEN Blog_Status = 0 THEN 1 ELSE 0 END) AS False_Count\n"
                + "FROM\n"
                + "    BlogPost\n"
                + "WHERE\n"
                + "    BlogPost_Date BETWEEN ? AND ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, from);
        st.setString(2, to);
        ResultSet rs = st.executeQuery();
        ArrayList<BlogStatusByDate> lst = new ArrayList<>();
        while (rs.next()) {
            BlogStatusByDate u = new BlogStatusByDate(rs.getInt(1), rs.getInt(2));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<StarRate> getStarRate() throws SQLException {
        String sql = "SELECT \n"
                + "    COUNT(CASE WHEN Star = 1 THEN 1 END) AS \"1 Star\",\n"
                + "    COUNT(CASE WHEN Star = 2 THEN 1 END) AS \"2 Star\",\n"
                + "    COUNT(CASE WHEN Star = 3 THEN 1 END) AS \"3 Star\",\n"
                + "    COUNT(CASE WHEN Star = 4 THEN 1 END) AS \"4 Star\",\n"
                + "    COUNT(CASE WHEN Star = 5 THEN 1 END) AS \"5 Star\"\n"
                + "FROM Feedback f;";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<StarRate> lst = new ArrayList<>();
        while (rs.next()) {
            StarRate u = new StarRate(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
            lst.add(u);
        }
        return lst;
    }

    public double getStarAverage() throws SQLException {
        String sql = "SELECT ROUND(AVG(CAST(Star AS DECIMAL(10, 2))), 2) AS StarAverage FROM Feedback";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        double starAverage = 0.0;
        if (rs.next()) {
            starAverage = rs.getDouble("StarAverage");
        }
        return starAverage;
    }

    public double getRevenues() throws SQLException {
        String sql = "Select Sum(p.ProductPrice) AS TotalRevenue from Order_Detail p";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        double totalRevenue = 0.0;
        if (rs.next()) {
            totalRevenue = rs.getDouble("TotalRevenue");
        }
        return totalRevenue;
    }

    public ArrayList<RevenueByDate> getRevenueByDate(String from, String to) throws SQLException {
        String sql = "SELECT o.ProductPrice,  Order_Date\n"
                + "FROM Order_Detail o \n"
                + "JOIN [Order] orde ON o.Order_ID = orde.Order_ID \n"
                + "WHERE orde.Order_Date BETWEEN ? AND ?;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, from);
        st.setString(2, to);
        ResultSet rs = st.executeQuery();
        ArrayList<RevenueByDate> lst = new ArrayList<>();
        while (rs.next()) {
            RevenueByDate u = new RevenueByDate(rs.getInt(1), rs.getString(2));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<ProductSoldOrInStock> getProductSoldOrInstock() throws SQLException {
        String sql = "SELECT \n"
                + "    SUM(CASE WHEN ProductSerial_Status = 1 THEN 1 ELSE 0 END) AS InStock,\n"
                + "    SUM(CASE WHEN ProductSerial_Status != 1 THEN 1 ELSE 0 END) AS OutOfStock\n"
                + "FROM \n"
                + "    Product_Serial";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<ProductSoldOrInStock> lst = new ArrayList<>();
        while (rs.next()) {
            ProductSoldOrInStock u = new ProductSoldOrInStock(rs.getInt(1), rs.getInt(2));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<RichCustomer> getRichCustomers() throws SQLException {
        String sql = "SELECT c.Customer_Name, c.Customer_Address, c.Customer_Gender, c.Customer_Birthday, SUM(o.Order_TotalPrice) AS TotalPay \n"
                + "                     FROM [Order] o \n"
                + "                     JOIN Customer c ON o.Customer_Phone = c.Customer_Phone \n"
                + "                     GROUP BY c.Customer_Name, c.Customer_Address, c.Customer_Gender, c.Customer_Birthday \n"
                + "                     ORDER BY TotalPay DESC";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<RichCustomer> lst = new ArrayList<>();
        while (rs.next()) {
            RichCustomer u = new RichCustomer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<TopProduct> getTopProduct() throws SQLException {
        String sql = "SELECT TOP 3 pro.Product_Name, pro.Product_Image, pro.Product_Price, pro.Product_Description, COUNT(p.ProductSerial_ID) AS total_sold\n"
                + "FROM Product_Serial p\n"
                + "JOIN Product pro ON pro.Product_ID = p.Product_ID\n"
                + "WHERE p.ProductSerial_Status = 2\n"
                + "GROUP BY pro.Product_Name, pro.Product_Image, pro.Product_Price, pro.Product_Description\n"
                + "ORDER BY total_sold DESC;";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<TopProduct> lst = new ArrayList<>();
        while (rs.next()) {
            TopProduct u = new TopProduct(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<SaleTrend> getSaleTrend(String from, String to) throws SQLException {
        ArrayList<SaleTrend> lst = new ArrayList();
        String sql = "SELECT \n"
                + "    O.Order_Date,\n"
                + "    SUM(OD.Quantity) AS TotalSold\n"
                + "FROM \n"
                + "    [Order] O\n"
                + "JOIN \n"
                + "    Order_Detail OD ON O.Order_ID = OD.Order_ID\n"
                + "WHERE \n"
                + "    O.Order_Date BETWEEN ? AND ?\n"
                + "GROUP BY \n"
                + "    O.Order_Date\n"
                + "ORDER BY \n"
                + "    O.Order_Date;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, from);
        st.setString(2, to);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            SaleTrend c = new SaleTrend(rs.getString(1), rs.getInt(2));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<BrandSold> getBrandSold(String from, String to) throws SQLException {
        ArrayList<BrandSold> lst = new ArrayList();
        String sql = "SELECT \n"
                + "    B.Brand_Name,\n"
                + "    COUNT(OD.Product_ID) AS TotalSold\n"
                + "FROM \n"
                + "    Product P\n"
                + "JOIN \n"
                + "    Order_Detail OD ON P.Product_ID = OD.Product_ID\n"
                + "JOIN \n"
                + "    [Order] O ON OD.Order_ID = O.Order_ID\n"
                + "JOIN\n"
                + "    Brand B ON P.Brand_ID = B.BrandID\n"
                + "WHERE \n"
                + "    O.Order_Date BETWEEN ? AND ?\n"
                + "GROUP BY \n"
                + "    B.Brand_Name\n"
                + "ORDER BY \n"
                + "    TotalSold DESC;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, from);
        st.setString(2, to);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BrandSold c = new BrandSold(rs.getString(1), rs.getInt(2));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<BrandProductQuantity> getBrandProductQuantity() throws SQLException {
        ArrayList<BrandProductQuantity> lst = new ArrayList();
        String sql = "SELECT \n"
                + "    b.Brand_Name, \n"
                + "    COUNT(DISTINCT ps.ProductSerial_ID) AS TotalProducts\n"
                + "FROM \n"
                + "    Brand b\n"
                + "JOIN \n"
                + "    Product p ON b.BrandID = p.Brand_ID\n"
                + "JOIN \n"
                + "    Product_Serial ps ON p.Product_ID = ps.Product_ID\n"
                + "GROUP BY \n"
                + "    b.Brand_Name;";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BrandProductQuantity c = new BrandProductQuantity(rs.getString(1), rs.getInt(2));
            lst.add(c);
        }
        return lst;
    }

    public static void main(String[] args) throws SQLException {
        DashboardDAO dd = new DashboardDAO();
        System.out.println(dd.getBrandProductQuantity());
    }
}
