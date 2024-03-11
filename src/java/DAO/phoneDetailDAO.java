/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.PhoneDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class phoneDetailDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public PhoneDetail phoneDetail(String pid) {

        String query = "select * from Phone_detail where product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, pid);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new PhoneDetail(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addPhoneDetail(String color, String screen_size, String screen_tech, 
            String camera_rear, String front_camera, String chip, 
            String ram, String rom, String pin, 
            String sim, String operation_system, String screen_feature, 
            String product_id, String other_feature) {
        String query = "INSERT into Phone_detail(color, screen_size, screen_tech, camera_rear, front_camera, chip, ram, rom, pin, sim, operation_system, screen_feature, product_id, other_feature) \n"
                + "	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, color);
            stm.setString(2, screen_size);
            stm.setString(3, screen_tech);
            stm.setString(4, camera_rear);
            stm.setString(5, front_camera);
            stm.setString(6, chip);
            stm.setString(7, ram);
            stm.setString(8, rom);
            stm.setString(9, pin);
            stm.setString(10, sim);
            stm.setString(11, operation_system);
            stm.setString(12, screen_feature);
            stm.setString(13, product_id);
            stm.setString(14, other_feature);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        phoneDetailDAO pdDAO = new phoneDetailDAO();
        String pid = "4";
        PhoneDetail pd = pdDAO.phoneDetail(pid);
    }
}
