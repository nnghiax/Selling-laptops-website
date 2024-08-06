/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author VietAnh
 */
public class Product {
    private String id;
    private String warranty;
    private Brand Brand_ID;
    private String name;
    private String description;
    private float price;
    private float salePrice;
    private String image;
    private ProductDetail productDetail;
    private List<ProductImg> productImg;

    public Product() {
    }

    public Product(String id, String warranty, Brand Brand_ID, String name, String description, float price, float salePrice, String image, ProductDetail productDetail, List<ProductImg> productImg) {
        this.id = id;
        this.warranty = warranty;
        this.Brand_ID = Brand_ID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.salePrice = salePrice;
        this.image = image;
        this.productDetail = productDetail;
        this.productImg = productImg;
    }
    
    

    
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getWarranty() {
        return warranty;
    }

    public void setWarranty(String warranty) {
        this.warranty = warranty;
    }

    

    public Brand getBrand_ID() {
        return Brand_ID;
    }

    public void setBrand_ID(Brand Brand_ID) {
        this.Brand_ID = Brand_ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public List<ProductImg> getProductImg() {
        return productImg;
    }

    public void setProductImg(List<ProductImg> productImg) {
        this.productImg = productImg;
    }
    
    
    public String getFormattedPrice() {
        return String.format("%.2f", price);
    }
    
    
    public String getFormattedSalePrice(){
        return String.format("%.2f", price);
    }

    
    
    
    
    
 
}
