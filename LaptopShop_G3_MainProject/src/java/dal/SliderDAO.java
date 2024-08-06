/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class SliderDAO extends DBContext{


    public void insertSlider(Slider slider) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Slider (title, image, backlink, status) VALUES (?, ?, ?, ?)");
            preparedStatement.setString(1, slider.getTitle());
            preparedStatement.setString(2, slider.getImage());
            preparedStatement.setString(3, slider.getBacklink());
            preparedStatement.setInt(4, slider.getStatus());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("Add new: " + e);
        }
    }

    public Slider selectSlider(int id) {
        Slider slider = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, title, image, backlink, status FROM Slider WHERE id = ?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String title = rs.getString("title");
                String image = rs.getString("image");
                String backlink = rs.getString("backlink");
                int status = rs.getInt("status");
                slider = new Slider(id, title, image, backlink, status);
            }
        } catch (Exception e) {
            System.out.println("Get slider: " + e);
        }
        return slider;
    }

    public List<Slider> selectAllSliders() {
        List<Slider> sliders = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Slider");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String image = rs.getString("image");
                String backlink = rs.getString("backlink");
                int status = rs.getInt("status");
                sliders.add(new Slider(id, title, image, backlink, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sliders;
    }
    
    public List<Slider> selectAllSlidersByStatus(int status) {
        List<Slider> sliders = new ArrayList<>();
        String sql = "SELECT * FROM Slider where 1 = 1 ";
        if(status != -1) {
                sql += " AND status = ?";
            }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            if(status != -1) {
                preparedStatement.setInt(1, status);
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String image = rs.getString("image");
                String backlink = rs.getString("backlink");
                int statusA = rs.getInt("status");
                sliders.add(new Slider(id, title, image, backlink, statusA));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sliders;
    }
    
    public List<Slider> selectAllSlidersActive() {
        List<Slider> sliders = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Slider where status = 1");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String image = rs.getString("image");
                String backlink = rs.getString("backlink");
                int status = rs.getInt("status");
                sliders.add(new Slider(id, title, image, backlink, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public boolean deleteSlider(int id) {
        boolean rowDeleted = false;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM Slider WHERE id = ?");
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }catch(Exception e) {
            System.out.println("Delete: " + e);
        }
        return rowDeleted;
    }

    public boolean updateSlider(Slider slider){
        boolean rowUpdated = false;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE Slider SET title = ?, image = ?, backlink = ?, status = ? WHERE id = ?");
            statement.setString(1, slider.getTitle());
            statement.setString(2, slider.getImage());
            statement.setString(3, slider.getBacklink());
            statement.setInt(4, slider.getStatus());
            statement.setInt(5, slider.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }catch(Exception e) {
            System.out.println("Update: " + e);
        }
        return rowUpdated;
    }
}
