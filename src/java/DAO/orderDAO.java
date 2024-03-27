/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Category;
import Model.Chart;
import Model.Trademark;
import Model.order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class orderDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public List<Chart> getChartRevenueBar(String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String query = "select sum(total_cost) from [Order] where orderDate = DATEADD(DAY, ?, ?)";
            try {
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                rs = stm.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                query = "select  DATEADD(DAY, ?, ?)";
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (Exception e) {
                System.out.println(e);
            }
        }

        return list;
    }

    public List<Trademark> getProTradeMarkSold(String start, String end) {
        List<Trademark> list = new ArrayList<>();
        String query = "Select COUNT(*), t.trademark_name from [Order_Detail] d join [Order] o on o.order_id = d.order_id join Product p on p.product_id = d.product_id join Trademark t on t.trademark_id = p.trademark_id where o.orderDate >= ? And o.orderDate <= ?  and o.status_order = 1\n"
                + "group by t.trademark_name";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, start);
            stm.setString(2, end);
            rs = stm.executeQuery();
            while (rs.next()) {
                Trademark t = new Trademark(String.valueOf(rs.getInt(1)), rs.getString(2), null);
                System.out.println(t.getTrademark_id());
                System.out.println(t.getTrademark_name());

                list.add(t);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getProCategorySold(String start, String end) {
        List<Category> list = new ArrayList<>();
        String query = "Select COUNT(*), c.category_name from [Order_Detail] d join [Order] o on o.order_id = d.order_id join Product p on p.product_id = d.product_id join Category c on c.category_id = p.category_id where o.orderDate >= ? And o.orderDate <= ? and o.status_order = 1\n"
                + "group by c.category_name";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, start);
            stm.setString(2, end);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category(String.valueOf(rs.getInt(1)), rs.getString(2));
                System.out.println(c.getCategory_id());
                System.out.println(c.getCategory_name());
                list.add(c);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<order> getOrderDashboard(String start, String end) {
        List<order> list = new ArrayList<>();
        String query = "SELECT o.[order_id]\n"
                + "      ,[orderDate]\n"
                + "      ,[total_cost]\n"
                + "      ,[fullName]\n"
                + "      ,[phone]\n"
                + "      ,[address]\n"
                + "      ,[status_order]\n"
                + "      ,[userId]\n"
                + "      ,[saler_id]\n"
                + "      ,[note]\n"
                + "      ,[order_code],\n"
                + "	  od.product_id,\n"
                + "	  od.product_price,\n"
                + "	  od.service_tag_id\n"
                + "  FROM [Phone_Shop_Online_2].[dbo].[Order] o join Order_Detail od on o.order_id = od.order_id\n"
                + "  where o.orderDate >= ? and o.orderDate <= ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, start);
            stm.setString(2, end);
            rs = stm.executeQuery();
            while (rs.next()) {
                order o = new order(String.valueOf(rs.getInt(1)), String.valueOf(rs.getDate(2)), String.valueOf(rs.getInt(3)), rs.getString(4), rs.getString(5), rs.getString(6), String.valueOf(rs.getBoolean(7)), rs.getString(12), String.valueOf(rs.getInt(13)), rs.getString(10), rs.getString(11));

                list.add(o);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Chart> getChartRevenueBarForManagement(String start, int day, String managementId) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String query = "select sum(total_cost) from [Order] where orderDate = DATEADD(DAY, ?, ?) and saler_id = ? ";
            try {
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                stm.setString(3, managementId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                query = "select  DATEADD(DAY, ?, ?)";
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (Exception e) {
                System.out.println(e);
            }
        }

        return list;
    }

    public List<Chart> getProductSold(String start, int day, String managementId) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String query = "select count(*) from [Order_Detail] od join [Order] o on o.order_id = od.order_id where orderDate = DATEADD(DAY, ?, ?) and saler_id = ?";
            try {
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                stm.setString(3, managementId);

                rs = stm.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                query = "select  DATEADD(DAY, ?, ?)";
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (Exception e) {
                System.out.println(e);
            }
        }

        return list;
    }
}
