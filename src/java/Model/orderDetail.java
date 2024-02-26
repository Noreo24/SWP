/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class orderDetail {

    private String orderDetail_id,
            product_price,
            quantity,
            order_id,
            product_id,
            total_cost;

    public orderDetail() {
    }

    public orderDetail(String orderDetail_id, String product_price, String quantity, String order_id, String product_id, String total_cost) {
        this.orderDetail_id = orderDetail_id;
        this.product_price = product_price;
        this.quantity = quantity;
        this.order_id = order_id;
        this.product_id = product_id;
        this.total_cost = total_cost;
    }

    public String getOrderDetail_id() {
        return orderDetail_id;
    }

    public void setOrderDetail_id(String orderDetail_id) {
        this.orderDetail_id = orderDetail_id;
    }

    public String getProduct_price() {
        return product_price;
    }

    public void setProduct_price(String product_price) {
        this.product_price = product_price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(String total_cost) {
        this.total_cost = total_cost;
    }
    
}
