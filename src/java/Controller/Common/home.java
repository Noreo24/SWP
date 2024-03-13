/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.categoryDAO;
import DAO.ProductDAO;
import DAO.productImagesDAO;
import Model.Category;
import Model.Product;
import Model.productImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Admin
 */
//@WebServlet(name = "home", urlPatterns = {"/homehome"})
public class home extends HttpServlet {

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
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        String cate_id = request.getParameter("cateID");
        if (cate_id == null) {
            cate_id = "2";
        }

        categoryDAO cDAO = new categoryDAO();
        ProductDAO pDAO = new ProductDAO();
        productImagesDAO piDAO = new productImagesDAO();

        List<Category> listAllCategory = cDAO.getAllCategory();
        List<Product> list4NewProduct = pDAO.get4NewProductByCateId(cate_id);
        List<productImage> allImages = piDAO.getAllImage();

        // Định dạng giá tiền cho sản phẩm
        for (Product i : list4NewProduct) {
            long new_product_original_price = Long.parseLong(i.getOriginal_prices());
            long new_product_new_price = Long.parseLong(i.getSale_prices());
            i.setOriginal_prices(currencyVN.format(new_product_original_price));
            i.setSale_prices(currencyVN.format(new_product_new_price));
        }

        request.setAttribute("allCategories", listAllCategory);
        request.setAttribute("list4NewProduct", list4NewProduct);
        request.setAttribute("allImages", allImages);
        request.setAttribute("checkActive", "Home");

        request.getRequestDispatcher("/view/common/index.jsp").forward(request, response);
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
        processRequest(request, response);
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
