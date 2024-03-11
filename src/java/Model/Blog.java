/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Blog {

    private String blog_id,
            title,
            author_id,
            updated_date,
            content,
            thumbnail,
            brief_infor,
            categoryBlog_id,
            status;

    public Blog() {
    }

    public Blog(String blog_id, String title, String author_id, String updated_date, String content, String thumbnail, String brief_infor, String categoryBlog_id, String status) {
        this.blog_id = blog_id;
        this.title = title;
        this.author_id = author_id;
        this.updated_date = updated_date;
        this.content = content;
        this.thumbnail = thumbnail;
        this.brief_infor = brief_infor;
        this.categoryBlog_id = categoryBlog_id;
        this.status = status;
    }

    public String getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(String blog_id) {
        this.blog_id = blog_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(String author_id) {
        this.author_id = author_id;
    }

    public String getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(String updated_date) {
        this.updated_date = updated_date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getBrief_infor() {
        return brief_infor;
    }

    public void setBrief_infor(String brief_infor) {
        this.brief_infor = brief_infor;
    }

    public String getCategoryBlog_id() {
        return categoryBlog_id;
    }

    public void setCategoryBlog_id(String categoryBlog_id) {
        this.categoryBlog_id = categoryBlog_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
