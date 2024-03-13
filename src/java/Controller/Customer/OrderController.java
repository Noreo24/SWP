/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import DAO.OrderDAO2;
import DAO.OrderDetailDAO;
import DAO.ProductDAO2;
import Model.Customer;
import Model.order;
import Model.orderDetail;
import Model.p;
import Uils.CookieUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tranphuc
 */
@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Customer account = (Customer) request.getSession().getAttribute("acc");

        if (account == null) {
            response.sendRedirect("logincontroller");
            return;
        }

        String cartString = new CookieUtils().getSession(request, "cart_data_" + account.getUserID());

        // Initialize a map to store productId-quantity pairs
        Map<Integer, Integer> productQuantityMap = new HashMap<>();

        // Check if cartString is not null and not empty
        if (cartString != null && !cartString.isEmpty()) {
            // Split the cartString by comma to get individual product entries
            String[] products = cartString.split("_");
            for (String product : products) {
                // Split each product entry by colon to separate productId and quantity
                String[] parts = product.split(":");
                if (parts.length == 2) {
                    try {
                        // Parse productId and quantity from parts
                        int productId = Integer.parseInt(parts[0]);
                        int quantity = Integer.parseInt(parts[1]);
                        // Put productId-quantity pair into the map
                        productQuantityMap.put(productId, quantity);
                    } catch (NumberFormatException e) {
                        // Handle parsing errors if necessary
                        e.printStackTrace();
                    }
                }
            }
        }

        List<p> products = new ArrayList<>();

        for (Map.Entry<Integer, Integer> entry : productQuantityMap.entrySet()) {
            int productId = entry.getKey();
            products.add(new ProductDAO2().getProductById(productId));
        }

        order order = new order();
        order.setAddress(request.getParameter("address"));
        order.setPhone(request.getParameter("phone"));
        order.setUserId(account.getUserID());
        order.setFullName(account.getFullName());
        order.setStatus_order("0");
        order.setNote(request.getParameter("note"));
        order.setOrderDate(new Date().toString());
        order.setTotal_cost("0");
        order.setSaler_id("0");

        try {
            order = new OrderDAO2().createOrder(order);
        } catch (Exception ex) {
            System.out.println(ex);
        }

        int totalCost = 0;

        for (p product : products) {
            orderDetail orderDetail = new orderDetail();

            orderDetail.setOrder_id(order.getOrder_id());
            orderDetail.setProduct_id(product.getProductId() + "");
            orderDetail.setProduct_price(product.getOriginalPrices() + "");
            orderDetail.setQuantity(productQuantityMap.get(product.getProductId()) + "");

            try {
                new OrderDetailDAO().createOrderDetail(orderDetail);
            } catch (Exception ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }

            totalCost += product.getOriginalPrices() * productQuantityMap.get(product.getProductId());

        }

        order.setTotal_cost(totalCost + "");

        try {
            new OrderDAO2().editOrder(order);
        } catch (Exception ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

        // clean cart
        new CookieUtils().deleteSession(request, "cart_data_" + account.getUserID());
        response.sendRedirect("cart?success");
//        response.sendRedirect("payment?id=" + order.getOrder_id());

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
