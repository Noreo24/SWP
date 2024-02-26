/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.adminDAO;
import DAO.customerDAO;
import DAO.ManagementDao;
import Model.Account;
import Uils.SendMail;
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
 * @author DELL
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/ChangePassword"})
public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("accountSession") != null) {

            request.getRequestDispatcher("/view/common/changePass.jsp").forward(request, response);
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

        if (session.getAttribute("accountSession") != null) {
            Account account = (Account) session.getAttribute("accountSession");

            String passOld = request.getParameter("txtPasswordOld");
            String pass = request.getParameter("txtPassword");
            String passConfirm = request.getParameter("txtPasswordConfirm");

            request.setAttribute("passOld", passOld);
            request.setAttribute("pass", pass);
            request.setAttribute("passConfirm", passConfirm);

            if (account.getPassword().equals(passOld)) {
                if (pass.equals(passConfirm)) {
                    account.setPassword(pass);

                    if (account.getRoleName().equals("Customer")) {
                        new customerDAO().updateCustomer(account);
                    } else if (account.getRoleName().equals("Admin")) {
                        new adminDAO().updateAdmin(account);
                    } else if (account.getRoleName().equals("Management")) {
                        new ManagementDao().updateManagement(account);
                    }
                    SendMail.sendMailChangPass(account);

                    request.setAttribute("sussPass", "Password changed successfully");
                } else {
                    request.setAttribute("errorPassConfirm", "Confirm password does not match");
                }
            } else {
                request.setAttribute("errorPassOld", "Incorrect password");
            }
            request.getRequestDispatcher("/view/common/changePass.jsp").forward(request, response);
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
