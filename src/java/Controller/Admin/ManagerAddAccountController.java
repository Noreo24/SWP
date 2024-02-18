/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.*;
import Model.*;
import java.io.*;
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
@WebServlet(name = "ManagerAddAccountController", urlPatterns = {"/ManagerAddAccount"})
public class ManagerAddAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("accountSession") != null && session.getAttribute("a") != null) {

            request.setAttribute("checkActive", "Add account");

            request.getRequestDispatcher("/view/admin/ManagerAddAccount.jsp").forward(request, response);
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

        Account account = new Account();

        String username = request.getParameter("username");
        String gmail = request.getParameter("gmail");
        String fullName = request.getParameter("textFullName");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        String avatar = request.getParameter("txtAvatar");
        String gender = request.getParameter("gender");
        String roleSelect = request.getParameter("roleSelect");
        String pass = request.getParameter("pass");

        account.setEmail(gmail);
        account.setUser_name(username);
        account.setFullName(fullName);
        account.setPhone(phone);
        account.setAddress(address);
        account.setAvatar(avatar);
        account.setGender(gender);
        account.setRoleName(roleSelect);
        account.setStatus("true");
        account.setPassword(pass);

        boolean check = true;

        Account accountInfo = null;

        accountInfo = new CustomerDAO().getCustomerByEmail(gmail);

        if (accountInfo == null) {
            accountInfo = new AdminDAO().getAdminByEmail(gmail);
        }
        if (accountInfo == null) {
            accountInfo = new ManagementDao().getManagementByEmail(gmail);
        }
//        if (roleSelect.equals("Customer")) {
//            accountInfo = new CustomerDAO().getCustomerByEmail(gmail);
//        } else if (roleSelect.equals("Admin")) {
//            accountInfo = new AdminDAO().getAdminByEmail(gmail);
//        } else if (roleSelect.equals("Management")) {
//            accountInfo = new ManagementDao().getManagementByEmail(gmail);
//        }

        if (accountInfo != null) {
            check = false;
            request.setAttribute("errorEmail", "Email is exist");
        }

        accountInfo = null;

        accountInfo = new CustomerDAO().getCustomerByUsername(username);

        if (accountInfo == null) {
            accountInfo = new AdminDAO().getAdminByUsername(username);
        }

        if (accountInfo == null) {
            accountInfo = new ManagementDao().getManagementByUsername(username);
        }
//        if (roleSelect.equals("Customer")) {
//            accountInfo = new CustomerDAO().getCustomerByUsername(username);
//        } else if (roleSelect.equals("Admin")) {
//            accountInfo = new AdminDAO().getAdminByUsername(username);
//        } else if (roleSelect.equals("Management")) {
//            accountInfo = new ManagementDao().getManagementByUsername(username);
//        }

        if (accountInfo != null) {
            check = false;
            request.setAttribute("errorUserName", "UserName is exist");
        }

        if (check) {
            if (roleSelect.equals("Customer")) {
                new CustomerDAO().add(account);
            } else if (roleSelect.equals("Admin")) {
                new AdminDAO().add(account);
            } else if (roleSelect.equals("Management")) {
                Account accountAdmin = (Account) request.getSession().getAttribute("accountSession");
                account.setAdminCreateId(Integer.parseInt(accountAdmin.getUserID()));

                new ManagementDao().add(account);
            }

            response.sendRedirect("ManagerAccount");
        } else {
            request.setAttribute("userAccount", account);

            request.getRequestDispatcher("/view/admin/ManagerAddAccount.jsp").forward(request, response);
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
