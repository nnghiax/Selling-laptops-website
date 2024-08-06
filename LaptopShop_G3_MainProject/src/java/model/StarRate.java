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

public class StarRate {
    private int onestar;
    private int twostar;
    private int threestar;
    private int fourstar;
    private int fivestar;

    public StarRate() {
    }

    public StarRate(int onestar, int twostar, int threestar, int fourstar, int fivestar) {
        this.onestar = onestar;
        this.twostar = twostar;
        this.threestar = threestar;
        this.fourstar = fourstar;
        this.fivestar = fivestar;
    }

    public int getOnestar() {
        return onestar;
    }

    public void setOnestar(int onestar) {
        this.onestar = onestar;
    }

    public int getTwostar() {
        return twostar;
    }

    public void setTwostar(int twostar) {
        this.twostar = twostar;
    }

    public int getThreestar() {
        return threestar;
    }

    public void setThreestar(int threestar) {
        this.threestar = threestar;
    }

    public int getFourstar() {
        return fourstar;
    }

    public void setFourstar(int fourstar) {
        this.fourstar = fourstar;
    }

    public int getFivestar() {
        return fivestar;
    }

    public void setFivestar(int fivestar) {
        this.fivestar = fivestar;
    }

    @Override
    public String toString() {
        return "StarRate{" + "onestar=" + onestar + ", twostar=" + twostar + ", threestar=" + threestar + ", fourstar=" + fourstar + ", fivestar=" + fivestar + '}';
    }
    
    
}
