/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.LaptopDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class laptopDetailDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public LaptopDetail lapDetail(String pid) {

        String query = "select * from Laptop_detail where product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, pid);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new LaptopDetail(
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
                        rs.getString(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editLaptopDetail(String product_id, String color, String screen_size, String screen_tech,
            String chip, String ram, String pin, String operation_system, String screen_feature, String other_feature) {
        String query = "UPDATE Laptop_detail\n"
                + "SET color = ?, screen_size = ?, screen_tech = ?, chip= ?, ram = ?,\n"
                + "pin = ?, operation_system = ?, screen_feature = ?, other_feature = ? "
                + "WHERE product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, color);
            stm.setString(2, screen_size);
            stm.setString(3, screen_tech);
            stm.setString(4, chip);
            stm.setString(5, ram);
            stm.setString(6, pin);
            stm.setString(7, operation_system);
            stm.setString(8, screen_feature);
            stm.setString(9, other_feature);
            stm.setString(10, product_id);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public void addLaptopDetail(String productId, String color, String screen_size, String screen_tech, String chip, String ram, String pin, String operation_system, String screen_feature, String other_feature) {
        String query = "INSERT into Laptop_detail(color, screen_size, screen_tech, chip, ram, pin, operation_system, screen_feature, product_id, other_feature)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, color);
            stm.setString(2, screen_size);
            stm.setString(3, screen_tech);
            stm.setString(4, chip);
            stm.setString(5, ram);
            stm.setString(6, pin);
            stm.setString(7, operation_system);
            stm.setString(8, screen_feature);
            stm.setString(9, productId);
            stm.setString(10, other_feature);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        laptopDetailDAO ltDAO = new laptopDetailDAO();
        String pid = "3";
//        LaptopDetail lt = ltDAO.lapDetail(pid);
        ltDAO.editLaptopDetail(pid, pid, pid, pid, pid, pid, pid, pid, pid, pid);
    }
}
