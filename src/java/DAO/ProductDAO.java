/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Category;
import Model.Product;
import Model.ProductImage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO {

    private Connection cnn;
    private PreparedStatement stm;
    private ResultSet rs;

    // Constructor to initialize the database connection
    public ProductDAO() {
        try {
            this.cnn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Product> getSoleProducts() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product p JOIN Category c ON p.category_id = c.category_id order by sole desc";
        try {
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setOriginalPrices(rs.getInt("original_prices"));
                product.setSale(rs.getBoolean("sale"));
                product.setSalePrices(rs.getInt("sale_prices"));
                product.setProductHighlights(rs.getString("product_highlights"));
                product.setProductDescription(rs.getString("product_description"));

                product.setStatus(rs.getBoolean("status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGuarantee(rs.getInt("guarantee"));
                product.setUpdateDate(rs.getDate("update_date"));
                product.setSole(rs.getInt("sole"));
                product.setAvrRatedStar(rs.getInt("avr_rated_star"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));

                product.setCategory(category);

                // Get and set product images
                product.setProductImages(getProductImages(product.getProductId()));

                // Add the product to the list
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        } finally {
            closeResources();
        }

        return productList;
    }
    
    public List<Product> getSoleProducts(int cateId) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product p JOIN Category c ON p.category_id = c.category_id WHERE c.category_id = ? order by sole desc";
        try {
            stm = cnn.prepareStatement(query);
            stm.setInt(1, cateId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setOriginalPrices(rs.getInt("original_prices"));
                product.setSale(rs.getBoolean("sale"));
                product.setSalePrices(rs.getInt("sale_prices"));
                product.setProductHighlights(rs.getString("product_highlights"));
                product.setProductDescription(rs.getString("product_description"));

                product.setStatus(rs.getBoolean("status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGuarantee(rs.getInt("guarantee"));
                product.setUpdateDate(rs.getDate("update_date"));
                product.setSole(rs.getInt("sole"));
                product.setAvrRatedStar(rs.getInt("avr_rated_star"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));

                product.setCategory(category);

                // Get and set product images
                product.setProductImages(getProductImages(product.getProductId()));

                // Add the product to the list
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        } finally {
            closeResources();
        }

        return productList;
    }
      public List<Product> getNewProducts(int cateId) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product p JOIN Category c ON p.category_id = c.category_id WHERE c.category_id = ? order by product_id desc";
        try {
            stm = cnn.prepareStatement(query);
            stm.setInt(1, cateId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setOriginalPrices(rs.getInt("original_prices"));
                product.setSale(rs.getBoolean("sale"));
                product.setSalePrices(rs.getInt("sale_prices"));
                product.setProductHighlights(rs.getString("product_highlights"));
                product.setProductDescription(rs.getString("product_description"));

                product.setStatus(rs.getBoolean("status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGuarantee(rs.getInt("guarantee"));
                product.setUpdateDate(rs.getDate("update_date"));
                product.setSole(rs.getInt("sole"));
                product.setAvrRatedStar(rs.getInt("avr_rated_star"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));

                product.setCategory(category);

                // Get and set product images
                product.setProductImages(getProductImages(product.getProductId()));

                // Add the product to the list
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        } finally {
            closeResources();
        }

        return productList;
    }

    public List<Product> getNewProducts() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product p JOIN Category c ON p.category_id = c.category_id order by product_id desc";
        try {
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setOriginalPrices(rs.getInt("original_prices"));
                product.setSale(rs.getBoolean("sale"));
                product.setSalePrices(rs.getInt("sale_prices"));
                product.setProductHighlights(rs.getString("product_highlights"));
                product.setProductDescription(rs.getString("product_description"));

                product.setStatus(rs.getBoolean("status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGuarantee(rs.getInt("guarantee"));
                product.setUpdateDate(rs.getDate("update_date"));
                product.setSole(rs.getInt("sole"));
                product.setAvrRatedStar(rs.getInt("avr_rated_star"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));

                product.setCategory(category);

                // Get and set product images
                product.setProductImages(getProductImages(product.getProductId()));

                // Add the product to the list
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        } finally {
            closeResources();
        }

        return productList;
    }

    // Function to get all products with category details
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product p JOIN Category c ON p.category_id = c.category_id";
        try {
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setOriginalPrices(rs.getInt("original_prices"));
                product.setSale(rs.getBoolean("sale"));
                product.setSalePrices(rs.getInt("sale_prices"));
                product.setProductHighlights(rs.getString("product_highlights"));
                product.setProductDescription(rs.getString("product_description"));

                product.setStatus(rs.getBoolean("status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGuarantee(rs.getInt("guarantee"));
                product.setUpdateDate(rs.getDate("update_date"));
                product.setSole(rs.getInt("sole"));
                product.setAvrRatedStar(rs.getInt("avr_rated_star"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));

                product.setCategory(category);

                // Get and set product images
                product.setProductImages(getProductImages(product.getProductId()));

                // Add the product to the list
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        } finally {
            closeResources();
        }

        return productList;
    }
        public List<Product> getAllProductsTopDeal(int cateId) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product p JOIN Category c ON p.category_id = c.category_id WHERE sale_prices is not NULL ORDER BY 100 - (sale_prices * 100.0 / original_prices) desc and WHERE c.category_id = ?";
        try {
            stm = cnn.prepareStatement(query);
            stm.setInt(1, cateId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setOriginalPrices(rs.getInt("original_prices"));
                product.setSale(rs.getBoolean("sale"));
                product.setSalePrices(rs.getInt("sale_prices"));
                product.setProductHighlights(rs.getString("product_highlights"));
                product.setProductDescription(rs.getString("product_description"));

                product.setStatus(rs.getBoolean("status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGuarantee(rs.getInt("guarantee"));
                product.setUpdateDate(rs.getDate("update_date"));
                product.setSole(rs.getInt("sole"));
                product.setAvrRatedStar(rs.getInt("avr_rated_star"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));

                product.setCategory(category);

                // Get and set product images
                product.setProductImages(getProductImages(product.getProductId()));

                // Add the product to the list
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        } finally {
            closeResources();
        }

        return productList;
    }

    // Function to get all products with category details
    public List<Product> getAllProductsTopDeal() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product p JOIN Category c ON p.category_id = c.category_id WHERE sale_prices is not NULL ORDER BY 100 - (sale_prices * 100.0 / original_prices) desc";
        try {
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setOriginalPrices(rs.getInt("original_prices"));
                product.setSale(rs.getBoolean("sale"));
                product.setSalePrices(rs.getInt("sale_prices"));
                product.setProductHighlights(rs.getString("product_highlights"));
                product.setProductDescription(rs.getString("product_description"));

                product.setStatus(rs.getBoolean("status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGuarantee(rs.getInt("guarantee"));
                product.setUpdateDate(rs.getDate("update_date"));
                product.setSole(rs.getInt("sole"));
                product.setAvrRatedStar(rs.getInt("avr_rated_star"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));

                product.setCategory(category);

                // Get and set product images
                product.setProductImages(getProductImages(product.getProductId()));

                // Add the product to the list
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        } finally {
            closeResources();
        }

        return productList;
    }

    // Function to get products by category with category details
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product p JOIN Category c ON p.category_id = c.category_id WHERE c.category_id = ?";
        try {
            stm = cnn.prepareStatement(query);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setOriginalPrices(rs.getInt("original_prices"));
                product.setSale(rs.getBoolean("sale"));
                product.setSalePrices(rs.getInt("sale_prices"));
                product.setProductHighlights(rs.getString("product_highlights"));
                product.setProductDescription(rs.getString("product_description"));

                product.setStatus(rs.getBoolean("status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGuarantee(rs.getInt("guarantee"));
                product.setUpdateDate(rs.getDate("update_date"));
                product.setSole(rs.getInt("sole"));
                product.setAvrRatedStar(rs.getInt("avr_rated_star"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));

                product.setCategory(category);

                // Get and set product images
                product.setProductImages(getProductImages(product.getProductId()));

                // Add the product to the list
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        } finally {
            closeResources();
        }

        return productList;
    }

    // Function to get product images by product ID
    private List<ProductImage> getProductImages(int productId) {
        List<ProductImage> productImages = new ArrayList<>();
        String query = "SELECT * FROM Products_Images WHERE product_id = ?";
        try {
            PreparedStatement imageStm = cnn.prepareStatement(query);
            imageStm.setInt(1, productId);
            ResultSet imageRs = imageStm.executeQuery();
            while (imageRs.next()) {
                ProductImage productImage = new ProductImage();
                productImage.setProductId(imageRs.getInt("products_images_id"));
                productImage.setProductId(imageRs.getInt("product_id"));
                productImage.setStatus(imageRs.getBoolean("status"));
                productImage.setImages(imageRs.getString("images"));
                productImages.add(productImage);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        }
        return productImages;
    }

    // Close resources in a production environment
    public void closeResources() {
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
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }
}
