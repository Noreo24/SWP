/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Customer;
import Model.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LanChau
 */
public class RoleDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public ArrayList<Role> getAll() {
        ArrayList<Role> roles = new ArrayList<Role>();

        String query = "SELECT  [roleId]\n"
                + "      ,[role_name]\n"
                + "      ,[status]\n"
                + "  FROM [Role]";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Role role = new Role(rs.getString("roleId"),
                        rs.getString("role_name"),
                        rs.getString("status"));

                roles.add(role);
            }
        } catch (Exception e) {
        }
        return roles;
    }
}
