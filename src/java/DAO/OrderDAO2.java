/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.order;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class OrderDAO2 {

    Connection connection;

    public OrderDAO2() throws Exception {
        connection = new DBContext().getConnection();
    }

    public order createOrder(order order) {
        String query = "INSERT INTO [Order] (orderDate, total_cost, fullName, phone, address, status_order, userId, saler_id, note, order_code) "
                + "VALUES (GETDATE(), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, Integer.parseInt(order.getTotal_cost()));
            preparedStatement.setString(2, order.getFullName());
            preparedStatement.setString(3, order.getPhone());
            preparedStatement.setString(4, order.getAddress());
            preparedStatement.setInt(5, Integer.parseInt(order.getStatus_order()));
            preparedStatement.setInt(6, Integer.parseInt(order.getUserId()));
            preparedStatement.setInt(7, Integer.parseInt(order.getSaler_id()));
            preparedStatement.setString(8, order.getNote());
            preparedStatement.setString(9, order.getOrder_code());
            preparedStatement.executeUpdate();

            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                String orderId = generatedKeys.getString(1);
                // Fetch the newly created order from the database using its order_id
                order.setOrder_id(orderId);
                return order;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null; // Return null if insertion fails or if there is an exception
    }

    public void editOrder(order order) {
        String query = "UPDATE [Order] SET total_cost = ?, fullName = ?, phone = ?, address = ?, status_order = ?, userId = ?, saler_id = ?, note = ? WHERE order_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, Integer.parseInt(order.getTotal_cost()));
            preparedStatement.setString(2, order.getFullName());
            preparedStatement.setString(3, order.getPhone());
            preparedStatement.setString(4, order.getAddress());
            preparedStatement.setBoolean(5, Boolean.parseBoolean(order.getStatus_order()));
            preparedStatement.setInt(6, Integer.parseInt(order.getUserId()));
            preparedStatement.setInt(7, Integer.parseInt(order.getSaler_id()));
            preparedStatement.setString(8, order.getNote());
            preparedStatement.setInt(9, Integer.parseInt(order.getOrder_id()));
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void acceptOrder(order order) {
        String query = "UPDATE [Order] SET total_cost = ?, fullName = ?, phone = ?, address = ?, status_order = NULL, userId = ?, saler_id = ?, note = ? WHERE order_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, Integer.parseInt(order.getTotal_cost()));
            preparedStatement.setString(2, order.getFullName());
            preparedStatement.setString(3, order.getPhone());
            preparedStatement.setString(4, order.getAddress());
            preparedStatement.setInt(5, Integer.parseInt(order.getUserId()));
            preparedStatement.setInt(6, Integer.parseInt(order.getSaler_id()));
            preparedStatement.setString(7, order.getNote());
            preparedStatement.setInt(8, Integer.parseInt(order.getOrder_id()));
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void editOrder(order order, String code) {
        String query = "UPDATE [Order] SET order_code = ? WHERE order_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, code);
            preparedStatement.setInt(2, Integer.parseInt(order.getOrder_id()));
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteOrder(int orderID) {
        String query = "DELETE FROM [Order] WHERE order_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, orderID);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<order> getAllOrders() {
        List<order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Order]";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                String order_id = resultSet.getString("order_id");
                String orderDate = resultSet.getString("orderDate");
                String total_cost = resultSet.getString("total_cost");
                String fullName = resultSet.getString("fullName");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String status_order = resultSet.getString("status_order");
                String userId = resultSet.getString("userId");
                String saler_id = resultSet.getString("saler_id");
                String note = resultSet.getString("note");
                String order_code = resultSet.getString("order_code");

                order order = new order(order_id, orderDate, total_cost, fullName, phone, address, status_order, userId, saler_id, note);
                order.setOrder_code(order_code);
                orders.add(order);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orders;
    }
     


//    public List<order> getAllOrders1() throws ParseException {
//        List<order> orders = new ArrayList<>();
//        String query = "SELECT * FROM [Order]";
//        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
//             ResultSet resultSet = preparedStatement.executeQuery()) {
//            while (resultSet.next()) {
//                String order_id = resultSet.getString("order_id");
//                String orderDateString = resultSet.getString("orderDate");
//                String total_cost = resultSet.getString("total_cost");
//                String fullName = resultSet.getString("fullName");
//                String phone = resultSet.getString("phone");
//                String address = resultSet.getString("address");
//                String status_order = resultSet.getString("status_order");
//                String userId = resultSet.getString("userId");
//                String saler_id = resultSet.getString("saler_id");
//                String note = resultSet.getString("note");
//                String order_code = resultSet.getString("order_code");
//
//                // Chuyển đổi chuỗi ngày sang đối tượng Date
//                DateFormat sourceFormat = new SimpleDateFormat("yyyy-MM-dd");
//                Date orderDate = null;
//                try {
//                    orderDate = (Date) sourceFormat.parse(orderDateString);
//                } catch (ParseException e) {
//                    e.printStackTrace();
//                }
//
//                order order = new order(order_id, orderDate, total_cost, fullName, phone, address, status_order, userId, saler_id, note);
//                order.setOrder_code(order_code);
//                orders.add(order);
//            }
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        return orders;
//    }

    public order getOrderByID(int orderID) {
        order order = null;
        String query = "SELECT * FROM [Order] WHERE order_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, orderID);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String order_id = resultSet.getString("order_id");
                    String orderDate = resultSet.getString("orderDate");
                    String total_cost = resultSet.getString("total_cost");
                    String fullName = resultSet.getString("fullName");
                    String phone = resultSet.getString("phone");
                    String address = resultSet.getString("address");
                    String status_order = resultSet.getString("status_order");
                    String userId = resultSet.getString("userId");
                    String saler_id = resultSet.getString("saler_id");
                    String note = resultSet.getString("note");
                    String order_code = resultSet.getString("order_code");

                    order = new order(order_id, orderDate, total_cost, fullName, phone, address, status_order, userId, saler_id, note);
                    order.setOrder_code(order_code);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return order;
    }

    public List<order> getOrdersByUserId(String userId) {
        List<order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Order] WHERE userId = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, userId);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String order_id = resultSet.getString("order_id");
                    String orderDate = resultSet.getString("orderDate");
                    String total_cost = resultSet.getString("total_cost");
                    String fullName = resultSet.getString("fullName");
                    String phone = resultSet.getString("phone");
                    String address = resultSet.getString("address");
                    String status_order = resultSet.getString("status_order");
                    String saler_id = resultSet.getString("saler_id");
                    String note = resultSet.getString("note");
                    String order_code = resultSet.getString("order_code");

                    order order = new order(order_id, orderDate, total_cost, fullName, phone, address, status_order, userId, saler_id, note);
                    order.setOrder_code(order_code);
                    orders.add(order);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orders;
    }

    public static void main(String[] args) throws Exception {

//        Order order = new Order();
//        order.setUserId("1");
//        new OrderDAO2().createOrder(order);
    }

}
