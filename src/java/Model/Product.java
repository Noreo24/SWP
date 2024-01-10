/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Product {

    private String product_id, product_name, original_prices, sale, sale_prices, product_hightlight, product_description, trademark, status, quantity, guarantee, category_id, update_date, sole, avr_rate_star, image;

    public Product() {
    }

    public Product(String product_id, String product_name, String original_prices, String sale, String sale_prices, String product_hightlight, String product_description, String trademark, String status, String quantity, String guarantee, String category_id, String update_date, String sole, String avr_rate_star, String image) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.original_prices = original_prices;
        this.sale = sale;
        this.sale_prices = sale_prices;
        this.product_hightlight = product_hightlight;
        this.product_description = product_description;
        this.trademark = trademark;
        this.status = status;
        this.quantity = quantity;
        this.guarantee = guarantee;
        this.category_id = category_id;
        this.update_date = update_date;
        this.sole = sole;
        this.avr_rate_star = avr_rate_star;
        this.image = image;
    }





    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getOriginal_prices() {
        return original_prices;
    }

    public void setOriginal_prices(String original_prices) {
        this.original_prices = original_prices;
    }

    public String getSale() {
        return sale;
    }

    public void setSale(String sale) {
        this.sale = sale;
    }

    public String getSale_prices() {
        return sale_prices;
    }

    public void setSale_prices(String sale_prices) {
        this.sale_prices = sale_prices;
    }

    public String getProduct_hightlight() {
        return product_hightlight;
    }

    public void setProduct_hightlight(String product_hightlight) {
        this.product_hightlight = product_hightlight;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public String getTrademark() {
        return trademark;
    }

    public void setTrademark(String trademark) {
        this.trademark = trademark;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }

    public String getSole() {
        return sole;
    }

    public void setSole(String sole) {
        this.sole = sole;
    }

    public String getAvr_rate_star() {
        return avr_rate_star;
    }

    public void setAvr_rate_star(String avr_rate_star) {
        this.avr_rate_star = avr_rate_star;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
