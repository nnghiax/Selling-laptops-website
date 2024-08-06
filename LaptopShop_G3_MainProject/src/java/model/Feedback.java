/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

import java.sql.Timestamp;

/**
 *
 * @author HP
 */
public class Feedback {
    private int feedbackID;
    private int user_ID;
    private String product_ID;
    private int star;
    private String comment;
    private Timestamp time;
    
    private User user;
    private Product product;

    public Feedback() {
    }

    public Feedback(int feedbackID, int user_ID, String product_ID, int star, String comment, Timestamp time) {
        this.feedbackID = feedbackID;
        this.user_ID = user_ID;
        this.product_ID = product_ID;
        this.star = star;
        this.comment = comment;
        this.time = time;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(int user_ID) {
        this.user_ID = user_ID;
    }

    public String getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(String product_ID) {
        this.product_ID = product_ID;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
