/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

/**
 *
 * @author Nguyen Bao
 */

public class BlogPostType {
    private String TypeID;
    private String TypeName;

    public BlogPostType() {
    }

    public BlogPostType(String TypeID, String TypeName) {
        this.TypeID = TypeID;
        this.TypeName = TypeName;
    }

    public String getTypeID() {
        return TypeID;
    }

    public void setTypeID(String TypeID) {
        this.TypeID = TypeID;
    }

    public String getTypeName() {
        return TypeName;
    }

    public void setTypeName(String TypeName) {
        this.TypeName = TypeName;
    }

    @Override
    public String toString() {
        return "BlogPostType{" + "TypeID=" + TypeID + ", TypeName=" + TypeName + '}';
    }
}
