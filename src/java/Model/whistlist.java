/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class whistlist {

    private String whistlist_id,
            userId,
            productId;

    public whistlist() {
    }

    public whistlist(String whistlist_id, String userId, String productId) {
        this.whistlist_id = whistlist_id;
        this.userId = userId;
        this.productId = productId;
    }

    public String getWhistlist_id() {
        return whistlist_id;
    }

    public void setWhistlist_id(String whistlist_id) {
        this.whistlist_id = whistlist_id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }
    
}
