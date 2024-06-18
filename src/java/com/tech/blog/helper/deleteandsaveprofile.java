/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Jay Hire
 */
public class deleteandsaveprofile {

    public static boolean deleteprofile(String path) {
        boolean f = false;

        try {
            File file = new File(path);
            file.delete();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public static boolean saveprofile(InputStream is, String path) {
        boolean f = false;
        try {
            byte b[] = new byte[is.available()];
            
            FileOutputStream fos = new FileOutputStream(path);
            int bytesRead = 0;
            while ((bytesRead = is.read(b)) != -1) {
                System.out.println(bytesRead);
                fos.write(b, 0, bytesRead);
            }
            
            fos.flush();
            fos.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

}
