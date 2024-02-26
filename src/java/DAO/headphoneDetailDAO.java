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
    
    public static void main(String[] args) {
        headphoneDetailDAO hpDAO = new headphoneDetailDAO();
        String pid = "9";
        HeadphoneDetail hp = hpDAO.headphoneDetail(pid);
        System.out.println(hp.control_method);
    }
}
