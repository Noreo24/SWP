/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class productDAO {
    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu
    
    public static void main(String[] args) {
    productDAO productDAO = new productDAO();

    // Retrieve all products
    List<Product> productList = productDAO.getAllProducts();

    // Display product information
    System.out.println("List of Products:");
    for (Product product : productList) {
        System.out.println(product.toString());
    }
}
    
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product";

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
                if (rs != null) rs.close();
                if (stm != null) stm.close();
                if (cnn != null) cnn.close();
            } catch (Exception ex) {
                ex.printStackTrace(); // Handle the exception properly in a production environment
            }
        }

        return productList;
    }
    
    
}
