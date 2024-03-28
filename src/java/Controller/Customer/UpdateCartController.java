/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import Model.Customer;
import Uils.CookieUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author tranphuc
 */
@WebServlet(name = "UpdateCartController", urlPatterns = {"/update-cart"})
public class UpdateCartController extends HttpServlet {

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
            out.println("<title>Servlet UpdateCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCartController at " + request.getContextPath() + "</h1>");
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

        int productId = Integer.parseInt(request.getParameter("id"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        Customer account = (Customer) request.getSession().getAttribute("acc");

        if (account == null) {
            response.sendRedirect("view/common/login.jsp");
            return;
        }

        // Get the cart from the cookie
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
                        int existingProductId = Integer.parseInt(parts[0]);
                        int existingQuantity = Integer.parseInt(parts[1]);

                        // Update quantity if productId matches
                        if (existingProductId == productId) {
                            existingQuantity = existingQuantity + amount > 0 ? existingQuantity + amount : existingQuantity;
                            // Product exists, so mark it as found
                            if (amount == 0) existingQuantity = 0;
                            productId = -1;
                        }
                        // Put productId-quantity pair into the map
                        if (existingQuantity != 0) productQuantityMap.put(existingProductId, existingQuantity);
                    } catch (NumberFormatException e) {
                        // Handle parsing errors if necessary
                        e.printStackTrace();
                    }
                }
            }
        }

        // If the product doesn't already exist, add it to the cart
        if (productId != -1) {
            productQuantityMap.put(productId, amount);
        }

        // Build the new cart string
        StringBuilder updatedCart = new StringBuilder();
        for (Map.Entry<Integer, Integer> entry : productQuantityMap.entrySet()) {
            updatedCart.append(entry.getKey()).append(":").append(entry.getValue()).append("_");
        }

        // Remove trailing comma if it exists
        if (updatedCart.length() > 0) {
            updatedCart.setLength(updatedCart.length() - 1);
        }

        // Set the updated cart string in the cookie
        CookieUtils cookieUtils = new CookieUtils();
        cookieUtils.deleteSession(request, "cart_data_" + account.getUserID());
        cookieUtils.setSession(request, "cart_data_" + account.getUserID(), updatedCart.toString());

        // Redirect back to cart page or wherever needed
        response.sendRedirect("cart");

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
        processRequest(request, response);
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
