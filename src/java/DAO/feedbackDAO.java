/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class feedbackDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public int numberOfFeedback(String product_id) {
        String query = "select count (*) from Feedback where product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, product_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<feedback> getFeedbackByProductId(String product_id) {
        List<feedback> list = new ArrayList<>();
        String query = "select * from Feedback where product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, product_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new feedback(
                        rs.getString(1), // feedBack_id
                        rs.getString(2), // fullName
                        rs.getString(3), // rated_star
                        rs.getString(4), // feedback
                        rs.getString(5), // image
                        rs.getString(6), // status
                        rs.getString(7), // product_id
                        rs.getString(8), // userId
                        rs.getString(9))); // date
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<feedback> feedbackPaging(String product_id, int pageNumber) {
        List<feedback> list = new ArrayList<>();
        String query = "select * from Feedback "
                + "where product_id = ? "
                + "order by date desc "
                + "offset ? rows fetch next 3 rows only ";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, product_id);
            stm.setInt(2, (pageNumber-1)*3);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new feedback(
                        rs.getString(1), // feedBack_id
                        rs.getString(2), // fullName
                        rs.getString(3), // rated_star
                        rs.getString(4), // feedback
                        rs.getString(5), // image
                        rs.getString(6), // status
                        rs.getString(7), // product_id
                        rs.getString(8), // userId
                        rs.getString(9))); // date
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        feedbackDAO fDAO = new feedbackDAO();
        String pid = "1";
//        List<feedback> feedbackList = fDAO.getFeedbackByProductId(pid);
//        for (feedback o : feedbackList) {
//            System.out.println(o.getFullName());
//        }
        System.out.println("Down");
        List<feedback> feedbackPaging = fDAO.feedbackPaging(pid,2);
        for (feedback o : feedbackPaging) {
            System.out.println(o.getFullName());
        }
    }
}
