/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Feedback;

/**
 *
 * @author HP
 */
@WebServlet(name = "FeedbackMarketingController", urlPatterns = {"/manage-feedback"})
public class FeedbackMarketingController extends HttpServlet {

    private FeedbackDAO feedbackDAO;

    public void init() {
        feedbackDAO = new FeedbackDAO();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action != null ? action : "";
        try {
            switch (action) {
                case "list":
                    listFeedback(request, response);
                    break;
                case "detail":
                    showFeedbackDetail(request, response);
                    break;
                case "filter":
                    this.filter(request, response);
                    break;
                default:
                    listFeedback(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Do get: " + ex);
        }
    }

    private void listFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            List<Feedback> listFeedback = feedbackDAO.selectAllFeedbacks();
            request.setAttribute("listFeedback", listFeedback);
            request.getRequestDispatcher("feedback-list.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    private void filter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            if (request.getParameter("star").equals("")) {
                List<Feedback> listFeedback = feedbackDAO.selectAllFeedbacks();
                request.setAttribute("listFeedback", listFeedback);
                request.getRequestDispatcher("feedback-list.jsp").forward(request, response);
            } else {
                int star = Integer.parseInt(request.getParameter("star"));
                request.setAttribute("star", star);
                List<Feedback> listFeedback = feedbackDAO.selectAllFeedbacksByFilter(star);
                request.setAttribute("listFeedback", listFeedback);
                request.getRequestDispatcher("feedback-list.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    private void showFeedbackDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int feedbackID = Integer.parseInt(request.getParameter("id"));
        Feedback feedback = feedbackDAO.selectAllFeedbacksById(feedbackID);
        request.setAttribute("feedback", feedback);
        request.getRequestDispatcher("feedbackDetail.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
