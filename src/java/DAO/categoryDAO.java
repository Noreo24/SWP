/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class categoryDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu
    public ArrayList<Category> getCategoryList() {
        ArrayList<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category b = new Category(String.valueOf(rs.getInt(1)),
                        rs.getString(2));
                list.add(b);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(
                        rs.getString(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countNumberOfCategories() {
        String query = "select count (*) from Category";
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

    public int countNumberOfProductOfEachCategory(String cate_id) {
        String query = "select count(quantity) from Product where category_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, cate_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public Category getCategoryByProductID(String product_id) {
        String query = "  select * from Category c join Product p "
                + "on c.category_id = p.category_id "
                + "where p.product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, product_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Category(
                        rs.getString(1),
                        rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }
}
