/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author Admin
 */
public class order {

    private String order_id,
            total_cost,
            fullName,
            phone,
            address,
            status_order,
            userId,
            saler_id,
            note,
            order_code;
    String orderDate;

    public order() {
    }

    public order(String order_id, String orderDate, String total_cost, String fullName, String phone, String address, String status_order, String userId, String saler_id, String note) {
        this.order_id = order_id;
        this.orderDate = orderDate;
        this.total_cost = total_cost;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.status_order = status_order;
        this.userId = userId;
        this.saler_id = saler_id;
        this.note = note;
    }

    public order(String order_id, java.sql.Date orderDate, String total_cost, String fullName, String phone, String address, String status_order, String userId, String saler_id, String note) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getOrder_code() {
        return order_code;
    }

    public void setOrder_code(String order_code) {
        this.order_code = order_code;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(String total_cost) {
        this.total_cost = total_cost;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus_order() {
        return status_order;
    }

    public void setStatus_order(String status_order) {
        this.status_order = status_order;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSaler_id() {
        return saler_id;
    }

    public void setSaler_id(String saler_id) {
        this.saler_id = saler_id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatusString() {
        if (status_order == null) {
            return "Completed";
        }
        if (status_order.equals("0")) {
            return "Pending";
        }
        return "Paid/Pending";
    }

    public String getFormatDate() {
        // Input format of the orderDate
        DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");

        // Output format of the orderDate
        DateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");

        try {
            // Parse the input orderDate string into a Date object
            java.util.Date date = inputFormat.parse(orderDate);

            // Format the Date object into the desired output format
            String formattedDate = outputFormat.format(date);

            return formattedDate;
        } catch (ParseException e) {
            // Handle the ParseException, if parsing fails
            e.printStackTrace();
            return ""; // or any default value indicating error
        }
    }

}
