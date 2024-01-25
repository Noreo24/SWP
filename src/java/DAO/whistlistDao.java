/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Customer;
import Model.Product;
import Model.Whistlist;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class whistlistDao {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public static void main(String[] args) {
        whistlistDao wishlistDao = new whistlistDao();

        // Retrieve all products
        List<Product> productList = wishlistDao.getAllProducts();

        // Display product information
        System.out.println("List of Products:");
        for (Product product : productList) {
            System.out.println(product.toString());
        }
    }

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT product_id FROM Product";

        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();

            while (rs.next()) {
                Product product = new Product(
                        String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getBoolean(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                );
                productList.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception properly in a production environment
        } finally {
            // Close resources (ResultSet, PreparedStatement, and Connection) in a finally block
            // This ensures that the resources are closed even if an exception occurs
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (cnn != null) {
                    cnn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace(); // Handle the exception properly in a production environment
            }
        }

        return productList;
    }

    public void addToWhistlist(String userId, String productId) {
        String query = "INSERT INTO Whistlist (userId, productId) VALUES (?, ?)";

        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            stm.setString(1, userId);
            stm.setString(2, productId);
            stm.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception properly in a production environment
        } finally {
            // Close resources in a finally block
            try {
                if (stm != null) {
                    stm.close();
                }
                if (cnn != null) {
                    cnn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace(); // Handle the exception properly in a production environment
            }
        }
    }

    public List<Whistlist> getWhistlistByUserId(String userId) {
        List<Whistlist> whistlistEntries = new ArrayList<>();
        String query = "SELECT whistlist_id, userId, productId FROM Whistlist WHERE userId = ?";

        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            stm.setString(1, userId);
            rs = stm.executeQuery();

            while (rs.next()) {
                Whistlist whistlistEntry = new Whistlist(
                        rs.getString("whistlist_id"),
                        rs.getString("userId"),
                        rs.getString("productId")
                // Add other properties as needed
                );
                whistlistEntries.add(whistlistEntry);
            }

        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception properly in a production environment
        } finally {
            // Close resources in a finally block
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (cnn != null) {
                    cnn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace(); // Handle the exception properly in a production environment
            }
        }

        return whistlistEntries;
    }

    public void deleteWhistlistById(String whistlistId) {
        String query = "DELETE FROM Whistlist WHERE whistlist_id = ?";

        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            stm.setString(1, whistlistId);
            stm.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception properly in a production environment
        } finally {
            // Close resources in a finally block
            try {
                if (stm != null) {
                    stm.close();
                }
                if (cnn != null) {
                    cnn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace(); // Handle the exception properly in a production environment
            }
        }
    }

    // ... existing code ...
}
