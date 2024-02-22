/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
<<<<<<< HEAD
public class productImage {

    private String products_images_id,
            product_id,
            status,
            images;
=======
// ProductImage.java
public class ProductImage {
    private int productsImagesId;
    private int productId;
    private boolean status;
    private String images;
>>>>>>> 51d25809906605ac8e4ce6aa7ab5edf1d3e40558

    public productImage() {
    }

<<<<<<< HEAD
    public productImage(String products_images_id, String product_id, String status, String images) {
        this.products_images_id = products_images_id;
        this.product_id = product_id;
=======
    public ProductImage(int productsImagesId, int productId, boolean status, String images) {
        this.productsImagesId = productsImagesId;
        this.productId = productId;
>>>>>>> 51d25809906605ac8e4ce6aa7ab5edf1d3e40558
        this.status = status;
        this.images = images;
    }

    public int getProductsImagesId() {
        return productsImagesId;
    }

    public void setProductsImagesId(int productsImagesId) {
        this.productsImagesId = productsImagesId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}

