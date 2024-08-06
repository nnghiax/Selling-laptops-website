/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vutie
 */
public class Customer {

    private String phone;
    private String name;
    private String address;
    private String detailAddress;
    private String ward;
    private String district;
    private String city;

    public Customer() {
    }

    public Customer(String phone, String name, String address) {
        this.phone = phone;
        this.name = name;
        this.address = address;
        splitAddress(address);
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
     public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    private void splitAddress(String address) {
        if (this.address != null && !this.address.isEmpty()) {
            String[] addressParts = address.split(", ");
            if (addressParts.length == 4) {
                this.detailAddress = addressParts[0];
                this.ward = addressParts[1];
                this.district = addressParts[2];
                this.city = addressParts[3];
            }
        }
    }
    
}
