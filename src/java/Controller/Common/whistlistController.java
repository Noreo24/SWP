/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.customerDAO;
import DAO.productDAO;
import DAO.productImageDAO;
import DAO.whistlistDao;
import Model.Product;
import Model.ProductImage;
import Model.Whistlist;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class whistlistController extends HttpServlet {

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
            out.println("<title>Servlet whistlistController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet whistlistController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);

// Get the userId from the session
        String userId = (String) session.getAttribute("userID");

// Call the getWhistlistByUserId method
        List<Whistlist> whistlistEntries = new whistlistDao().getWhistlistByUserId(userId);

// Retrieve all products related to the whistlistEntries
        List<Product> whistlistProducts = new productDAO().getAllProducts();

// Retrieve all product images
        List<ProductImage> productImages = new productImageDAO().getAllProductImages();

// Set the whistlistEntries, whistlistProducts, and productImages as attributes in the request
        request.setAttribute("whistlistEntries", whistlistEntries);
        request.setAttribute("whistlistProducts", whistlistProducts);
        request.setAttribute("productImages", productImages);

        System.out.println("Whistlist Entries for User ID: " + userId);
        for (Whistlist entry : whistlistEntries) {
            System.out.println("Whistlist ID: " + entry.getWhistlist_id());
            System.out.println("User ID: " + entry.getUserId());
            System.out.println("Product ID: " + entry.getProductId());
            // Add other properties as needed
        }

        System.out.println("\nList of Whistlist Products:");
        for (Product product : whistlistProducts) {
            System.out.println(product.toString());
        }

        System.out.println("\nList of Product Images:");
        for (ProductImage productImage : productImages) {
            System.out.println(productImage.toString());
        }

// Forward the request to a JSP page for displaying the results
        request.getRequestDispatcher("view/user/whistlist.jsp").forward(request, response);

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
