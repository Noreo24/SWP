package Controller.Common;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import DAO.ProductDAO2;
import Model.p;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HomeController", urlPatterns = {"/homepage"})
public class HomeController extends HttpServlet {

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
            out.println("<title>Servlet home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet home at " + request.getContextPath() + "</h1>");
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
        
        // Get the filter parameter (if present)
        String categoryFilter = request.getParameter("category");

        // Create an instance of ProductDAO
        ProductDAO2 productDAO = new ProductDAO2();

        // List to store products
        List<p> productList;
        List<p> listSoleProducts;
        List<p> listProductsTopDeal;
        List<p> listNewProducts;

        // Check if category filter is provided
        if (categoryFilter != null && !categoryFilter.isEmpty() && request.getParameter("modP") == null) {
            // Retrieve products filtered by category
            int categoryId = Integer.parseInt(categoryFilter);
            productList = productDAO.getProductsByCategory(categoryId);
            listSoleProducts = new ProductDAO2().getSoleProducts(categoryId);
            listProductsTopDeal = new ProductDAO2().getAllProductsTopDeal(categoryId);
            
        } else {
            // Retrieve all products
            productList = productDAO.getAllProducts();
            listSoleProducts = new ProductDAO2().getSoleProducts();
            listProductsTopDeal = new ProductDAO2().getAllProductsTopDeal();
            
        }
        
       if (categoryFilter != null && !categoryFilter.isEmpty() && request.getParameter("modP") != null) {
            int categoryId = Integer.parseInt(categoryFilter);
            listNewProducts = new ProductDAO2().getNewProducts(categoryId);
       } else {
           listNewProducts = new ProductDAO2().getNewProducts();
       }
           
        // Set the product list as a request attribute
        request.setAttribute("listProducts", productList);
        request.setAttribute("listProductsTopDeal", new ProductDAO2().getAllProductsTopDeal());
        request.setAttribute("listNewProducts", listNewProducts);
        request.setAttribute("listSoleProducts", listSoleProducts);

        // Forward the request to the home.jsp page (adjust the JSP page name accordingly)
        request.getRequestDispatcher("/view/common/index.jsp").forward(request, response);
        
        
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