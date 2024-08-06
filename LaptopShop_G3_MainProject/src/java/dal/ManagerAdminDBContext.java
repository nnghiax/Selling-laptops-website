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
import model.Brand;
import model.User;

/**
 *
 * @author VietAnh
 */
public class ManagerAdminDBContext extends DBContext {

    // Profile admin
    public User profileAdmin() {
        User user = new User();
        try {
            String sql = "select u.User_ID, u.User_Name, u.User_Password, u.User_Email, u.Role_ID, u.User_Image, u.User_Phone\n"
                    + "from [User] u \n"
                    + "where u.User_ID = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("User_ID"));
                u.setUser_name(rs.getNString("User_Name"));
                u.setUser_password(rs.getString("User_Password"));
                u.setUser_email(rs.getString("User_Email"));
                u.setRole_id(rs.getString("Role_ID"));
                u.setUser_image(rs.getString("User_Image"));
                u.setUser_phone(rs.getString("User_Phone"));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Update profile admin
    public void updateProfileAdmin(User u) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET [User_Name] = ?\n"
                    + "      ,[User_Password] = ?\n"
                    + "      ,[User_Email] = ?\n"
                    + "      ,[User_Image] = ?\n"
                    + "      ,[User_Phone] = ?\n"
                    + " WHERE [User_ID] = '1'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, u.getUser_name());
            stm.setString(2, u.getUser_password());
            stm.setString(3, u.getUser_email());
            stm.setString(4, u.getUser_image());
            stm.setString(5, u.getUser_phone());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // List User
    public ArrayList<User> getListUser() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select u.User_ID, u.User_Name, u.User_Email, u.User_Phone, u.Role_ID, u.User_Image\n"
                    + "from [User] u\n"
                    + "where u.User_ID != '1'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("User_ID"));
                u.setUser_name(rs.getNString("User_Name"));
                u.setUser_email(rs.getString("User_Email"));
                u.setUser_phone(rs.getString("User_Phone"));
                u.setRole_id(rs.getString("Role_ID"));
                u.setUser_image(rs.getString("User_Image"));
                users.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    // Search User by name
    public ArrayList<User> searchUserByName(String uname) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select u.User_ID, u.User_Name, u.User_Email, u.User_Phone, u.Role_ID, u.User_Image\n"
                    + "from [User] u\n"
                    + "where u.User_Name like ? and u.[User_Name] != 'MrA'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + uname + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("User_ID"));
                u.setUser_name(rs.getNString("User_Name"));
                u.setUser_email(rs.getString("User_Email"));
                u.setUser_phone(rs.getString("User_Phone"));
                u.setRole_id(rs.getString("Role_ID"));
                u.setUser_image(rs.getString("User_Image"));
                users.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    // Get User by id
    public User getUserById(String uid) {
        try {
            String sql = "select u.User_ID, u.User_Name, u.User_Email, u.User_Phone, u.Role_ID, u.User_Image\n"
                    + "from [User] u\n"
                    + "where u.User_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("User_ID"));
                u.setUser_name(rs.getNString("User_Name"));
                u.setUser_email(rs.getString("User_Email"));
                u.setUser_phone(rs.getString("User_Phone"));
                u.setRole_id(rs.getString("Role_ID"));
                u.setUser_image(rs.getString("User_Image"));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Update User by id
    public void updateUserById(User u) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET [User_Name] = ?\n"
                    + "      ,[User_Email] = ?\n"
                    + "      ,[Role_ID] = ?\n"
                    + "      ,[User_Image] = ?\n"
                    + "      ,[User_Phone] = ?\n"
                    + " WHERE [User_ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setNString(1, u.getUser_name());
            stm.setString(2, u.getUser_email());
            stm.setString(3, u.getRole_id());
            stm.setString(4, u.getUser_image());
            stm.setString(5, u.getUser_phone());
            stm.setInt(6, u.getUser_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Delete User
    public void deleteUser(String uid) {
        try {
            String sql = "DELETE FROM [User]\n"
                    + "      WHERE [User_ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, uid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // List Brand
    public ArrayList<Brand> getListBrand() {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            String sql = "SELECT [Brand_Hotline]\n"
                    + "      ,[BrandID]\n"
                    + "      ,[Brand_Name]\n"
                    + "      ,[Brand_Address]\n"
                    + "  FROM [Brand]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setHotline(rs.getString("Brand_Hotline"));
                b.setId(rs.getString("BrandID"));
                b.setName(rs.getString("Brand_Name"));
                b.setAddress(rs.getString("Brand_Address"));
                brands.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return brands;
    }

    // Search Brand name
    public ArrayList<Brand> searchBrandName(String name) {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            String sql = "select b.BrandID, b.Brand_Name, b.Brand_Hotline, b.Brand_Address\n"
                    + "from Brand b\n"
                    + "where b.Brand_Name = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setHotline(rs.getString("Brand_Hotline"));
                b.setId(rs.getString("BrandID"));
                b.setName(rs.getString("Brand_Name"));
                b.setAddress(rs.getString("Brand_Address"));
                brands.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return brands;
    }

    // Add new Brand
    public void addNewBrand(Brand b) {
        try {
            String sql = "INSERT INTO [Brand]\n"
                    + "           ([Brand_Hotline]\n"
                    + "           ,[BrandID]\n"
                    + "           ,[Brand_Name]\n"
                    + "           ,[Brand_Address])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, b.getHotline());
            stm.setString(2, b.getId());
            stm.setString(3, b.getName());
            stm.setString(4, b.getAddress());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Delete Brand
    public void deleteBrand(String bid) {
        try {
            String sql = "DELETE FROM [Brand]\n"
                    + "      WHERE [BrandID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, bid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Get Brand by ID
    public Brand getBrandById(String bid) {
        try {
            String sql = "select b.BrandID, b.Brand_Name, b.Brand_Hotline, b.Brand_Address\n"
                    + "from Brand b\n"
                    + "where b.BrandID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, bid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setHotline(rs.getString("Brand_Hotline"));
                b.setId(rs.getString("BrandID"));
                b.setName(rs.getString("Brand_Name"));
                b.setAddress(rs.getString("Brand_Address"));
                return b;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Update Brand
    public void updateBrand(Brand b) {
        try {
            String sql = "UPDATE [Brand]\n"
                    + "   SET [Brand_Hotline] = ?,\n"
                    + "       [Brand_Name] = ?,\n"
                    + "       [Brand_Address] = ?\n"
                    + " WHERE [BrandID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, b.getHotline());
            stm.setString(2, b.getName());
            stm.setString(3, b.getAddress());
            stm.setString(4, b.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerAdminDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
