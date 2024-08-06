/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Authentication;

import dal.UserDBContext;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public abstract class AuthenticationController extends HttpServlet {
    
    private User getAuthentication(HttpServletRequest req)
    {
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        
        if(user==null)
        {
            Cookie[] cookies = req.getCookies();
            if(cookies!=null)
            {
                String username = null;
                String password = null;
                for (Cookie cooky : cookies) {
                    if(cooky.getName().equals("username"))
                        username = cooky.getValue();
                    
                    if(cooky.getName().equals("password"))
                        password = cooky.getValue();
                    
                    if(username != null && password !=null)
                        break;
                }
                if(username == null || password == null)
                    return null;
                else
                {
                    UserDBContext db = new UserDBContext();
                    User test = db.check(username, password);
                    if(test!=null)
                        session.setAttribute("user", test);
                    return test;
                }
            }
        }
        return user ;
    }
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = getAuthentication(req);
        if(user!=null)
        {
            doPost(req, resp, user);
        }
        else
        {
            if(req.getServletPath().equals("/home")){
                resp.sendRedirect("login");
            }else{
                resp.sendRedirect("../login");
            }
        }
    }
    
    
    protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp,User user) 
            throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    User user = getAuthentication(req);
        if(user!=null)
        {
            doGet(req, resp, user);
        }
        else
        {
            if(req.getServletPath().equals("/home")){
                resp.sendRedirect("login");
            }else{
                resp.sendRedirect("../login");
            }
        }
    
    }
    
    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp,User user) 
            throws ServletException, IOException;
    
}
