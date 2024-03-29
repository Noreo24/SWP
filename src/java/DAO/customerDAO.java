/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Account;
import Model.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.Encode;

/**
 *
 * @author Admin
 */
public class customerDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public static void main(String[] args) {
        System.out.println(Encode.toSHA1("123456"));
    }

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

    public Account getCustomerACByEmail(String mail) {
        String query = "select * from Customer where email = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, mail);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(String.valueOf(rs.getInt("userId")),
                        rs.getString("fullName"),
                        rs.getString("avatar"),
                        String.valueOf(rs.getBoolean("gender")),
                        rs.getString("email"),
                        rs.getString("user_name"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        "Customer",
                        String.valueOf(rs.getBoolean("status"))
                );
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Account getCustomerACByUsername(String username) {
        String query = "select * from Customer where user_name = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(String.valueOf(rs.getInt("userId")),
                        rs.getString("fullName"),
                        rs.getString("avatar"),
                        String.valueOf(rs.getBoolean("gender")),
                        rs.getString("email"),
                        rs.getString("user_name"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        "Customer",
                        String.valueOf(rs.getBoolean("status"))
                );
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

    public Customer getCustomerById(String id) {
        String query = "select * from Customer where [userId] = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, id);
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
                        "Customer",
                        String.valueOf(rs.getBoolean(10))
                );
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void updateACCustomer(Account account) {
        String query = "UPDATE [dbo].[Customer]\n"
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

    public Account getCustomerACById(String id) {
        String query = "select * from Customer where [userId] = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(String.valueOf(rs.getInt("userId")),
                        rs.getString("fullName"),
                        rs.getString("avatar"),
                        String.valueOf(rs.getBoolean("gender")),
                        rs.getString("email"),
                        rs.getString("user_name"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        "Customer",
                        String.valueOf(rs.getBoolean("status"))
                );
            }

        } catch (Exception e) {
        }
        return null;
    }

    public int getCountAC(String nameSearch) {
        String query = "SELECT count(*)\n"
                + "FROM [Customer]\n"
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

    public ArrayList<Account> getAllACCustomer(String name, int pageNumber, int pageSize) {
        ArrayList<Account> accounts = new ArrayList<>();

        String query = ""
                + "SELECT * "
                + "  FROM [Customer] a \n"
                + "WHERE a.[fullName] like ?\n";

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
                        "Customer",
                        String.valueOf(rs.getBoolean("status"))
                );

                accounts.add(account);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return accounts;
    }

    public void addAC(Account account) {
        String query = ""
                + " INSERT INTO [Customer]\n"
                + "           ([fullName]\n"
                + "           ,[avatar]\n"
                + "           ,[gender]\n"
                + "           ,[password]\n"
                + "           ,[user_name]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "( ? ,? ,? ,? ,? ,? ,? ,? ,?)";
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
            stm.setBoolean(9, account.getStatus().equals("true"));
            rs = stm.executeQuery();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

}
