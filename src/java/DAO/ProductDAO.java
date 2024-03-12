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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> get4RelatedProduct(int cate_id, String product_id) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT top(4) WITH TIES *  FROM Product "
                + "where category_id = ?  and product_id != ? "
                + "order by product_id desc";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setInt(1, cate_id);
            stm.setString(2, product_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String product_id) {
        String query = "select * from Product\n"
                + "where product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, product_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<String> getProductImageByProductID(String product_id) {
        List<String> list = new ArrayList<>();
        String query = "select images from Product p join Products_Images [pi] "
                + "on p.product_id = [pi].product_id "
                + "where p.product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, product_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> get4NewProductByCateId(String category_id) {
        List<Product> list = new ArrayList<>();
        String query = "select top 6 * from Product "
                + "where category_id = ? "
                + "order by product_id desc";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, category_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop3SoleProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select top 3 * from Product order by sole desc";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> productPaging(int pageNumber) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product "
                + "order by product_id asc "
                + "offset ? rows fetch next 6 rows only ";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setInt(1, (pageNumber - 1) * 6);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16))); // date
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> sortProductBySalePrice(int status) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product order by sale_prices ";

        // Chuỗi cần gắn vào query
        String desc = " desc";
        // Mac dinh la asc

        // Tạo một đối tượng StringBuilder để nối chuỗi
        StringBuilder queryBuilder = new StringBuilder(query);

        // Gắn chuỗi vào query bằng cách sử dụng append
        if (status == 0) {
            queryBuilder.append(desc);
        }

        // Lấy ra chuỗi kết quả
        String finalQuery = queryBuilder.toString();
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(finalQuery);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16))); // date
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> sortProductByRateStar(int status) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product order by avr_rated_star";

        // Chuỗi cần gắn vào query
        String desc = " desc";
        // Mac dinh la asc

        // Tạo một đối tượng StringBuilder để nối chuỗi
        StringBuilder queryBuilder = new StringBuilder(query);

        // Gắn chuỗi vào query bằng cách sử dụng append
        if (status == 0) {
            queryBuilder.append(desc);
        }

        // Lấy ra chuỗi kết quả
        String finalQuery = queryBuilder.toString();
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(finalQuery);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16))); // date
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchByPriceMinToMax(String priceMin, String priceMax) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
                + "where [sale_prices] >= ? and [sale_prices]<=?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, priceMin);
            stm.setString(2, priceMax);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where [product_name] like ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> listProductByCate(String cate_id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where category_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, cate_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> listProductByBrand(String trademark_id) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product where trademark_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, trademark_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void editProduct(String pId, String productName, String highlight, String description,
            String categoryId, String trademarkId, String status, String sold, String quantity,
            String sale, String originalPrice, String salePrice, String updateDate) {
        String query = "UPDATE Product\n"
                + "SET product_name = ?, product_highlights = ?, product_description = ?, "
                + "category_id = ?, trademark_id = ?, status= ?, sole = ?, quantity = ?, "
                + "sale = ?, original_prices = ?, sale_prices = ?, update_date = ? \n"
                + "WHERE product_id = ?;";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, productName);
            stm.setString(2, highlight);
            stm.setString(3, description);
            stm.setString(4, categoryId);
            stm.setString(5, trademarkId);
            stm.setString(6, status);
            stm.setString(7, sold);
            stm.setString(8, quantity);
            stm.setString(9, sale);
            stm.setString(10, originalPrice);
            stm.setString(11, salePrice);
            stm.setString(12, updateDate);
            stm.setString(13, pId);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

//    public void deleteProduct(String pid, String cateId) {
//        String query = "";
//        if ("1".equals(cateId)) {
//            query = "delete from Phone_detail where product_id = ? \n"
//                    + "delete from Products_Images where product_id = ? \n"
//                    + "delete from Product where product_id = ? ";
//        } else if ("2".equals(cateId)) {
//            query = "delete from Laptop_detail where product_id = ? \n"
//                    + "delete from Products_Images where product_id = ? \n"
//                    + "delete from Product where product_id = ? ";
//        } else if ("3".equals(cateId)) {
//            query = "delete from Tablet_detail where product_id = ? \n"
//                    + "delete from Products_Images where product_id = ? \n"
//                    + "delete from Product where product_id = ? ";
//        } else {
//            query = "delete from Headphone_detail where product_id = ? \n"
//                    + "delete from Products_Images where product_id = ? \n"
//                    + "delete from Product where product_id = ? ";
//        }
//        try {
//            cnn = new DBContext().getConnection();//mo ket noi voi sql
//            stm = cnn.prepareStatement(query);
//            stm.setString(1, pid);
//            stm.setString(2, pid);
//            stm.setString(3, pid);
//            stm.executeUpdate();
//        } catch (Exception e) {
//        }
//    }
    public List<Product> getAllProductAdmin2(String name, int pageNumber, int pageSize) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product p "
                + "where p.product_name like ? "
                + "ORDER BY p.product_id OFFSET (? - 1) * ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + name + "%");
            stm.setInt(2, pageNumber);
            stm.setInt(3, pageSize);
            stm.setInt(4, pageSize);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)
                ));
            }
        } catch (Exception e) {
            System.out.println("None");
        }
        return list;
    }

    public List<Product> getAllProductAdmin(String name, String cateName, String trademarkName, int pageNumber, int pageSize) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product p join Category c on p.category_id = c.category_id \n"
                + "join Trademark tm on p.trademark_id = tm.trademark_id "
                + "where p.product_name like ? "
                + "and c.category_name = ? "
                + "and tm.trademark_name = ? "
                + "ORDER BY p.product_id OFFSET (? - 1) * ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + name + "%");
            stm.setString(2, cateName);
            stm.setString(3, trademarkName);
            stm.setInt(4, pageNumber);
            stm.setInt(5, pageSize);
            stm.setInt(6, pageSize);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)));
            }
        } catch (Exception e) {
            System.out.println("None");
        }
        return list;
    }

    public List<Product> getAllProductAdminByCate(String name, String cateName, int pageNumber, int pageSize) {
        List<Product> list = new ArrayList<>();
        String query = "select distinct p.*, c.category_name, tm.trademark_name "
                + "from Product p join Category c on p.category_id = c.category_id \n"
                + "join Trademark tm on p.trademark_id = tm.trademark_id \n"
                + "where p.product_name like ? "
                + "and c.category_name = ? "
                + "ORDER BY p.product_id OFFSET (? - 1) * ? "
                + "ROWS FETCH NEXT ? "
                + "ROWS ONLY";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + name + "%");
            stm.setString(2, cateName);
            stm.setInt(3, pageNumber);
            stm.setInt(4, pageSize);
            stm.setInt(5, pageSize);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)));
            }
        } catch (Exception e) {
            System.out.println("None");
        }
        return list;
    }

    public List<Product> getAllProductAdminByTrademark(String name, String trademarkName, int pageNumber, int pageSize) {
        List<Product> list = new ArrayList<>();
        String query = "select distinct p.*, c.category_name, tm.trademark_name \n"
                + "from Product p join Category c on p.category_id = c.category_id \n"
                + "join Trademark tm on p.trademark_id = tm.trademark_id \n"
                + "where p.product_name like ? and \n"
                + "tm.trademark_name = ? \n"
                + "ORDER BY p.product_id OFFSET (? - 1) * ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + name + "%");
            stm.setString(2, trademarkName);
            stm.setInt(3, pageNumber);
            stm.setInt(4, pageSize);
            stm.setInt(5, pageSize);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
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
                        rs.getString(15),
                        rs.getString(16)));
            }
        } catch (Exception e) {
            System.out.println("None");
        }
        return list;
    }

    public int totalNumberOfProduct() {
        String query = "select count(*) from Product";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int countProduct(String name, String cateName, String trademarkName) {
        String query = "SELECT count(*) FROM "
                + "Product p join category c on p.category_id = c.category_id "
                + "join Trademark tm on p.trademark_id = tm.trademark_id "
                + "WHERE p.product_name like ? "
                + "and c.category_name like ? "
                + "and tm.trademark_name like ?";

        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + name + "%");
            stm.setString(2, cateName);
            stm.setString(3, trademarkName);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int countProductByCate(String name, String cateName) {
        String query = "SELECT count(*) FROM Product p join category c on p.category_id = c.category_id "
                + "WHERE p.product_name like ? "
                + "and c.category_name like ?";

        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + name + "%");
            stm.setString(2, cateName);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int countProductByTrademark(String name, String trademarkName) {
        String query = "SELECT count(*) FROM "
                + "Product p join Trademark tm on p.trademark_id = tm.trademark_id "
                + "WHERE p.product_name like ? and tm.trademark_name like ?";

        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, "%" + name + "%");
            stm.setString(2, trademarkName);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int countProductNoCateAndTrade(String name) {
        String query = "SELECT count(*) FROM "
                + "Product p join Trademark tm on p.trademark_id = tm.trademark_id "
                + "WHERE p.product_name like ?";

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

    public void changeProductStatus(String pId, String newStatus) {
        String query = "UPDATE Product \n"
                + "SET status = ? \n"
                + "WHERE product_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, newStatus);
            stm.setString(2, pId);
            rs = stm.executeQuery();

        } catch (Exception e) {
        }
    }

    public void addNewProduct(String productName, String originalPrice, String sale, String salePrice, String highlight, String description, String trademarkID, String status, String quantity, String guarantee, String cateID, String updateDate, String sole, String managerID, String rated_star) {
        String query = "insert into Product (product_name, original_prices, sale, sale_prices, product_highlights, product_description, trademark_id, \n"
                + "status, quantity, guarantee, category_id, update_date, sole, management_id, avr_rated_star) \n"
                + "	values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, productName);
            stm.setString(2, originalPrice);
            stm.setString(3, sale);
            stm.setString(4, salePrice);
            stm.setString(5, highlight);
            stm.setString(6, description);
            stm.setString(7, trademarkID);
            stm.setString(8, status);
            stm.setString(9, quantity);
            stm.setString(10, guarantee);
            stm.setString(11, cateID);
            stm.setString(12, updateDate);
            stm.setString(13, sole);
            stm.setString(14, managerID);
            stm.setString(15, rated_star);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String updateDate = dateFormat.format(currentDate);
        ProductDAO pdao = new ProductDAO();
        String s = "1";
        pdao.addNewProduct("New product 2222", "10000", "1", "5000", "Highlight", "description", "1", "1", "200", "1", "1", updateDate, "0", "1", "3");

//        pdao.changeProductStatus(s, "1");
//        System.out.println(pdao.getProductByID(s).getStatus());
//        pdao.deleteProduct("18", "3");
//        String cate_id = "2";
        // Product name
//        Product p = pdao.getProductByID(s);
//        System.out.println(p.getProduct_highlights());
//        System.out.println(p.getProduct_description());
//        pdao.editProduct(s, "Product 1", "Highlight after edit", "Description after edit",
//                "4", "4", "1", "1000", "1000",
//                "1", "10000000", "5000000", updateDate);
//        System.out.println(pdao.getProductByID(s).getProduct_name());
//        Product p = pdao.getProductByID(s);
//        System.out.println(p.getProduct_name());
//        System.out.println(p.getProduct_highlights());
//        System.out.println(p.getProduct_description());
//        System.out.println(p.getUpdate_date());
        // Product image(s)
//        List<Product> p = new ArrayList<>();
//        p = new ProductDAO().getAllProductAdmin2("", 1, 5);
//        for (Product o : p) {
//            System.out.println(o.getProduct_id());
//            System.out.println(o.getCategory_id());
//            System.out.println("");
//            System.out.println(o.getTrademark_id());
//        }

//        List<Product> relatedProduct = pdao.get4RelatedProduct(cate_id, s);
//        for (Product o : relatedProduct) {
//            System.out.println(o.getProduct_name());
//        }
//        List<Product> NewProductByCateId = pdao.searchByPriceMinToMax("12", "20000000");
//        for (Product o : NewProductByCateId) {
//            System.out.println(o.getProduct_id());
//        }
//        List<Product> sortProductByRateStar = pdao.sortProductByRateStar(0);
//        for (Product o : sortProductByRateStar) {
//            System.out.println(o.getProduct_id());
//        }
//        System.out.println("_______________________");
//        List<Product> sortProductBySalePrice = pdao.sortProductBySalePrice(0);
//        for (Product o : sortProductBySalePrice) {
//            System.out.println(o.getProduct_id());
//        }
//        System.out.println("_______________________");
//        List<Product> sortProductBySalePrice = pdao.listProductByCate("1");
//        for (Product o : sortProductBySalePrice) {
//            System.out.println(o.getProduct_id());
//        }
//        System.out.println("_______________________");
//        List<Product> getAllProduct = pdao.getAllProductAdmin("", "tablet", "apple", 1, 5);
//        for (Product o : getAllProduct) {
//            System.out.println(o.getProduct_id());
//        }
    }

}
