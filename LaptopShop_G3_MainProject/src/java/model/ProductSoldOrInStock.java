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

public class ProductSoldOrInStock {
    private int instock;
    private int sold;

    public ProductSoldOrInStock() {
    }

    public ProductSoldOrInStock(int instock, int sold) {
        this.instock = instock;
        this.sold = sold;
    }

    public int getInstock() {
        return instock;
    }

    public void setInstock(int instock) {
        this.instock = instock;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    @Override
    public String toString() {
        return "ProductSoldOrInStock{" + "instock=" + instock + ", sold=" + sold + '}';
    }
    
    
}
