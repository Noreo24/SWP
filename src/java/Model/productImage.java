/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class ProductImage {

    private String products_images_id,
            product_id,
            status,
            images;

    public ProductImage() {
    }

    public ProductImage(String products_images_id, String product_id, String status, String images) {
        this.products_images_id = products_images_id;
        this.product_id = product_id;
        this.status = status;
        this.images = images;
    }

    public String getProducts_images_id() {
        return products_images_id;
    }

    public void setProducts_images_id(String products_images_id) {
        this.products_images_id = products_images_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
    
}
