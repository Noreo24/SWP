/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class feedback {

    private String feedBack_id,
            fullName,
            rated_star,
            feedback,
            image,
            status,
            product_id,
            userId,
            date;

    public feedback() {
    }

    public feedback(String feedBack_id, String fullName, String rated_star, String feedback, String image, String status, String product_id, String userId, String date) {
        this.feedBack_id = feedBack_id;
        this.fullName = fullName;
        this.rated_star = rated_star;
        this.feedback = feedback;
        this.image = image;
        this.status = status;
        this.product_id = product_id;
        this.userId = userId;
        this.date = date;
    }

    public String getFeedBack_id() {
        return feedBack_id;
    }

    public void setFeedBack_id(String feedBack_id) {
        this.feedBack_id = feedBack_id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRated_star() {
        return rated_star;
    }

    public void setRated_star(String rated_star) {
        this.rated_star = rated_star;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
