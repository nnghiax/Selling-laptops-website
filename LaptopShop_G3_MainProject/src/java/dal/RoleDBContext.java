/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class RoleDBContext extends DBContext {

    public ArrayList<Role> getRoleByUrlAndUsername(String user_name, String url) {
        ArrayList<Role> roles = new ArrayList<>();
        try {
            String sql = "select r.Role_ID,r.Role_Name\n"
                    + "from [dbo].[User] u\n"
                    + "inner join Role r on r.Role_ID = u.Role_ID\n"
                    + "inner join Role_Feature rf on rf.Role_ID = r.Role_ID\n"
                    + "inner join Feature f on f.Feature_ID = rf.Feature_ID\n"
                    + "where u.User_Name = ? and f.url = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user_name);
            stm.setString(2, url);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setId(rs.getString("roleid"));
                r.setName(rs.getString("rolename"));
                roles.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roles;
    }


}
