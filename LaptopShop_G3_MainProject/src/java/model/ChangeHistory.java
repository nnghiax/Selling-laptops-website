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

public class ChangeHistory {
    private int Change_id;
    private String Changer_name;
    private String Change_name;
    private String Change_email;
    private String Change_phone;
    private String Change_date;

    public ChangeHistory() {
    }

    public ChangeHistory(int Change_id, String Changer_name, String Change_name, String Change_email, String Change_phone, String Change_date) {
        this.Change_id = Change_id;
        this.Changer_name = Changer_name;
        this.Change_name = Change_name;
        this.Change_email = Change_email;
        this.Change_phone = Change_phone;
        this.Change_date = Change_date;
    }

    public int getChange_id() {
        return Change_id;
    }

    public void setChange_id(int Change_id) {
        this.Change_id = Change_id;
    }

    public String getChanger_name() {
        return  Changer_name;
    }

    public void setChanger_name(String Changer_name) {
        this.Changer_name = Changer_name;
    }

    public String getChange_name() {
        return Change_name;
    }

    public void setChange_name(String Change_name) {
        this.Change_name = Change_name;
    }

    public String getChange_email() {
        return Change_email;
    }

    public void setChange_email(String Change_email) {
        this.Change_email = Change_email;
    }

    public String getChange_phone() {
        return Change_phone;
    }

    public void setChange_phone(String Change_phone) {
        this.Change_phone = Change_phone;
    }

    public String getChange_date() {
        return Change_date;
    }

    public void setChange_date(String Change_date) {
        this.Change_date = Change_date;
    }

    @Override
    public String toString() {
        return "ChangeHistory{" + "Change_id=" + Change_id + ", Changer_name=" + Changer_name + ", Change_name=" + Change_name + ", Change_email=" + Change_email + ", Change_phone=" + Change_phone + ", Change_date=" + Change_date + '}';
    }
}
