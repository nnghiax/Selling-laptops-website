/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vutie
 */
public class CartItem {
    private String id;
    private CartProduct CartProduct;
    private int quantity;
    private float price;

    public CartItem() {
    }

    public CartItem(String id, CartProduct CartProduct, int quantity, float price) {
        this.id = id;
        this.CartProduct = CartProduct;
        this.quantity = quantity;
        this.price = price;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public CartProduct getCartProduct() {
        return CartProduct;
    }

    public void setCartProduct(CartProduct CartProduct) {
        this.CartProduct = CartProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
