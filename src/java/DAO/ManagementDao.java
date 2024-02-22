/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author LanChau
 */
public class ManagementDao {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public Account getUserManagementByUsername(String username, String pass) {
        String query = "select * from Management where user_name = ? and password = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, pass);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        "Management",
                        String.valueOf(rs.getBoolean(11))
                );
                account.setAdminCreateId(rs.getInt(10));

                return account;
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Account getManagementByEmail(String mail) {
        String query = "select * from Management where email = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, mail);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        "Management",
                        String.valueOf(rs.getBoolean(11))
                );
                account.setAdminCreateId(rs.getInt(10));

                return account;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void updateManagement(Account account) {
        String query = "UPDATE [dbo].[Management]\n"
                + "   SET [fullName] = ? \n"
                + "      ,[avatar] =?\n"
                + "      ,[gender] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[user_name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE [id] = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, account.getFullName());
            stm.setString(2, account.getAvatar());
            stm.setString(3, account.getGender());
            stm.setString(4, account.getPassword());
            stm.setString(5, account.getUser_name());
            stm.setString(6, account.getEmail());
            stm.setString(7, account.getPhone());
            stm.setString(8, account.getAddress());
            stm.setString(9, account.getStatus());
            stm.setString(10, account.getUserID());

            stm.executeQuery();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public Account getManagementById(String id) {
        String query = "select * from Management where [id] = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        "Management",
                        String.valueOf(rs.getBoolean(11))
                );
                account.setAdminCreateId(rs.getInt(10));

                return account;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public int getCount(String name) {
        String query = "SELECT count(*)\n"
                + "FROM [Management]\n"
                + "WHERE fullName like ? \n";

        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + name + "%");
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<Account> getAllManagement(String name, int pageNumber, int pageSize) {
        ArrayList<Account> accounts = new ArrayList<>();

        String query = ""
                + "SELECT * "
                + "  FROM [Management] a \n"
                + "WHERE a.[fullName] like ?\n";

        query += "  ORDER BY id\n"
                + "OFFSET (? - 1) * ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + name + "%");
            stm.setInt(2, pageNumber);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageSize);

            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        "Management",
                        String.valueOf(rs.getBoolean(11))
                );
                account.setAdminCreateId(rs.getInt(10));

                accounts.add(account);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return accounts;
    }

    public Account getManagementByUsername(String username) {
        String query = "select * from Management where user_name = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        "Management",
                        String.valueOf(rs.getBoolean(11))
                );
                account.setAdminCreateId(rs.getInt(10));

                return account;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void add(Account account) {
        String query = ""
                + " INSERT INTO [Management]\n"
                + "           ([fullName]\n"
                + "           ,[avatar]\n"
                + "           ,[gender]\n"
                + "           ,[password]\n"
                + "           ,[user_name]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[admin_create_id]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "( ? ,? ,? ,? ,? ,? ,? ,? ,?,?)";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, account.getFullName());
            stm.setString(2, account.getAvatar());
            stm.setString(3, account.getGender());
            stm.setString(4, account.getPassword());
            stm.setString(5, account.getUser_name());
            stm.setString(6, account.getEmail());
            stm.setString(7, account.getPhone());
            stm.setString(8, account.getAddress());
            stm.setInt(9, account.getAdminCreateId());
            stm.setBoolean(10, account.getStatus().equals("true"));
            rs = stm.executeQuery();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}