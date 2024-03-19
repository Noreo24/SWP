/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User;

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

/**
 *
 * @author LanChau
 */
@WebServlet(name = "UpdateProfileUserController", urlPatterns = {"/UpdateProfileUser"})
public class UpdateProfileUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("role") != null) {
            String role = session.getAttribute("role").toString();

            Account accountInfo = null;

            switch (role) {
                case "Customer":
                    Customer customer = (Customer) session.getAttribute("acc");
                    accountInfo = new customerDAO().getCustomerACByEmail(customer.getEmail());
                    break;
                case "Admin":
                    Admin admin = (Admin) session.getAttribute("acc");
                    accountInfo = new adminDAO().getAdminACByEmail(admin.getEmail());
                    break;
                case "Management":
                    Management management = (Management) session.getAttribute("acc");
                    accountInfo = new managementDAO().getManagementACByEmail(management.getEmail());
                    break;
            }

            request.setAttribute("userAccount", accountInfo);

            request.getRequestDispatcher("/view/user/updateProfile.jsp").forward(request, response);

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
        HttpSession session = request.getSession();

        if (session.getAttribute("role") != null) {

            String role = session.getAttribute("role").toString();

            Account accountInfo = null;

            switch (role) {
                case "Customer":
                    Customer customer = (Customer) session.getAttribute("acc");
                    accountInfo = new customerDAO().getCustomerACByEmail(customer.getEmail());
                    break;
                case "Admin":
                    Admin admin = (Admin) session.getAttribute("acc");
                    accountInfo = new adminDAO().getAdminACByEmail(admin.getEmail());
                    break;
                case "Management":
                    Management management = (Management) session.getAttribute("acc");
                    accountInfo = new managementDAO().getManagementACByEmail(management.getEmail());
                    break;
            }
            String fullName = request.getParameter("textFullName");
            String phone = request.getParameter("txtPhone");
            String address = request.getParameter("txtAddress");
            String avatar = request.getParameter("txtAvatar");
            String gender = request.getParameter("gender");
            String username = request.getParameter("txtUsername");
            String gmail = request.getParameter("txtGmail");

            accountInfo.setFullName(fullName);
            accountInfo.setPhone(phone);
            accountInfo.setAddress(address);
            accountInfo.setAvatar(avatar);
            accountInfo.setGender(gender);

            boolean check = false;

            if (!gmail.equals(accountInfo.getEmail())) {
                Account accountCheck = new customerDAO().getCustomerACByEmail(gmail);
                if (accountCheck == null) {
                    accountCheck = new adminDAO().getAdminACByEmail(gmail);
                }

                if (accountCheck == null) {
                    accountCheck = new managementDAO().getManagementACByEmail(gmail);
                }

                if (accountCheck != null) {
                    check = true;
                    request.setAttribute("errorGmail", "Gmail already exists");
                }
            }

            if (!username.equals(accountInfo.getUser_name())) {
                Account accountCheck = new customerDAO().getCustomerACByUsername(username);
                if (accountCheck == null) {
                    accountCheck = new adminDAO().getAdminACByUsername(username);
                }

                if (accountCheck == null) {
                    accountCheck = new managementDAO().getManagementACByUsername(username);
                }

                if (accountCheck != null) {
                    check = true;
                    request.setAttribute("errorUsername", "Username already exists");
                }
            }
            accountInfo.setEmail(gmail);
            accountInfo.setUser_name(username);

            if (!check) {
                if (role.equals("Customer")) {
                    new customerDAO().updateACCustomer(accountInfo);
                } else if (role.equals("Admin")) {
                    new adminDAO().updateACAdmin(accountInfo);
                } else if (role.equals("Management")) {
                    new managementDAO().updateACManagement(accountInfo);
                }

                switch (role) {
                    case "Customer":
                        Customer customer = new customerDAO().getCustomerByEmail(gmail);
                        session.setAttribute("acc", customer);
                        break;
                    case "Admin":
                        Admin admin = new adminDAO().getAdminByEmail(gmail);
                        session.setAttribute("acc", admin);
                        break;
                    case "Management":
                        Management managemen = new managementDAO().getManagementByEmail(gmail);
                        session.setAttribute("acc", managemen);
                        break;
                }
                //session.setAttribute("accountSession", accountInfo);

                response.sendRedirect("ProfileUser");
            } else {

                request.setAttribute("userAccount", accountInfo);

                request.getRequestDispatcher("/view/user/updateProfile.jsp").forward(request, response);
            }

        } else {
            response.sendRedirect("logincontroller");
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
