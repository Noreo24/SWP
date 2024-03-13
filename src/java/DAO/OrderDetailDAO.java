/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.orderDetail;

public class OrderDetailDAO {

    Connection connection;

    public OrderDetailDAO() throws Exception {
        connection = new DBContext().getConnection();
    }

    public void createOrderDetail(orderDetail orderDetail) {
        String query = "INSERT INTO Order_Detail (product_price, quantity, order_id, product_id, total_cost) "
                + "VALUES (?, ?, ?, ?, ?)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, Integer.parseInt(orderDetail.getProduct_price()));
            preparedStatement.setInt(2, Integer.parseInt(orderDetail.getQuantity()));
            preparedStatement.setInt(3, Integer.parseInt(orderDetail.getOrder_id()));
            preparedStatement.setInt(4, Integer.parseInt(orderDetail.getProduct_id()));
            preparedStatement.setInt(5, 0);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void editOrderDetail(orderDetail orderDetail) {
        String query = "UPDATE Order_Detail SET product_price = ?, quantity = ?, product_id = ?, total_cost = ? WHERE orderDetail_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, Integer.parseInt(orderDetail.getProduct_price()));
            preparedStatement.setInt(2, Integer.parseInt(orderDetail.getQuantity()));
            preparedStatement.setInt(3, Integer.parseInt(orderDetail.getProduct_id()));
            preparedStatement.setInt(4, Integer.parseInt(orderDetail.getTotal_cost()));
            preparedStatement.setInt(5, Integer.parseInt(orderDetail.getOrderDetail_id()));
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteOrderDetail(int orderDetailID) {
        String query = "DELETE FROM Order_Detail WHERE orderDetail_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, orderDetailID);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void deleteOrderByOrderId(int id) {
        String query = "DELETE FROM Order_Detail WHERE order_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<orderDetail> getAllOrderDetails() {
        List<orderDetail> orderDetails = new ArrayList<>();
        String query = "SELECT * FROM Order_Detail";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                String orderDetail_id = resultSet.getString("orderDetail_id");
                String product_price = resultSet.getString("product_price");
                String quantity = resultSet.getString("quantity");
                String order_id = resultSet.getString("order_id");
                String product_id = resultSet.getString("product_id");
                String total_cost = resultSet.getString("total_cost");

                orderDetail orderDetail = new orderDetail(orderDetail_id, product_price, quantity, order_id, product_id, total_cost);
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderDetails;
    }

    public orderDetail getOrderDetailByID(int orderDetailID) {
        orderDetail orderDetail = null;
        String query = "SELECT * FROM Order_Detail WHERE orderDetail_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, orderDetailID);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String orderDetail_id = resultSet.getString("orderDetail_id");
                    String product_price = resultSet.getString("product_price");
                    String quantity = resultSet.getString("quantity");
                    String order_id = resultSet.getString("order_id");
                    String product_id = resultSet.getString("product_id");
                    String total_cost = resultSet.getString("total_cost");

                    orderDetail = new orderDetail(orderDetail_id, product_price, quantity, order_id, product_id, total_cost);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderDetail;
    }
    
    public List<orderDetail> getOrderDetailByOrderID(int id) {
        List<orderDetail> list = new ArrayList<>();
        String query = "SELECT * FROM Order_Detail WHERE order_id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String orderDetail_id = resultSet.getString("orderDetail_id");
                    String product_price = resultSet.getString("product_price");
                    String quantity = resultSet.getString("quantity");
                    String order_id = resultSet.getString("order_id");
                    String product_id = resultSet.getString("product_id");
                    String total_cost = resultSet.getString("total_cost");

                    orderDetail orderDetail = new orderDetail(orderDetail_id, product_price, quantity, order_id, product_id, total_cost);
                    list.add(orderDetail);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
}
