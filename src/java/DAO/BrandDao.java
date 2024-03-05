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
import java.util.List;

/**
 *
 * @author buiph
 */
public class BrandDao {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public BrandDao() {
        try {
            cnn = new DBContext().getConnection();
        } catch (Exception e) {
        }
    }

    
    public static void main(String[] args) {
        for (Brand brand : new BrandDao().getListBrand()) {
                    System.out.println(brand.getId());
        }
    }
    public ArrayList<Brand> getListBrand() {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            String query = "SELECT * \n"
                      + "  from [brand]";
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(
                          rs.getInt(1),
                          rs.getNString(2),
                          rs.getNString(3),
                          rs.getNString(4)
                );
                brands.add(brand);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return brands;
    }

    public Brand getBrand(int id) {
        try {
            String query = "SELECT * \n"
                      + "  FROM [Brand] where id = ?";
            stm = cnn.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Brand(
                          rs.getInt(1),
                          rs.getNString(2),
                          rs.getNString(3),
                          rs.getNString(4), new ProductDAO().getAllProductByBrandId(id)
                );
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void update(Brand brand) {
        try {
            String query = ""
                      + "UPDATE [dbo].[Brand]\n"
                      + "   SET [name] = ?\n"
                      + "      ,[img] = ?\n"
                      + "      ,[description] = ?\n"
                      + " WHERE id = ?";
            stm = cnn.prepareStatement(query);
            stm.setString(1, brand.getName());
            stm.setString(2, brand.getImg());
            stm.setString(3, brand.getDes());
            stm.setInt(4, brand.getId());
            stm.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void add(Brand brand) {
        try {
            String query = ""
                      + "INSERT INTO [dbo].[Brand]\n"
                      + "           ([name]\n"
                      + "           ,[img]\n"
                      + "           ,[description])\n"
                      + "     VALUES\n"
                      + "           (?,?,?)";
            stm = cnn.prepareStatement(query);
            stm.setString(1, brand.getName());
            stm.setString(2, brand.getImg());
            stm.setString(3, brand.getDes());
            stm.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
