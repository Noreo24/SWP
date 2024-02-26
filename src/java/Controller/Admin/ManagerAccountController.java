/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.*;
import Model.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author LanChau
 */
@WebServlet(name = "ManagerAccountController", urlPatterns = {"/ManagerAccount"})
public class ManagerAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("accountSession") != null && session.getAttribute("a") != null) {

            String roleSelect = "Customer";

            if (request.getParameter("roleSelect") != null) {
                roleSelect = request.getParameter("roleSelect");
            }

            // Xử lý hành động block hoặc active 
            if (request.getParameter("userID") != null && request.getParameter("active") != null) {
                String userID = request.getParameter("userID");
                String active = request.getParameter("active");

                Account accountInfo = null;

                if (roleSelect.equals("Customer")) {
                    accountInfo = new customerDAO().getCustomerById(userID);
                } else if (roleSelect.equals("Admin")) {
                    accountInfo = new adminDAO().getAdminById(userID);
                } else if (roleSelect.equals("Management")) {
                    accountInfo = new ManagementDao().getManagementById(userID);
                }

                accountInfo.setStatus(active);

                if (roleSelect.equals("Customer")) {
                    new customerDAO().updateCustomer(accountInfo);
                } else if (roleSelect.equals("Admin")) {
                    new adminDAO().updateAdmin(accountInfo);
                } else if (roleSelect.equals("Management")) {
                    new ManagementDao().updateManagement(accountInfo);
                }

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

            int countAccount = 0;

            if(roleSelect.equals("Customer")) {
                countAccount = new customerDAO().getCount(nameSearch);
            } else if (roleSelect.equals("Admin")) {
                countAccount = new adminDAO().getCount(nameSearch);
            } else if (roleSelect.equals("Management")) {
                countAccount = new ManagementDao().getCount(nameSearch);
            }

            if (pageSize > countAccount) {
                pageSize = countAccount;
            }

            int page = 0;

            if (pageSize != 0) {
                if (countAccount % pageSize != 0) {
                    page = (countAccount / pageSize) + 1;
                } else {
                    page = countAccount / pageSize;
                }
            }

            if (pageIndex > page) {
                pageIndex = page;
            }

            ArrayList<Account> accounts = new ArrayList<>();
                    
            if(roleSelect.equals("Customer")) {
                accounts = new customerDAO().getAllCustomer(nameSearch, pageIndex, pageSize);
            } else if (roleSelect.equals("Admin")) {
                accounts = new adminDAO().getAllAdmin(nameSearch, pageIndex, pageSize);
            } else if (roleSelect.equals("Management")) {
                accounts = new ManagementDao().getAllManagement(nameSearch, pageIndex, pageSize);
            }
            
            request.setAttribute("nameSearch", nameSearch);
            request.setAttribute("accounts", accounts);
            request.setAttribute("page", page);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("checkActive", "Manage account");
            request.setAttribute("countAccount", countAccount);
            request.setAttribute("roleSelect", roleSelect);
 
            request.getRequestDispatcher("/view/admin/ManageAccount.jsp").forward(request, response);

        } else {
            response.sendRedirect("logincontroller");
        }
    }

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
