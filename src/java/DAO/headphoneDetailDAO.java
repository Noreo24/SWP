/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.HeadphoneDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class headphoneDetailDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public HeadphoneDetail headphoneDetail(String pid) {

        String query = "select * from Headphone_detail where product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, pid);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new HeadphoneDetail(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editHeadphoneDetail(String product_id, String connect, String color, String using_time,
            String sound_tech, String micro, String control_method, String waterproof, String other_feature) {
        String query = "UPDATE Headphone_detail\n"
                + "SET connect = ?, color = ?, using_time = ?, sound_tech = ?, micro= ?, control_method = ?,\n"
                + "waterproof = ?, other_feature = ? "
                + "WHERE product_id = ?";
        try {
            cnn = new DBContext().getConnection(); //mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, connect);
            stm.setString(2, color);
            stm.setString(3, using_time);
            stm.setString(4, sound_tech);
            stm.setString(5, micro);
            stm.setString(6, control_method);
            stm.setString(7, waterproof);
            stm.setString(8, other_feature);
            stm.setString(9, product_id);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public void addHeadphoneDetail(String product_id, String connect, String color, String using_time,
            String sound_tech, String micro, String control_method, String waterproof, String other_feature) {
        String query = "INSERT into Headphone_detail(connect, color, using_time, sound_tech, micro, control_method, waterproof, product_id, other_feature)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            cnn = new DBContext().getConnection(); //mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, connect);
            stm.setString(2, color);
            stm.setString(3, using_time);
            stm.setString(4, sound_tech);
            stm.setString(5, micro);
            stm.setString(6, control_method);
            stm.setString(7, waterproof);
            stm.setString(8, product_id);
            stm.setString(9, other_feature);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        headphoneDetailDAO hpDAO = new headphoneDetailDAO();
        String pid = "9";
        hpDAO.editHeadphoneDetail(pid, pid, pid, pid, pid, pid, pid, pid, pid);
    }
}
