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
public class OrderItem {
    private int orderDetailID;
    private String productID;
    private String productName;
    private String productImg;
    private int quantity;
    private float productPrice;
    private String note;
    private String serial;

    public OrderItem() {
    }

    public OrderItem(int orderDetailID, String productID, String productName, String productImg, int quantity, float productPrice, String note, String serial) {
        this.orderDetailID = orderDetailID;
        this.productID = productID;
        this.productName = productName;
        this.productImg = productImg;
        this.quantity = quantity;
        this.productPrice = productPrice;
        this.note = note;
        this.serial = serial;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(float productPrice) {
        this.productPrice = productPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getSerial() {
        return serial;
    }

    public void setSerial(String serial) {
        this.serial = serial;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "orderDetailID=" + orderDetailID + ", productID=" + productID + ", productName=" + productName + ", productImg=" + productImg + ", quantity=" + quantity + ", productPrice=" + productPrice + ", note=" + note + ", serial=" + serial + '}';
    }
    

    

   


    
    
}
