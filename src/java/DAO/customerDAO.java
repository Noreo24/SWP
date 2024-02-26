/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author LanChau
 */
public class customerDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public static void main(String[] args) {
        System.out.println(new customerDAO().getUserCustomerByUsername("tung123", "1").getAddress());
    }

    public Account getUserCustomerByUsername(String username, String pass) {
        String query = "select * from Customer where user_name = ? and password = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, pass);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(String.valueOf(rs.getInt(1)),
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
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Account getCustomerByEmail(String mail) {
        String query = "select * from Customer where email = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, mail);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(String.valueOf(rs.getInt(1)),
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

    public void updateCustomer(Account account) {
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

    public Account getCustomerById(String id) {
        String query = "select * from Customer where [userId] = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(String.valueOf(rs.getInt(1)),
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

    public int getCount(String name) {
        String query = "SELECT count(*)\n"
                + "FROM [Customer]\n"
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

    public ArrayList<Account> getAllCustomer(String name, int pageNumber, int pageSize) {
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
                Account account = new Account(String.valueOf(rs.getInt(1)),
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

                accounts.add(account);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return accounts;
    }

    public Account getCustomerByUsername(String username) {
        String query = "select * from Customer where user_name = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(String.valueOf(rs.getInt(1)),
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
    
    public void add(Account account) {
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
//    public static void main(String[] args) {
//        Customer customer = new CustomerDAO().getUserByEmail("tung050903@gmail.com");
//        System.out.println(new CustomerDAO().getCount(""));
//    }
//
//    public Customer getUserByUsername(String username, String pass) {
//        String query = "select * from Customer where user_name = ? and password = ?";
//        try {
//            cnn = new DBContext().getConnection();//mo ket noi voi sql
//            stm = cnn.prepareStatement(query);
//            stm.setString(1, username);
//            stm.setString(2, pass);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                return new Customer(String.valueOf(rs.getInt(1)),
//                        rs.getString(2),
//                        rs.getString(3),
//                        String.valueOf(rs.getBoolean(4)),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(9),
//                        String.valueOf(rs.getBoolean(10)),
//                        String.valueOf(rs.getBoolean(11))
//                );
//            }
//
//        } catch (Exception e) {
//        }
//        return null;
//    }
//
//    public Customer getUserByEmail(String mail) {
//        String query = "select * from Customer where email = ?";
//        try {
//            cnn = new DBContext().getConnection();//mo ket noi voi sql
//            stm = cnn.prepareStatement(query);
//            stm.setString(1, mail);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                return new Customer(String.valueOf(rs.getInt(1)),
//                        rs.getString(2),
//                        rs.getString(3),
//                        String.valueOf(rs.getBoolean(4)),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(9),
//                        String.valueOf(rs.getBoolean(10)),
//                        String.valueOf(rs.getBoolean(11))
//                );
//            }
//
//        } catch (Exception e) {
//        }
//        return null;
//    }
//    public Customer getUserById(String id) {
//        String query = "select * from Customer where [userId] = ?";
//        try {
//            cnn = new DBContext().getConnection();//mo ket noi voi sql
//            stm = cnn.prepareStatement(query);
//            stm.setString(1, id);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                return new Customer(String.valueOf(rs.getInt(1)),
//                        rs.getString(2),
//                        rs.getString(3),
//                        String.valueOf(rs.getBoolean(4)),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(9),
//                        String.valueOf(rs.getBoolean(10)),
//                        String.valueOf(rs.getBoolean(11))
//                );
//            }
//
//        } catch (Exception e) {
//        }
//        return null;
//    }
//
//    public void update(Customer customer) {
//        String query = "UPDATE [dbo].[Customer]\n"
//                + "   SET [fullName] = ? \n"
//                + "      ,[avatar] =?\n"
//                + "      ,[gender] = ?\n"
//                + "      ,[password] = ?\n"
//                + "      ,[user_name] = ?\n"
//                + "      ,[email] = ?\n"
//                + "      ,[phone] = ?\n"
//                + "      ,[address] = ?\n"
//                + "      ,[roleId] = ?\n"
//                + "      ,[status] = ?\n"
//                + " WHERE [userId] = ?";
//        try {
//            cnn = new DBContext().getConnection();//mo ket noi voi sql
//            stm = cnn.prepareStatement(query);
//            stm.setString(1, customer.getFullName());
//            stm.setString(2, customer.getAvatar());
//            stm.setString(3, customer.getGender());
//            stm.setString(4, customer.getPassword());
//            stm.setString(5, customer.getUser_name());
//            stm.setString(6, customer.getEmail());
//            stm.setString(7, customer.getPhone());
//            stm.setString(8, customer.getAddress());
//            stm.setString(9, customer.getRoleId());
//            stm.setString(10, customer.getStatus());
//            stm.setString(11, customer.getUserId());
//
//            stm.executeQuery();
//        } catch (Exception e) {
//            System.err.println(e.getMessage());
//        }
//    }
//
//    public Customer getUserByUsername(String username) {
//        String query = "select * from Customer where user_name = ?";
//        try {
//            cnn = new DBContext().getConnection();//mo ket noi voi sql
//            stm = cnn.prepareStatement(query);
//            stm.setString(1, username);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                return new Customer(String.valueOf(rs.getInt(1)),
//                        rs.getString(2),
//                        rs.getString(3),
//                        String.valueOf(rs.getBoolean(4)),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(9),
//                        String.valueOf(rs.getBoolean(10)),
//                        String.valueOf(rs.getBoolean(11))
//                );
//            }
//
//        } catch (Exception e) {
//        }
//        return null;
//    }
//
//    public ArrayList<Customer> getAll(String name, int pageNumber, int pageSize) {
//        ArrayList<Customer> customers = new ArrayList<>();
//
//        String query = "SELECT *\n"
//                + "FROM [Customer]\n"
//                + "WHERE fullName like ?\n"
//                + "ORDER BY userId\n"
//                + "OFFSET (? - 1) * ? ROWS FETCH NEXT ? ROWS ONLY;";
//        try {
//            cnn = new DBContext().getConnection();//mo ket noi voi sql
//            stm = cnn.prepareStatement(query);
//            stm.setString(1, "%" + name + "%");
//            stm.setInt(2, pageNumber);
//            stm.setInt(3, pageSize);
//            stm.setInt(4, pageSize);
//
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                Customer customer = new Customer(String.valueOf(rs.getInt(1)),
//                        rs.getString(2),
//                        rs.getString(3),
//                        String.valueOf(rs.getBoolean(4)),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(9),
//                        String.valueOf(rs.getBoolean(10)),
//                        String.valueOf(rs.getBoolean(11))
//                );
//
//                customers.add(customer);
//            }
//
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//        return customers;
//    }
//
//    public int getCount(String name) {
//        ArrayList<Customer> customers = new ArrayList<>();
//
//        String query = "SELECT count(*)\n"
//                + "FROM [Phone_Shop_Online].[dbo].[Customer]\n"
//                + "WHERE fullName like ? \n";
//        try {
//            cnn = new DBContext().getConnection();//mo ket noi voi sql
//            stm = cnn.prepareStatement(query);
//            stm.setString(1, "%" + name + "%");
//            rs = stm.executeQuery();
//            if (rs.next()) {
//                return rs.getInt(1);
//            }
//
//        } catch (Exception e) {
//        }
//        return 0;
//    }
//
//    public void addNewAccount(String email, String username, String pass, String fullname, String phone, String address) {
//        String query = "insert into Customer(email, user_name, password, fullName, phone, address, roleId, status) values (?, ?, ?, ?, ?, ?, 0, 1)";
//        try {
//            cnn = new DBContext().getConnection();//mo ket noi voi sql
//            stm = cnn.prepareStatement(query);
//            stm.setString(1, email);
//            stm.setString(2, username);
//            stm.setString(3, pass);
//            stm.setString(4, fullname);
//            stm.setString(5, phone);
//            stm.setString(6, address);
//            rs = stm.executeQuery();
//        } catch (Exception e) {
//        }
//    }
}
