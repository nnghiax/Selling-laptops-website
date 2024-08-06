/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author vutie
 */
public class Order {
    private String id;
    private String phone;
    private float totalPrice;
    private int statusID;
    private String date;
    private String paymentMethod;
    private float shippingFee;

    public Order() {
    }

    public Order(String id, String phone, float totalPrice, int statusID, String date, String paymentMethod, float shippingFee) {
        this.id = id;
        this.phone = phone;
        this.totalPrice = totalPrice;
        this.statusID = statusID;
        this.date = date;
        this.paymentMethod = paymentMethod;
        this.shippingFee = shippingFee;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public float getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(float shippingFee) {
        this.shippingFee = shippingFee;
    }
    
    
    
}
