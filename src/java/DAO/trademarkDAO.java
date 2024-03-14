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

    public List<Trademark> listAllTrademark() {
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
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Trademark getTrademarkByID(int id) {
        String query = "select * from Trademark\n"
                + "where trademark_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Trademark(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
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

    public Trademark getTrademarkByPID(String product_id) {
        String query = "SELECT tm.trademark_id, tm.trademark_name, tm.status "
                + "FROM Trademark tm left JOIN Product p "
                + "ON p.trademark_id = tm.trademark_id "
                + "where p.product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, product_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Trademark(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        trademarkDAO tmdao = new trademarkDAO();

        Trademark feedbackList = tmdao.getTrademarkByPID("1");
        System.out.println(feedbackList.getTrademark_name());
    }

    public void add(Trademark trademark) {
        String query = ""
                + "INSERT INTO [Trademark]\n"
                + "           ([trademark_name]\n"
                + "           ,[status]\n"
                + "           ,[description]\n"
                + "           ,[img])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?)";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, trademark.getTrademark_name());
            stm.setString(2, trademark.getStatus());
            stm.setString(3, trademark.getDescription());
            stm.setString(4, trademark.getImg());
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void update(Trademark trademark) {
        String query = ""
                + "UPDATE [dbo].[Trademark]\n"
                + "   SET [trademark_name] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[img] = ?\n"
                + " WHERE trademark_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, trademark.getTrademark_name());
            stm.setString(2, trademark.getStatus());
            stm.setString(3, trademark.getDescription());
            stm.setString(4, trademark.getImg());
            stm.setString(5, trademark.getTrademark_id());
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
}
