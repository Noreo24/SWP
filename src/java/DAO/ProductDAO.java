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

      public ArrayList<Product> getAllProductByBrandId(int brandId) {
        ArrayList<Product> list = new ArrayList<>();
        String query = "select * from product where brand_id = " + brandId;
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
    
    public static void main(String[] args) {
        ProductDAO pdao = new ProductDAO();
        String s = "6";
        String cate_id = "2";
        // Product name
//        Product p = pdao.getProductByID(s);
//        System.out.println(p.getProduct_name());
        // Product image(s)
//        List<String> img = pdao.getProductImageByProductID(s);
//        for (String o : img) {
//            System.out.println(o);
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
        System.out.println("_______________________");
        List<Product> sortProductBySalePrice = pdao.listProductByCate("0");
        for (Product o : sortProductBySalePrice) {
            System.out.println(o.getProduct_id());
        }
    }

}
