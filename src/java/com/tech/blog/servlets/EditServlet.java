/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.deleteandsaveprofile;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Jay Hire
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String about = request.getParameter("about");
            Part part = request.getPart("profile");
            String profile = part.getSubmittedFileName();

            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentuser");
            user.setUemail(email);
            user.setUpassword(password);
            user.setUabout(about);
            String oldprofile = user.getUprofile();
            if (profile != null && !profile.isEmpty()) {
                user.setUprofile(profile);
            }

            
            Userdao dao = new Userdao(ConnectionProvider.getConnection());
            boolean ans = dao.updateuser(user);
            String newprofile = user.getUprofile();

            if (ans) {
                String ulDir = "C:/Users/Jay Hire/Documents/NetBeansProjects/TechBlog/web/pic";
                
                

                String oldpath = ulDir+ File.separator + oldprofile;
                String newpath = ulDir+ File.separator + newprofile;

                if (!oldprofile.equals("default.png")) {
                    deleteandsaveprofile.deleteprofile(oldpath);
                }
                if (!newprofile.equals("default.png")) {
                    deleteandsaveprofile.saveprofile(part.getInputStream(), newpath);
                }

                out.println("done");

            } else {
                out.println("error");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}