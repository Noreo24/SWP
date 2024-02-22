/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class customerDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public Customer getCustomerByUsername(String username, String pass) {
        String query = "select * from Customer where user_name = ? and password = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, pass);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Customer(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        String.valueOf(rs.getInt(10)),
                        String.valueOf(rs.getBoolean(11)));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Customer getCustomerByEmail(String email) {
        String query = "select * from Customer where email = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Customer(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        String.valueOf(rs.getInt(10)),
                        String.valueOf(rs.getBoolean(11)));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Customer getCustomerByUsername(String username) {
        String query = "select * from Customer where user_name = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Customer(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        String.valueOf(rs.getInt(10)),
                        String.valueOf(rs.getBoolean(11)));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void registCustomer(String email, String username, String pass, String fullname, String phone, String address) {
        String query = "insert into Customer(email, user_name, password, fullName, phone, address, roleId, status) values (?, ?, ?, ?, ?, ?, 2, 1)";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, email);
            stm.setString(2, username);
            stm.setString(3, pass);
            stm.setString(4, fullname);
            stm.setString(5, phone);
            stm.setString(6, address);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public void addNewCustomerWithGoogleAccount(String email, String fullname, String avatar) {
        String query = "insert into Customer(email, fullName, avatar, roleId, status) values (?, ?, ?, 2, 1)";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, email);
            stm.setString(2, fullname);
            stm.setString(3, avatar);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public void changePassword(String userID, String newpass) {
        String query = "UPDATE Customer set password = ? where userId = ? ";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, newpass);
            stm.setString(2, userID);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }
}
