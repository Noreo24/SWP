/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.BrandDao;
import Model.Brand;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author buiph
 */
@WebServlet(name = "ManagerEditBrandController", urlPatterns = {"/ManagerEditBrand"})
public class ManagerEditBrandController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("accountSession") != null && session.getAttribute("a") != null) {
        Brand brand = new BrandDao().getBrand(Integer.parseInt(request.getParameter("id")));

        request.setAttribute("brand", brand);
        request.setAttribute("checkActive", "Manage Edit Brand");

        request.getRequestDispatcher("/view/admin/ManagerEditBrand.jsp").forward(request, response);
        }else{
            response.sendRedirect("logincontroller");
        }
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
        HttpSession session = request.getSession();

        if (session.getAttribute("accountSession") != null && session.getAttribute("a") != null) {

            Brand brand = new Brand();
            brand.setId(Integer.parseInt(
                      request.getParameter("txtId")));
            brand.setName(request.getParameter("txtName"));
            brand.setDes(request.getParameter("txtDes"));
            brand.setImg(request.getParameter("txtImg"));
            
            new BrandDao().update(brand);
            
            response.sendRedirect("ManagerBrand");
        }
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