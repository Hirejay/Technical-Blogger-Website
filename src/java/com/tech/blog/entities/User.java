/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;
import java.sql.*;
/**
 *
 * @author Jay Hire
 */
public class User {
    
    private int uid;
    private String uname;
    private String uemail;
    private String upassword;
    private String ugender;
    private String uabout;
    private Timestamp udate;
    private String uprofile;
    public User(int uid, String uname, String uemail, String upassword, String ugender, String uabout, Timestamp udate) {
        this.uid = uid;
        this.uname = uname;
        this.uemail = uemail;
        this.upassword = upassword;
        this.ugender = ugender;
        this.uabout = uabout;
        this.udate = udate;
    }

    public User() {
    }

    public User(String uname, String uemail, String upassword, String ugender, String uabout) {
        this.uname = uname;
        this.uemail = uemail;
        this.upassword = upassword;
        this.ugender = ugender;
        this.uabout = uabout;
       
    }

    public int getUid() {
        return uid;
    }

    public String getUname() {
        return uname;
    }

    public String getUemail() {
        return uemail;
    }

    public String getUpassword() {
        return upassword;
    }

    public String getUgender() {
        return ugender;
    }

    public String getUabout() {
        return uabout;
    }

    public Timestamp getUdate() {
        return udate;
    }

    public String getUprofile() {
        return uprofile;
    }
    

    public void setUid(int uid) {
        this.uid = uid;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    public void setUabout(String uabout) {
        this.uabout = uabout;
    }

    public void setUdate(Timestamp udate) {
        this.udate = udate;
    }

    public void setUprofile(String uprofile) {
        this.uprofile = uprofile;
    }
   
    
    
}
