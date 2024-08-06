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

public class TopProduct {
    private String name;
    private String img;
    private double price;
    private String des;
    private int sold;

    public TopProduct() {
    }

    public TopProduct(String name, String img, double price, String des, int sold) {
        this.name = name;
        this.img = img;
        this.price = price;
        this.des = des;
        this.sold = sold;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    @Override
    public String toString() {
        return "TopProduct{" + "name=" + name + ", img=" + img + ", price=" + price + ", des=" + des + ", sold=" + sold + '}';
    }
    
    
}
