/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.categoryDAO;
import DAO.ProductDAO;
import DAO.productImagesDAO;
import DAO.trademarkDAO;
import Model.Category;
import Model.Product;
import Model.Trademark;
import Model.productImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Admin
 */
@WebServlet(name = "listProduct", urlPatterns = {"/listProduct"})
public class listProduct extends HttpServlet {

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

        String stringProductPageNum = request.getParameter("productPageNum");
        int productPageNum = 1;
        if (stringProductPageNum != null) {
            productPageNum = Integer.parseInt(stringProductPageNum);
        }

        categoryDAO cDAO = new categoryDAO();
        ProductDAO pDAO = new ProductDAO();
        productImagesDAO piDAO = new productImagesDAO();
        trademarkDAO tmDAO = new trademarkDAO();

//        List<Product> allProduct = pDAO.getAllProduct();
        List<Category> listAllCategory = cDAO.getAllCategory();
        int countCategories = cDAO.countNumberOfCategories();
        List<Product> top3SellingInProductList = pDAO.getTop3SoleProduct();
        List<productImage> allImages = piDAO.getAllImage();
        int numOfProduct = pDAO.totalNumberOfProduct();
        List<Trademark> trademarkList = tmDAO.listAllTrademark();

        List<Product> list6P = pDAO.productPaging(productPageNum);

        for (Product i : top3SellingInProductList) {
            long related_original_price = Long.parseLong(i.getOriginal_prices());
            long related_new_price = Long.parseLong(i.getSale_prices());
            i.setOriginal_prices(currencyVN.format(related_original_price));
            i.setSale_prices(currencyVN.format(related_new_price));
        }

        for (Product i : list6P) {
            long related_original_price = Long.parseLong(i.getOriginal_prices());
            long related_new_price = Long.parseLong(i.getSale_prices());
            i.setOriginal_prices(currencyVN.format(related_original_price));
            i.setSale_prices(currencyVN.format(related_new_price));
        }

        // Phân trang
        int endPageProduct = numOfProduct / 6;
        if (numOfProduct % 6 != 0) {
            endPageProduct++;
        }

        request.setAttribute("numOfCate", countCategories);
        request.setAttribute("allCategories", listAllCategory);
        request.setAttribute("allBrands", trademarkList);
        request.setAttribute("top3SellingInProductList", top3SellingInProductList);
        request.setAttribute("allImages", allImages);
        request.setAttribute("numOfProduct", numOfProduct);
        request.setAttribute("endPP", endPageProduct);
        request.setAttribute("list_6_product", list6P);
        request.setAttribute("checkActive", "List product");

        request.getRequestDispatcher("/view/common/store.jsp").forward(request, response);

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