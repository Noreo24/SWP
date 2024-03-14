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
@WebServlet(name = "ProfileUserController", urlPatterns = {"/ProfileUser"})
public class ProfileUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("role") != null) {
            Account accountInfo = new Account();

            String role = session.getAttribute("role").toString();

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

            // Chua thiet ke cho role khac
            // ....
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
