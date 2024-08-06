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

public class BlogStatus {

    private String id;
    private String title;
    private String content;
    private String user_id;
    private String date;
    private String img;
    private String description;
    private String type;
    private Boolean status;

    public BlogStatus() {
    }

    public BlogStatus(String id, String title, String content, String user_id, String date, String img, String description, String type, Boolean status) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.user_id = user_id;
        this.date = date;
        this.img = img;
        this.description = description;
        this.type = type;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "BlogStatus{" + "id=" + id + ", title=" + title + ", content=" + content + ", user_id=" + user_id + ", date=" + date + ", img=" + img + ", description=" + description + ", type=" + type + ", status=" + status + '}';
    }
    
    
}