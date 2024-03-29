/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Account;
import Model.Management;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ManagementDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public Management getManagementByUsername(String username, String pass) {
        String query = "select * from Management where user_name = ? and password = ? and isDelete = 0";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, pass);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Management(String.valueOf(rs.getInt(1)),
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

    public Management getManagementByEmail(String email) {
        String query = "select * from Management where email = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Management(String.valueOf(rs.getInt(1)),
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

    public Account getManagementACByEmail(String mail) {
        String query = "select * from Management where email = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, mail);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account(String.valueOf(rs.getInt("userId")),
                        rs.getString("fullName"),
                        rs.getString("avatar"),
                        String.valueOf(rs.getBoolean("gender")),
                        rs.getString("email"),
                        rs.getString("user_name"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        "Management",
                        String.valueOf(rs.getBoolean("status"))
                );
                account.setAdminCreateId(rs.getInt(10));

                return account;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Account getManagementACByUsername(String username) {
        String query = "select * from Management where user_name = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account(String.valueOf(rs.getInt("userId")),
                        rs.getString("fullName"),
                        rs.getString("avatar"),
                        String.valueOf(rs.getBoolean("gender")),
                        rs.getString("email"),
                        rs.getString("user_name"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        "Management",
                        String.valueOf(rs.getBoolean("status"))
                );
                account.setAdminCreateId(rs.getInt(10));

                return account;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateACManagement(Account account) {
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
                + " WHERE [userId] = ?";
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

    public Account getManagementACById(String userID) {
        String query = "select * from Management where [userId] = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, userID);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account(String.valueOf(rs.getInt("userId")),
                        rs.getString("fullName"),
                        rs.getString("avatar"),
                        String.valueOf(rs.getBoolean("gender")),
                        rs.getString("email"),
                        rs.getString("user_name"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        "Management",
                        String.valueOf(rs.getBoolean("status"))
                );
                account.setAdminCreateId(rs.getInt(10));

                return account;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public int getCountAC(String nameSearch) {
        String query = "SELECT count(*)\n"
                + "FROM [Management] and isDelete = 0\n"
                + "WHERE fullName like ? \n";

        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + nameSearch + "%");
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<Account> getAllACManagement(String name, int pageNumber, int pageSize) {
        ArrayList<Account> accounts = new ArrayList<>();

        String query = ""
                + "SELECT * "
                + "  FROM [Management] a \n"
                + "WHERE a.[fullName] like ?  and a.isDelete = 0\n";

        query += "  ORDER BY userId\n"
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
                Account account = new Account(String.valueOf(rs.getInt("userId")),
                        rs.getString("fullName"),
                        rs.getString("avatar"),
                        String.valueOf(rs.getBoolean("gender")),
                        rs.getString("email"),
                        rs.getString("user_name"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        "Management",
                        String.valueOf(rs.getBoolean("status"))
                );
                account.setAdminCreateId(rs.getInt(10));

                accounts.add(account);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return accounts;
    }

    public void addAC(Account account) {
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

    public void updateDelete(String id, boolean st) {
        String query = "UPDATE [dbo].[Management]\n"
                + "   SET [isDelete] = ? \n"
                + " WHERE [userId] = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setBoolean(1, st);
            stm.setString(2, id);
            stm.executeQuery();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public int checkACDelete(String username, String gmString) {
        String query = "select * from Management where user_name = ? and email = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, gmString);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("userId");
            }

        } catch (Exception e) {
        }
        return 0;
    }

}
