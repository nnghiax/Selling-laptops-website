/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Slider;

/**
 *
 * @author HP
 */
@WebServlet(name = "SliderController", urlPatterns = {"/slider"})
public class SliderController extends HttpServlet {

    private SliderDAO sliderDAO;

    public void init() {
        sliderDAO = new SliderDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action != null ? action : "";
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertSlider(request, response);
                    break;
                case "delete":
                    deleteSlider(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateSlider(request, response);
                    break;
                default:
                    listSlider(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
    }

    private void listSlider(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String statusNumber = request.getParameter("status");
            int status = -1;
            if (statusNumber != null) {
                status = Integer.parseInt(statusNumber);
            }
            request.setAttribute("status", status);
            List<Slider> listSlider = sliderDAO.selectAllSlidersByStatus(status);
            request.setAttribute("listSlider", listSlider);
            request.getRequestDispatcher("slider-list.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("slider-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Slider existingSlider = sliderDAO.selectSlider(id);
            request.setAttribute("slider", existingSlider);
            request.getRequestDispatcher("slider-form.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Edit form: " + e);
        }
    }

    private void insertSlider(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String image = request.getParameter("image");
        String backlink = request.getParameter("backlink");
        int status = Integer.parseInt(request.getParameter("status"));
        Slider newSlider = new Slider(title, image, backlink, status);
        sliderDAO.insertSlider(newSlider);
        response.sendRedirect("slider?action=list");
    }

    private void updateSlider(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String image = request.getParameter("image");
        String backlink = request.getParameter("backlink");
        int status = Integer.parseInt(request.getParameter("status"));
        Slider slider = new Slider(id, title, image, backlink, status);
        sliderDAO.updateSlider(slider);
        response.sendRedirect("slider?action=list");
    }

    private void deleteSlider(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        sliderDAO.deleteSlider(id);
        response.sendRedirect("slider?action=list");
    }

}
