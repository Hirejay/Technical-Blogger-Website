/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author Jay Hire
 */
import com.tech.blog.entities.Categories;
import java.sql.*;
import java.util.ArrayList;

public class Categoriesdao {

    private Connection con;

    public Categoriesdao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Categories> getallcategories(){
        ArrayList<Categories> list=new ArrayList<>();
        try{
            String query="select * from categories;";
            PreparedStatement prt=this.con.prepareStatement(query);
            ResultSet rs=prt.executeQuery();
            while(rs.next()){
                int cid=rs.getInt("cid");
                String cname=rs.getString("cname");
                String cdescription=rs.getString("cdescription");
                Categories cat=new Categories(cid,cname,cdescription);
                list.add(cat);
                
                
                
            }
            
        }catch(Exception e){
            
        }
        return list;
    }

}
