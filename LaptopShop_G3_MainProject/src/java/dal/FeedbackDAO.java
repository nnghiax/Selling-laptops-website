/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class FeedbackDAO extends DBContext {

    public List<Feedback> selectAllFeedbacks() {
        List<Feedback> feedbacks = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Feedback");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int feedbackID = rs.getInt("feedbackID");
                int user_ID = rs.getInt("user_ID");
                String product_ID = rs.getString("product_ID");
                int star = rs.getInt("star");
                String comment = rs.getString("comment");
                Timestamp time = rs.getTimestamp("time");
                Feedback feedback = new Feedback(feedbackID, user_ID, product_ID, star, comment, time);
                UserDBContext userDao = new UserDBContext();
                ProductDBContext productDao = new ProductDBContext();
                feedback.setUser(userDao.getUserById(user_ID));
                feedback.setProduct(productDao.getProduct(product_ID));
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println("Get all: " + e);
        }
        return feedbacks;
    }
    
    public List<Feedback> selectAllFeedbacksByFilter(int star) {
        List<Feedback> feedbacks = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Feedback where star = ?");
            preparedStatement.setInt(1, star);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                int feedbackID = rs.getInt("feedbackID");
                int user_ID = rs.getInt("user_ID");
                String product_ID = rs.getString("product_ID");
                String comment = rs.getString("comment");
                Timestamp time = rs.getTimestamp("time");
                Feedback feedback = new Feedback(feedbackID, user_ID, product_ID, star, comment, time);
                UserDBContext userDao = new UserDBContext();
                ProductDBContext productDao = new ProductDBContext();
                feedback.setUser(userDao.getUserById(user_ID));
                feedback.setProduct(productDao.getProduct(product_ID));
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println("Get all: " + e);
        }
        return feedbacks;
    }

    public List<Feedback> selectAllFeedbackByProductId(String code) {
        List<Feedback> feedbacks = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Feedback where product_ID = ?");
            preparedStatement.setString(1, code);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int feedbackID = rs.getInt("feedbackID");
                int user_ID = rs.getInt("user_ID");
                String product_ID = rs.getString("product_ID");
                int star = rs.getInt("star");
                String comment = rs.getString("comment");
                Timestamp time = rs.getTimestamp("time");
                Feedback feedback = new Feedback(feedbackID, user_ID, product_ID, star, comment, time);
                UserDBContext userDao = new UserDBContext();
                ProductDBContext productDao = new ProductDBContext();
                feedback.setUser(userDao.getUserById(user_ID));
                feedback.setProduct(productDao.getProduct(product_ID));
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println("Get all: " + e);
        }
        return feedbacks;
    }

    public Feedback selectAllFeedbacksById(int id) {
        Feedback feedbacks = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Feedback where feedbackID = ?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int feedbackID = rs.getInt("feedbackID");
                int user_ID = rs.getInt("user_ID");
                String product_ID = rs.getString("product_ID");
                int star = rs.getInt("star");
                String comment = rs.getString("comment");
                Timestamp time = rs.getTimestamp("time");
                Feedback feedback = new Feedback(feedbackID, user_ID, product_ID, star, comment, time);
                UserDBContext userDao = new UserDBContext();
                ProductDBContext productDao = new ProductDBContext();
                feedback.setUser(userDao.getUserById(user_ID));
                feedback.setProduct(productDao.getProduct(product_ID));
                return feedback;
            }
        } catch (SQLException e) {
            System.out.println("Get all: " + e);
        }
        return null;
    }

    public Feedback selectFeedbacksByIdAndUser(int id, String productID) {
        Feedback feedbacks = null;
        String sql = "select F.* from Feedback as F\n"
                + "join Order_Detail as OD on OD.Product_ID = F.Product_ID\n"
                + "join [Order] as O on O.Order_ID = OD.Order_ID\n"
                + "join [Order_Status] as OS on OS.OrderStatus_ID = O.OrderStatus_ID\n"
                + "join [User] as U on U.User_ID = F.User_ID\n"
                + "where U.User_ID = ? and OD.Product_ID = ? and OS.OrderStatus_ID = 4";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, productID);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int feedbackID = rs.getInt("feedbackID");
                int user_ID = rs.getInt("user_ID");
                String product_ID = rs.getString("product_ID");
                int star = rs.getInt("star");
                String comment = rs.getString("comment");
                Timestamp time = rs.getTimestamp("time");
                Feedback feedback = new Feedback(feedbackID, user_ID, product_ID, star, comment, time);
                UserDBContext userDao = new UserDBContext();
                ProductDBContext productDao = new ProductDBContext();
                feedback.setUser(userDao.getUserById(user_ID));
                feedback.setProduct(productDao.getProduct(product_ID));
                return feedback;
            }
        } catch (SQLException e) {
            System.out.println("Get all feed: " + e);
        }
        return null;
    }
    
    public boolean isOrder(int id, String productID) {
        Feedback feedbacks = null;
        String sql = "select O.* from "
                + "Order_Detail as OD "
                + "join [Order] as O on O.Order_ID = OD.Order_ID\n"
                + "join [Order_Status] as OS on OS.OrderStatus_ID = O.OrderStatus_ID\n"
                + "join [User] as U on U.User_Phone = O.Customer_Phone\n"
                + "where U.User_ID = ? and OD.Product_ID = ? and OS.OrderStatus_ID = 4";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, productID);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Get all: " + e);
        }
        return false;
    }
    
     public void addFeedback(Feedback feedback) throws SQLException {
        String sql = "INSERT INTO Feedback (user_ID, product_ID, star, comment, time) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, feedback.getUser_ID());
            statement.setString(2, feedback.getProduct_ID());
            statement.setInt(3, feedback.getStar());
            statement.setString(4, feedback.getComment());
            statement.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            statement.executeUpdate();
        }catch(Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void updateFeedback(Feedback feedback) throws SQLException {
        String sql = "UPDATE Feedback SET star = ?, comment = ?, time = ? WHERE feedbackID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, feedback.getStar());
            statement.setString(2, feedback.getComment());
            statement.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            statement.setInt(4, feedback.getFeedbackID());
            statement.executeUpdate();
        }catch(Exception e) {
            System.out.println("Error: " + e);
        }
    }
}
