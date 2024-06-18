/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author Jay Hire
 */
public class Postdao {

    private Connection con;

    public Postdao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getAllCategories() {
        ArrayList<Categories> list = new ArrayList<>();
        try {

            String query = "select *from categories;";
            Statement smt = this.con.createStatement();
            ResultSet rs = smt.executeQuery(query);
            while (rs.next()) {

                int cid = rs.getInt("cid");
                String cname = rs.getString("cname");
                String cdescription = rs.getString("cdescription");
                Categories c = new Categories(cid, cname, cdescription);
                list.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savepost(Post p) {
        boolean f = false;

        try {
            String query = "Insert into post(ptitle,pcontent,pcode,ppic,cid,uid) values (?,?,?,?,?,?);";
            PreparedStatement prt = this.con.prepareStatement(query);
            prt.setString(1, p.getPtitle());
            prt.setString(2, p.getPcontent());
            prt.setString(3, p.getPcode());
            prt.setString(4, p.getPpic());
            prt.setInt(5, p.getCid());
            prt.setInt(6, p.getUid());
            prt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();

        }

        return f;
    }

    public ArrayList<Post> getallpost() {
        ArrayList<Post> list = new ArrayList<>();
        try {

            String query = "select * from post;";
            PreparedStatement prt = this.con.prepareStatement(query);
            ResultSet rs = prt.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String ptitle = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String pcode = rs.getString("pcode");
                String ppic = rs.getString("ppic");
                Timestamp pdate = rs.getTimestamp("pdate");
                int cid = rs.getInt("cid");
                int uid = rs.getInt("uid");
                Post post = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, cid, uid);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Post> getpostbycid(int catid) {
        ArrayList<Post> list = new ArrayList<>();
        try {

            String query = "select * from post where cid=?;";
            PreparedStatement prt = this.con.prepareStatement(query);
            prt.setInt(1,catid);
            ResultSet rs = prt.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String ptitle = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String pcode = rs.getString("pcode");
                String ppic = rs.getString("ppic");
                Timestamp pdate = rs.getTimestamp("pdate");
                int cid = rs.getInt("cid");
                int uid = rs.getInt("uid");
                Post post = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, cid, uid);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getpostbypid(int postid){
        Post post=new Post();
        
        try{
            
            String query="select * from post where pid=?";
            PreparedStatement prt=this.con.prepareStatement(query);
            prt.setInt(1, postid);
            ResultSet rs=prt.executeQuery();
            while(rs.next()){
                int pid=rs.getInt("pid");
                String ptitle=rs.getString("ptitle");
                String pcontent=rs.getString("pcontent");
                String pcode=rs.getString("pcode");
                String ppic=rs.getString("ppic");
                Timestamp pdate=rs.getTimestamp("pdate");
               int cid=rs.getInt("cid");
               int uid=rs.getInt("uid");
               post=new Post(pid, ptitle, pcontent, pcode, ppic, pdate, cid, uid);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        
        return post;
        
    }

}
