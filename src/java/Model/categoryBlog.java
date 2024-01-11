/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class categoryBlog {

    private String categoryBlog_id,
            categoryBlog_name,
            status;

    public categoryBlog() {
    }

    public categoryBlog(String categoryBlog_id, String categoryBlog_name, String status) {
        this.categoryBlog_id = categoryBlog_id;
        this.categoryBlog_name = categoryBlog_name;
        this.status = status;
    }

    public String getCategoryBlog_id() {
        return categoryBlog_id;
    }

    public void setCategoryBlog_id(String categoryBlog_id) {
        this.categoryBlog_id = categoryBlog_id;
    }

    public String getCategoryBlog_name() {
        return categoryBlog_name;
    }

    public void setCategoryBlog_name(String categoryBlog_name) {
        this.categoryBlog_name = categoryBlog_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
