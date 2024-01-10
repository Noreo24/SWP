/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Product;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class productDAO {
    //Khai báo các thành phần xủ lý DB

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public ArrayList<Product> getAllNewProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String query = "select p.*, i.images from Product p, Products_Images i where p.status = 1 and i.status = 1 and p.product_id = i.product_id";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        String.valueOf(rs.getInt(8)),
                        String.valueOf(rs.getBoolean(9)),
                        String.valueOf(rs.getInt(10)),
                        String.valueOf(rs.getInt(11)),
                        String.valueOf(rs.getInt(12)),
                        String.valueOf(rs.getDate(13)),
                        String.valueOf(rs.getInt(14)),
                        String.valueOf(rs.getInt(15)),
                        rs.getString(16)
                ));
            }
        } catch (Exception e) {
        }
        return list;

    }
}
