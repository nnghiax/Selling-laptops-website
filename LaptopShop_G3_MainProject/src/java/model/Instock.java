/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vutie
 */
public class Instock {
    private String whID;
    private String whName;
    private int count;

    public Instock() {
    }

    public Instock(String whID, String whName, int count) {
        this.whID = whID;
        this.whName = whName;
        this.count = count;
    }

    public String getWhID() {
        return whID;
    }

    public void setWhID(String whID) {
        this.whID = whID;
    }

    public String getWhName() {
        return whName;
    }

    public void setWhName(String whName) {
        this.whName = whName;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Instock{" + "whID=" + whID + ", whName=" + whName + ", count=" + count + '}';
    }
    
}
