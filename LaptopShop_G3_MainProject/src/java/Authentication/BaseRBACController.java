    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Authentication;

import dal.RoleDBContext;
import model.User;
import model.Role;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public abstract class BaseRBACController extends AuthenticationController {

    private ArrayList<Role> getRoles(User user, HttpServletRequest req) {
        RoleDBContext db = new RoleDBContext();
        String url = req.getServletPath();
        return db.getRoleByUrlAndUsername(user.getUser_name(), url);
    }

    protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp, User user, ArrayList<Role> roles)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        ArrayList<Role> roles = getRoles(user, req);
        if (roles.size() < 1) {
            resp.sendRedirect("accessdenied.jsp");
        } else {
            doPost(req, resp, user, roles);
        }
    }

    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp, User user, ArrayList<Role> roles)
            throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        ArrayList<Role> roles = getRoles(user, req);
        if (roles.size() < 1) {
            resp.sendRedirect("accessdenied.jsp");
        } else {
            doGet(req, resp, user, roles);
        }
    }
}
