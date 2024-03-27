/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAO.categoryDAO;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class p {
    private int productId;
    private String productName;
    private int originalPrices;
    private boolean sale;
    private int salePrices;
    private String productHighlights;
    private String productDescription;
    private int trademarkId;
    private boolean status;
    private int quantity;
    private int guarantee;
    private int categoryId;
    private Date updateDate;
    private int sole;
    private int avrRatedStar;
    private List<pimg> productImages; // List to store product images
    private Category category;

    public p() {
    }

    public p(int productId, String productName, int originalPrices, boolean sale, int salePrices,
                   String productHighlights, String productDescription, int trademarkId, boolean status,
                   int quantity, int guarantee, int categoryId, Date updateDate, int sole, int avrRatedStar,
                   List<pimg> productImages) {
        this.productId = productId;
        this.productName = productName;
        this.originalPrices = originalPrices;
        this.sale = sale;
        this.salePrices = salePrices;
        this.productHighlights = productHighlights;
        this.productDescription = productDescription;
        this.trademarkId = trademarkId;
        this.status = status;
        this.quantity = quantity;
        this.guarantee = guarantee;
        this.categoryId = categoryId;
        this.updateDate = updateDate;
        this.sole = sole;
        this.avrRatedStar = avrRatedStar;
        this.productImages = productImages;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Category getCategory() {
        return category;
    }
    
    

    // Add getters and setters for the new property
    public List<pimg> getProductImages() {
        return productImages;
    }

    public void setProductImages(List<pimg> productImages) {
        this.productImages = productImages;
    }

    // Add getters and setters

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getOriginalPrices() {
        return originalPrices;
    }

    public void setOriginalPrices(int originalPrices) {
        this.originalPrices = originalPrices;
    }

    public boolean isSale() {
        return sale;
    }

    public void setSale(boolean sale) {
        this.sale = sale;
    }

    public int getSalePrices() {
        return salePrices;
    }

    public void setSalePrices(int salePrices) {
        this.salePrices = salePrices;
    }

    public String getProductHighlights() {
        return productHighlights;
    }

    public void setProductHighlights(String productHighlights) {
        this.productHighlights = productHighlights;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public int getTrademarkId() {
        return trademarkId;
    }

    public void setTrademarkId(int trademarkId) {
        this.trademarkId = trademarkId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(int guarantee) {
        this.guarantee = guarantee;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getSole() {
        return sole;
    }

    public void setSole(int sole) {
        this.sole = sole;
    }

    public int getAvrRatedStar() {
        return avrRatedStar;
    }

    public void setAvrRatedStar(int avrRatedStar) {
        this.avrRatedStar = avrRatedStar;
    }
    
    public String getSalePercent() {
        double percentage = 100 - ((double) salePrices / originalPrices) * 100;
        System.out.println(percentage);        
        return (int)percentage + "%";
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", sole=" + sole + '}';
    }
    
    
    
}
