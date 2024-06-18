/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author Jay Hire
 */
public class Message {
    private String content;
    private String type;
    private String cssclass;

    public Message(String content, String type, String cssclass) {
        this.content = content;
        this.type = type;
        this.cssclass = cssclass;
    }

    public String getContent() {
        return content;
    }

    public String getType() {
        return type;
    }

    public String getCssclass() {
        return cssclass;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setCssclass(String cssclass) {
        this.cssclass = cssclass;
    }
    
    
}
