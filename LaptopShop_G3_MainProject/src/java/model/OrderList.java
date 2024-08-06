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
public class OrderList {
    private String id;
    private float totalPrice;
    private String paymentMethod;
    private String status;
    private String date;    
    private float shippingFee;
    private List<OrderItem> orderItem;
    private Customer customer;
    private int statusID;
    private String saleStaff;
    private String whStaff;

    public OrderList() {
    }

    public OrderList(String id, float totalPrice, String paymentMethod, String status, String date, float shippingFee, List<OrderItem> orderItem, Customer customer, int statusID, String saleStaff, String whStaff) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.date = date;
        this.shippingFee = shippingFee;
        this.orderItem = orderItem;
        this.customer = customer;
        this.statusID = statusID;
        this.saleStaff = saleStaff;
        this.whStaff = whStaff;
    }



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
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

    public float getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(float shippingFee) {
        this.shippingFee = shippingFee;
    }

    public List<OrderItem> getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(List<OrderItem> orderItem) {
        this.orderItem = orderItem;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getSaleStaff() {
        return saleStaff;
    }

    public void setSaleStaff(String saleStaff) {
        this.saleStaff = saleStaff;
    }

    public String getWhStaff() {
        return whStaff;
    }

    public void setWhStaff(String whStaff) {
        this.whStaff = whStaff;
    }



    @Override
    public String toString() {
        return "OrderList{" + "id=" + id + ", totalPrice=" + totalPrice + ", paymentMethod=" + paymentMethod + ", status=" + status + ", date=" + date + ", shippingFee=" + shippingFee + ", orderItem=" + orderItem + ", customer=" + customer + ", statusID=" + statusID + ", saleStaff=" + saleStaff + ", warehouseStaff=" + whStaff + '}';
    }
    




    
    
    
}
