/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
/**
 *
 * @author Jay Hire
 */
public class Userdao {
    private Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user){
        boolean f=false;
        try{
            String query="insert into user (uname,uemail,upassword,ugender,uabout) values (?,?,?,?,?);";
            PreparedStatement prt=this.con.prepareStatement(query);
            prt.setString(1,user.getUname());
            prt.setString(2,user.getUemail());
            prt.setString(3,user.getUpassword());
            prt.setString(4,user.getUgender());
            prt.setString(5,user.getUabout());
            prt.executeUpdate();
            f=true;
            
            
        }catch(Exception e){
            e.printStackTrace();
            
        }
        return f;
        
    }
    
    public User getuserbyemailandpassword(String email,String password){
        User user=null;
        
        try{
            
            String query="select *from user where uemail=? and upassword=?;";
            PreparedStatement prt=this.con.prepareStatement(query);
            prt.setString(1, email);
            prt.setString(2, password);
            ResultSet rs=prt.executeQuery();
            
            if(rs.next()){
                user=new User();
                user.setUid(rs.getInt("uid"));
                user.setUname(rs.getString("uname"));
                user.setUemail(rs.getString("uemail"));
                user.setUpassword(rs.getString("upassword"));
                user.setUgender(rs.getString("ugender"));
                user.setUabout(rs.getString("uabout"));
                user.setUdate(rs.getTimestamp("udate"));
                user.setUprofile(rs.getString("uprofile"));
                return user;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        return user;
        
    }
    public boolean updateuser(User user){
        boolean f=false;
        try{
            
            String query="update user set uemail=?, upassword=?, uabout=?, uprofile=? where uid=?;";
            PreparedStatement prt=this.con.prepareStatement(query);
            prt.setString(1,user.getUemail());  
            prt.setString(2,user.getUpassword());
            prt.setString(3,user.getUabout());
            prt.setString(4,user.getUprofile());
            prt.setInt(5,user.getUid());
            
            prt.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    public User getuserbyuid(int userid){
        User user=new User();
        try{
            String query="select *from user where uid=?";
            PreparedStatement prt=this.con.prepareStatement(query);
            prt.setInt(1, userid);
            ResultSet rs=prt.executeQuery();
            while(rs.next()){
                user=new User();
                user.setUid(rs.getInt("uid"));
                user.setUname(rs.getString("uname"));
                user.setUemail(rs.getString("uemail"));
                user.setUpassword(rs.getString("upassword"));
                user.setUgender(rs.getString("ugender"));
                user.setUabout(rs.getString("uabout"));
                user.setUdate(rs.getTimestamp("udate"));
                user.setUprofile(rs.getString("uprofile"));
               
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return user;
        
    }
    
}
