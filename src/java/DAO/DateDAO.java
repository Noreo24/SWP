/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Model.Date;

/**
 *
 * @author son22
 */
public class DateDAO extends DBContext {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public int CountDayByStartEnd(String start, String end) {
        String query = "SELECT DATEDIFF(day, ?, ?)";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, start);
            stm.setString(2, end);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1)+1;
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public Date get7day() {
        String query = "select GETDATE(), GETDATE()-6";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Date date = Date.builder()
                        .start(rs.getDate(2))
                        .end(rs.getDate(1))
                        .build();
                return date;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

}
