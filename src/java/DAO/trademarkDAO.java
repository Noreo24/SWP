/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Trademark;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class trademarkDAO {
    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu
    
    public List<Trademark> listAllTrademark(){
        List<Trademark> list = new ArrayList<>();
        String query = "select * from Trademark";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Trademark(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public int countNumberOfTrademarks() {
        String query = "select count (*) from Trademark";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int countNumberOfProductOfEachTrademark(String trademark_id) {
        String query = "select count(quantity) from Product where trademark_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, trademark_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public static void main(String[] args) {
        trademarkDAO tmdao = new trademarkDAO();

        List<Trademark> feedbackList = tmdao.listAllTrademark();
        for (Trademark o : feedbackList) {
            System.out.println(o.getTrademark_name());
        }
    }
}
