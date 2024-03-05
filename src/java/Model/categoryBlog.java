/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class CategoryBlog {

    private String categoryBlog_id,
            categoryBlog_name,
            numblog,
            status;

    public CategoryBlog() {
    }

    public CategoryBlog(String categoryBlog_id, String categoryBlog_name, String status) {
        this.categoryBlog_id = categoryBlog_id;
        this.categoryBlog_name = categoryBlog_name;
        this.status = status;
    }

    public CategoryBlog(String categoryBlog_id, String categoryBlog_name, String numblog, String status) {
        this.categoryBlog_id = categoryBlog_id;
        this.categoryBlog_name = categoryBlog_name;
        this.numblog = numblog;
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

    public String getNumblog() {
        return numblog;
    }

    public void setNumblog(String numblog) {
        this.numblog = numblog;
    }
    
}
