/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductImagesDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public List<ProductImage> getImageByProductId(String product_id) {
        List<ProductImage> listImage = new ArrayList<>();
        String query = "select * from "
                + "Products_Images [pi] join Product p "
                + "on [pi].product_id = p.product_id "
                + "where p.product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, product_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                listImage.add(new ProductImage(
                        rs.getInt(1), // products_images_id
                        rs.getInt(2), // product_id
                        rs.getBoolean(3), // status
                        rs.getString(4))); // images
            }
        } catch (Exception e) {
        }
        return listImage;
    }
    
    public List<ProductImage> getAllImage() {
        List<ProductImage> listImage = new ArrayList<>();
        String query = "select * from Products_Images [pi]";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                listImage.add(new ProductImage(
                        rs.getInt(1), // products_images_id
                        rs.getInt(2), // product_id
                        rs.getBoolean(3), // status
                        rs.getString(4))); // images
            }
        } catch (Exception e) {
        }
        return listImage;
    }
    
    public static void main(String[] args) {
       
    }
}
