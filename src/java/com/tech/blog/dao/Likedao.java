/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import java.sql.*;
/**
 *
 * @author Jay Hire
 */
public class Likedao {
    private Connection con;

    public Likedao(Connection con) {
        this.con = con;
    }
    public boolean insertlike(int pid,int uid){
        boolean f=false;
        try{
            String query="insert into liked(pid,uid) values (?,?);";
            PreparedStatement prt=this.con.prepareStatement(query);
            prt.setInt(1,pid);
            prt.setInt(2, uid);
            prt.executeUpdate();
            
            f=true;
        }
        catch(Exception e){
            
        }
        return f;
    }
    public int countlikeonpost(int pid){
        
        int ans=0;
        
        try{
            String query="select count(*) from liked where pid=?; ";
            PreparedStatement prt=this.con.prepareStatement(query);
            prt.setInt(1, pid);
            ResultSet rs=prt.executeQuery();
            if(rs.next()){
                ans=rs.getInt("count(*)");
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return ans;
        
    }
    
    public boolean islikebyuser(int pid,int uid){
        boolean f=false;
        
        try{
            String query="select *from liked where pid=? and uid=?;";
            PreparedStatement prt=this.con.prepareStatement(query);
            prt.setInt(1, pid);
            prt.setInt(2,uid);
            ResultSet rs=prt.executeQuery();
            while(rs.next()){
                f=true;
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        return f;
        
    }
    public boolean deletelike(int pid,int uid){
        
        
        boolean f=false;
        try{
            
            String query="delete from liked where pid=? and uid=?;";
            PreparedStatement prt=this.con.prepareStatement(query);
            prt.setInt(1, pid);
            prt.setInt(2,uid);
            prt.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        
        return f;
        
    }
    
}
