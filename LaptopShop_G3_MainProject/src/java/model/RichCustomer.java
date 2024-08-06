/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

/**
 *
 * @author Nguyen Bao
 */

public class RichCustomer {
    private String name;
    private String address;
    private String gender;
    private String birthdate;
    private double totalpay;

    public RichCustomer() {
    }

    public RichCustomer(String name, String address, String gender, String birthdate, double totalpay) {
        this.name = name;
        this.address = address;
        this.gender = gender;
        this.birthdate = birthdate;
        this.totalpay = totalpay;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public double getTotalpay() {
        return totalpay;
    }

    public void setTotalpay(double totalpay) {
        this.totalpay = totalpay;
    }

    @Override
    public String toString() {
        return "RichCustomer{" + "name=" + name + ", address=" + address + ", gender=" + gender + ", birthdate=" + birthdate + ", totalpay=" + totalpay + '}';
    }

    
    
    
}   
