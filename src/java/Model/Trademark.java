/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Trademark{


    private String trademark_id,
            trademark_name,
            status;

    public Trademark() {

    }

    public Trademark(String trademark_id, String trademark_name, String status) {
        this.trademark_id = trademark_id;
        this.trademark_name = trademark_name;
        this.status = status;
    }

    public String getTrademark_id() {
        return trademark_id;
    }

    public void setTrademark_id(String trademark_id) {
        this.trademark_id = trademark_id;
    }

    public String getTrademark_name() {
        return trademark_name;
    }

    public void setTrademark_name(String trademark_name) {
        this.trademark_name = trademark_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    //Khai báo các thành phần xủ lý DB
    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu
 
    public ArrayList<Trademark> getAllTrademarks() {
        
        return null;
        
    }
}
