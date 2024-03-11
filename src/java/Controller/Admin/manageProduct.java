/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.ProductDAO;
import DAO.categoryDAO;
import DAO.productImagesDAO;
import DAO.trademarkDAO;
import Model.Admin;
import Model.Category;
import Model.Product;
import Model.Trademark;
import Model.productImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "manageProduct", urlPatterns = {"/manageProduct"})
public class manageProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Admin a = (Admin) session.getAttribute("acc");
//        Management m = (Management) session.getAttribute("acc");
//        Customer c = (Customer) session.getAttribute("acc");
        if (a != null //|| m != null
                ) {

            productImagesDAO piDAO = new productImagesDAO();
            trademarkDAO tmDAO = new trademarkDAO();
            categoryDAO cDAO = new categoryDAO();
            List<productImage> allImages = piDAO.getAllImage();
            List<Trademark> allTrademarks = tmDAO.listAllTrademark();
            List<Category> allCategories = cDAO.getAllCategory();

            String cateSelect = "All";
            String trademarkSelect = "All";
            String nameSearch = "";

            if (request.getParameter("cateSelect") != null) {
                cateSelect = request.getParameter("cateSelect");
            }
            if (request.getParameter("trademarkSelect") != null) {
                trademarkSelect = request.getParameter("trademarkSelect");
            }
            if (request.getParameter("nameSearch") != null) {
                nameSearch = request.getParameter("nameSearch").trim();
            }
            int pageIndex = 1;
            int pageSize = 5;

            if (request.getParameter("pageSize") != null) {
                try {
                    pageSize = Integer.parseInt(request.getParameter("pageSize").trim());
                    if (pageSize < 0) {
                        pageSize = 5;
                    }
                } catch (NumberFormatException e) {
                }
            }
            if (request.getParameter("pageIndex") != null) {
                try {
                    pageIndex = Integer.parseInt(request.getParameter("pageIndex").trim());
                    if (pageIndex < 1) {
                        pageIndex = 1;
                    }
                } catch (NumberFormatException e) {
                }
            }
//  Ðếm sản phẩm theo từng category và trademark
            int countProduct = 0;
            if (!"All".equals(cateSelect) && !"All".equals(trademarkSelect)) {
                countProduct = new ProductDAO().countProduct(nameSearch, cateSelect, trademarkSelect);
            } else if (!"All".equals(cateSelect) && "All".equals(trademarkSelect)) {
                countProduct = new ProductDAO().countProductByCate(nameSearch, cateSelect);
            } else if ("All".equals(cateSelect) && !"All".equals(trademarkSelect)) {
                countProduct = new ProductDAO().countProductByTrademark(nameSearch, trademarkSelect);
            } else if ("All".equals(cateSelect) && "All".equals(trademarkSelect)) {
                countProduct = new ProductDAO().countProductNoCateAndTrade(nameSearch);
            }

            if (pageSize > countProduct) {
                pageSize = countProduct;
            }

            int page = 0;

            if (pageSize != 0) {
                if (countProduct % pageSize != 0) {
                    page = (countProduct / pageSize) + 1;
                } else {
                    page = countProduct / pageSize;
                }
            }

            if (pageIndex > page) {
                pageIndex = page;
            }

//  Lấy sản phẩm theo từng category và trademark, ký tự tìm kiếm, số lượng sản phẩm hiện thị, trang
            List<Product> product = new ArrayList<>();
            if (!"All".equals(cateSelect) && !"All".equals(trademarkSelect)) {
                product = new ProductDAO().getAllProductAdmin(nameSearch, cateSelect, trademarkSelect, pageIndex, pageSize);
            } else if (!"All".equals(cateSelect) && "All".equals(trademarkSelect)) {
                product = new ProductDAO().getAllProductAdminByCate(nameSearch, cateSelect, pageIndex, pageSize);
            } else if ("All".equals(cateSelect) && !"All".equals(trademarkSelect)) {
                product = new ProductDAO().getAllProductAdminByTrademark(nameSearch, trademarkSelect, pageIndex, pageSize);
            } else if ("All".equals(cateSelect) && "All".equals(trademarkSelect)) {
                product = new ProductDAO().getAllProductAdmin2(nameSearch, pageIndex, pageSize);
            }

            request.setAttribute("allImages", allImages);
            request.setAttribute("nameSearch", nameSearch);
            request.setAttribute("listProduct", product);
            request.setAttribute("page", page);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("countProduct", countProduct);
            request.setAttribute("cateSelect", cateSelect);
            request.setAttribute("trademarkSelect", trademarkSelect);
            request.setAttribute("allTrademarks", allTrademarks);
            request.setAttribute("allCategories", allCategories);

            request.getRequestDispatcher("/view/admin/ManageProduct.jsp").forward(request, response);
//        } else if (c != null) {
//            response.sendRedirect("home");
        } else {
            response.sendRedirect("logincontroller");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
