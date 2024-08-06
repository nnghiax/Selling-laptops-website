/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDBContext extends DBContext {

    public static void main(String[] args) {
        UserDBContext db = new UserDBContext();
        // Tạo đối tượng User
//            User newUser = new User(11, "JohnDoe", "password123", "johndoe@example.com", "2");
        // Gọi phương thức register
//        db.register(newUser);

    }

    public User check(String user_name, String user_password) {
        try {
            String sql = "SELECT [User_ID]\n"
                    + "      ,[User_Name]\n"
                    + "      ,[User_Password]\n"
                    + "      ,[User_Email]\n"
                    + "      ,[Role_ID]\n"
                    + "      ,[User_Image]\n"
                    + "      ,[User_Phone]\n"
                    + "  FROM [dbo].[User]\n"
                    + "WHERE User_Name=? and User_Password=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user_name);
            stm.setString(2, user_password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("user_id"), user_name, user_password, rs.getString("user_email"), rs.getString("role_id"), rs.getString("user_image"), rs.getString("user_phone"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User checkUserExist(String user) {
        String sql = "SELECT [User_ID]\n"
                + "      ,[User_Name]\n"
                + "      ,[User_Password]\n"
                + "      ,[User_Email]\n"
                + "      ,[Role_ID]\n"
                + "      ,[User_Image]\n"
                + "      ,[User_Phone]\n"
                + "  FROM [dbo].[User]\n"
                + " WHERE User_Name=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(
                        rs.getInt("user_id"),
                        rs.getString("user_name"),
                        rs.getString("user_password"),
                        rs.getString("user_email"),
                        rs.getString("role_id"),
                        rs.getString("user_image"),
                        rs.getString("user_phone")
                );
                return u;
            }

        } catch (SQLException e) {

        }
        return null;
    }

    public void register(User user) {
        // SQL query to insert a new user into the database
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([User_Name]\n"
                + "           ,[User_Password]\n"
                + "           ,[User_Email]\n"
                + "           ,[Role_ID])\n"
                + "      ,[User_Image]\n"
                + "      ,[User_Phone]\n"
                + "     VALUES (?, ?, ?, ?, ?, ?)";

        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUser_name());
            statement.setString(2, user.getUser_password());
            statement.setString(3, user.getUser_email());
            statement.setString(4, user.getRole_id());
            statement.setString(5, user.getUser_image());
            statement.setString(6, user.getUser_phone());
            statement.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    public User getUserByEmail(String Email) {
        String sql = "SELECT [User_ID]\n"
                + "      ,[User_Name]\n"
                + "      ,[User_Password]\n"
                + "      ,[User_Email]\n"
                + "      ,[Role_ID]\n"
                + "      ,[User_Image]\n"
                + "      ,[User_Phone]\n"
                + "  FROM [dbo].[User]\n"
                + " WHERE User_Email=?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, Email);

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    User u = new User(
                            rs.getInt("user_id"),
                            rs.getString("user_name"),
                            rs.getString("user_password"),
                            rs.getString("user_email"),
                            rs.getString("role_id"),
                            rs.getString("user_image"),
                            rs.getString("user_phone")
                    );
                    return u;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return null;
    }

    public User getUserById(int id) {
        String sql = "SELECT [User_ID]\n"
                + "      ,[User_Name]\n"
                + "      ,[User_Password]\n"
                + "      ,[User_Email]\n"
                + "      ,[Role_ID]\n"
                + "      ,[User_Image]\n"
                + "      ,[User_Phone]\n"
                + "  FROM [dbo].[User]\n"
                + " WHERE User_ID=?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    User u = new User(
                            rs.getInt("user_id"),
                            rs.getString("user_name"),
                            rs.getString("user_password"),
                            rs.getString("user_email"),
                            rs.getString("role_id"),
                            rs.getString("user_image"),
                            rs.getString("user_phone")
                    );
                    return u;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return null;
    }

    public void updateUser(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [User_Name] = ?,\n"
                + "      [User_Password] = ?,\n"
                + "      [User_Email] = ?,\n"
                + "      [Role_ID] = ?,\n"
                + "      ,[User_Image]\n"
                + "      ,[User_Phone]\n"
                + " WHERE [User_ID] =?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, u.getUser_name());
            st.setString(2, u.getUser_password());
            st.setString(3, u.getUser_email());
            st.setString(4, u.getRole_id());
            st.setString(5, u.getUser_image());
            st.setString(6, u.getUser_phone());
            st.setInt(7, u.getUser_id());

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int updateUserProfile(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [User_Email] = ?\n"
                + "      ,[User_Image] =?\n"
                + "      ,[User_Phone]=?\n"
                + " WHERE [User_ID] =?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, u.getUser_email());
            st.setString(2, u.getUser_image());
            st.setString(3, u.getUser_phone());
            st.setInt(4, u.getUser_id());
            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return 0;
    }

    public boolean isEmailExists(String email, int userId) {
        String sql = "SELECT COUNT(*) FROM [user] WHERE user_email = ? and User_ID !=?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isPhoneExists(String phone, int userId) {
        String sql = "SELECT COUNT(*) FROM [User] WHERE User_Phone = ? and User_ID != ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, phone);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
