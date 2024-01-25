package DAO;

import DBContext.DBContext;
import Model.ProductImage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class productImageDAO {

    Connection cnn;
    PreparedStatement stm;
    ResultSet rs;

    public static void main(String[] args) {
        productImageDAO productImageDAO = new productImageDAO();

        // Retrieve all product images
        List<ProductImage> productImageList = productImageDAO.getAllProductImages();

        // Display product image information
        System.out.println("List of Product Images:");
        for (ProductImage productImage : productImageList) {
            System.out.println(productImage.toString());
        }
    }

    public List<ProductImage> getAllProductImages() {
        List<ProductImage> productImageList = new ArrayList<>();
        String query = "SELECT * FROM Products_Images";

        try {
            cnn = new DBContext().getConnection();
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();

            while (rs.next()) {
                ProductImage productImage = new ProductImage(
                        rs.getString("products_images_id"),
                        rs.getString("product_id"),
                        rs.getString("status"),
                        rs.getString("images")
                );
                productImageList.add(productImage);
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

        return productImageList;
    }
}
