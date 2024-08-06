/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderListDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order;

/**
 *
 * @author HP
 */
@WebServlet(name = "AdminStatisticsController", urlPatterns = {"/admin-statistics"})
public class AdminStatisticsController extends HttpServlet {

    private OrderListDAO orderDAO;

    public AdminStatisticsController() {
        this.orderDAO = new OrderListDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        List<Order> orders = orderDAO.selectOrdersLast7Days();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("admin-statistics.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        List<Order> orders;

        if (type == null || type.isEmpty()) {
            orders = orderDAO.selectOrdersLast7Days();
        } else {
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String startMonth = request.getParameter("startMonth");
            String endMonth = request.getParameter("endMonth");
            
            if ("date".equals(type)) {
                orders = orderDAO.selectOrdersByDateRange(startDate, endDate);
                request.setAttribute("start", startDate);
                request.setAttribute("end", endDate);
                request.setAttribute("key", "date");
            } else if ("month".equals(type)) {
                String startMonthDate = startMonth + "-01";
                String endMonthDate = endMonth + "-31";
                orders = orderDAO.selectOrdersByDateRange(startMonthDate, endMonthDate);
                request.setAttribute("fromMonth", startMonth);
                request.setAttribute("toMonth", endMonth);
                request.setAttribute("key", "month");
            } else {
                orders = orderDAO.selectOrdersLast7Days();
            }
        }
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("admin-statistics.jsp").forward(request, response);
    }

}
