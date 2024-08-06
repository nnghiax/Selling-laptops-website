/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vutie
 */
public class MyOrderList {
    
    private String id;
    private String phone;
    private float totalPrice;
    private String productImages;
    private String productNames;
    private String status;
    private String date;
    private int otherProduct;

    // Constructors, getters, and setters

    public MyOrderList() {
    }


    public MyOrderList(String id, String phone, float totalPrice, String productImages, String productNames, String status, String date, int otherProduct) {
        this.id = id;
        this.phone = phone;
        this.totalPrice = totalPrice;
        this.productImages = productImages;
        this.productNames = productNames;
        this.status = status;
        this.date = date;
        this.otherProduct = otherProduct;
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

    public String getProductImages() {
        return productImages;
    }

    public void setProductImages(String productImages) {
        this.productImages = productImages;
    }

    public String getProductNames() {
        return productNames;
    }

    public void setProductNames(String productNames) {
        this.productNames = productNames;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getOtherProduct() {
        return otherProduct;
    }

    public void setOtherProduct(int otherProduct) {
        this.otherProduct = otherProduct;
    }
    
}
