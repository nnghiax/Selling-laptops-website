/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

/**
 *
 * @author Nguyen Bao
 */
import java.util.*;
import java.lang.*;

public class RevenueByDate {
    private int price;
    private String date;

    public RevenueByDate() {
    }

    public RevenueByDate(int price, String date) {
        this.price = price;
        this.date = date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "RevenueByDate{" + "price=" + price + ", date=" + date + '}';
    }
    
    
}
