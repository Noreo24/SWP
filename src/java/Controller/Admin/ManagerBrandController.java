/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.*;
import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author buiph
 */
@WebServlet(name = "ManagerBrandController", urlPatterns = {"/ManagerBrand"})
public class ManagerBrandController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("acc") != null) {

            if(request.getParameter("branchID") != null){
                Trademark trademark = new trademarkDAO().getTrademarkByID(Integer.parseInt(request.getParameter("branchID")));
                
                trademark.setStatus(request.getParameter("active"));
                
                new trademarkDAO().update(trademark);
            }
            
            // Xử lý lấy danh sách tài khoản
            String nameSearch = "";
            if (request.getParameter("nameSearch") != null) {
                nameSearch = request.getParameter("nameSearch");
            }
            int pageIndex = 1;
            int pageSize = 5;

            if (request.getParameter("pageSize") != null) {
                try {
                    pageSize = Integer.parseInt(request.getParameter("pageSize").trim());
                    if (pageSize < 0) {
                        pageSize = 5;
                    }
                } catch (Exception e) {
                }
            }
            if (request.getParameter("pageIndex") != null) {
                try {
                    pageIndex = Integer.parseInt(request.getParameter("pageIndex").trim());
                    if (pageIndex < 1) {
                        pageIndex = 1;
                    }
                } catch (Exception e) {
                }
            }

            int count = new trademarkDAO().count(nameSearch);

            if (pageSize > count) {
                pageSize = count;
            }

            int page = 0;

            if (pageSize != 0) {
                if (count % pageSize != 0) {
                    page = (count / pageSize) + 1;
                } else {
                    page = count / pageSize;
                }
            }

            if (pageIndex > page) {
                pageIndex = page;
            }

            // Get list brand
            List<Trademark> trademarks = new trademarkDAO().getTrademarks(nameSearch, pageIndex, pageSize);

            request.setAttribute("trademarks", trademarks);
            request.setAttribute("checkActive", "Manage Brand");
            request.setAttribute("nameSearch", nameSearch);
            request.setAttribute("page", page);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("pageSize", pageSize);

            request.getRequestDispatcher("/view/admin/ManagerBrand.jsp").forward(request, response);
        } else {
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
