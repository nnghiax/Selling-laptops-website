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

public class BlogStatusByDate {
    private int show;
    private int hide;

    public BlogStatusByDate() {
    }

    public BlogStatusByDate(int show, int hide) {
        this.show = show;
        this.hide = hide;
    }

    public int getShow() {
        return show;
    }

    public void setShow(int show) {
        this.show = show;
    }

    public int getHide() {
        return hide;
    }

    public void setHide(int hide) {
        this.hide = hide;
    }

    @Override
    public String toString() {
        return "BlogStatusByDate{" + "show=" + show + ", hide=" + hide + '}';
    }
    
    
}
