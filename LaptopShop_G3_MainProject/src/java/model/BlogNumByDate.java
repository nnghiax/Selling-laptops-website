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

public class BlogNumByDate {
    private String date;
    private int quantity;

    public BlogNumByDate() {
    }

    public BlogNumByDate(String date, int quantity) {
        this.date = date;
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "BlogNumByDate{" + "date=" + date + ", quantity=" + quantity + '}';
    }
}
