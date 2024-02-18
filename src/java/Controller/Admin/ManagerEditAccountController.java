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

/**
 *
 * @author LanChau
 */
@WebServlet(name = "ManagerEditAccountController", urlPatterns = {"/ManagerEditAccount"})
public class ManagerEditAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("accountSession") != null) {

            String roleName = "";

            if (request.getParameter("roleSelect") != null) {
                roleName = request.getParameter("roleSelect");
            }
            Account accountInfo = null;

            if (roleName.equals("Customer")) {
                accountInfo = new CustomerDAO().getCustomerById(request.getParameter("userID"));
            } else if (roleName.equals("Admin")) {
                accountInfo = new AdminDAO().getAdminById(request.getParameter("userID"));
            } else if (roleName.equals("Management")) {
                accountInfo = new ManagementDao().getManagementById(request.getParameter("userID"));
            }

            request.setAttribute("userAccount", accountInfo);
            request.setAttribute("checkActive", "Edit account");

            request.getRequestDispatcher("/view/admin/ManagerEditAccount.jsp").forward(request, response);
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

        String fullName = request.getParameter("textFullName");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        String avatar = request.getParameter("txtAvatar");
        String gender = request.getParameter("gender");
        String roleName = request.getParameter("roleSelect");

        Account accountInfo = null;

        if (roleName.equals("Customer")) {
            accountInfo = new CustomerDAO().getCustomerById(request.getParameter("userID"));
        } else if (roleName.equals("Admin")) {
            accountInfo = new AdminDAO().getAdminById(request.getParameter("userID"));
        } else if (roleName.equals("Management")) {
            accountInfo = new ManagementDao().getManagementById(request.getParameter("userID"));
        }

        accountInfo.setFullName(fullName);
        accountInfo.setPhone(phone);
        accountInfo.setAddress(address);
        accountInfo.setAvatar(avatar);
        accountInfo.setGender(gender);

        if (roleName.equals("Customer")) {
            new CustomerDAO().updateCustomer(accountInfo);
        } else if (roleName.equals("Admin")) {
            new AdminDAO().updateAdmin(accountInfo);
        } else if (roleName.equals("Management")) {
            new ManagementDao().updateManagement(accountInfo);
        }

        response.sendRedirect("ManagerAccount");
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
