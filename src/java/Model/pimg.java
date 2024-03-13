/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
// ProductImage.java
public class pimg {
    private int productsImagesId;
    private int productId;
    private boolean status;
    private String images;

    public pimg() {
    }

    public pimg(int productsImagesId, int productId, boolean status, String images) {
        this.productsImagesId = productsImagesId;
        this.productId = productId;
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

