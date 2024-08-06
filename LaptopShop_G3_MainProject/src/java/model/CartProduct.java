 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vutie
 */
public class CartProduct {
    private String id;
    private String name;
    private String img;
    private float price;
    private int stock;

    public CartProduct() {
    }

    public CartProduct(String id, String name, String img, float price) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.price = price;
    }
    
    public CartProduct(String id, String name, String img, float price, int stock) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.price = price;
        this.stock = stock;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
