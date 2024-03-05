/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.*;
import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author LanChau
 */
@WebServlet(name = "LoginController", urlPatterns = {"/logincontroller"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/common/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String rempass = request.getParameter("rememberpass");

        CustomerDAO customerDAO = new CustomerDAO();
        AdminDAO adminDAO = new AdminDAO();
        ManagementDao managementDao = new ManagementDao();

//        AccountDAO accountDAO = new AccountDAO();
        if (rempass != null) {
            Cookie c_user = new Cookie("username", username);
            Cookie c_pass = new Cookie("pass", pass);
            c_user.setMaxAge(3600 * 24 * 30);
            c_pass.setMaxAge(3600 * 24 * 30);
            c_user.setPath("/view/common/login.jsp");
            c_pass.setPath("/view/common/login.jsp");
            response.addCookie(c_user);
            response.addCookie(c_pass);
        }
        // Get User by account
        Account account = customerDAO.getUserCustomerByUsername(username, pass);
        
        // If account null --> find account in table admin
        if (account == null) {
            account = adminDAO.getUserAdminByUsername(username, pass);
        }
        
        // If account null --> find account in table management
        if (account == null) {
            account = managementDao.getUserManagementByUsername(username, pass);
        }
        
        if (account != null) {
            if ("true".equals(account.getStatus())) {
                HttpSession session = request.getSession();
                session.setAttribute("accountSession", account);

                // đoạn này để ko ảnh hưởng code cũ. Nên trọc data từ accountSession
                if (account.getRoleName().equals("Admin")) {
                    session.setAttribute("a", account);
                    response.sendRedirect("ManagerAccount");
                } else if(account.getRoleName().equals("Customer")) {
                    session.setAttribute("c", account);
                    response.sendRedirect("Home");
                }else if(account.getRoleName().equals("Management")) {
                    session.setAttribute("m", account);
                    response.sendRedirect("Home");
                }
                
            } else {
                String err = "Your account is banned!";
                request.setAttribute("err", err);
                request.getRequestDispatcher("/view/common/login.jsp").forward(request, response);
            }

//        } else if (adao.getAdminByUsername(username, pass) != null) {
//            Admin a = adao.getAdminByUsername(username, pass);
//            HttpSession session = request.getSession();
//            session.setAttribute("a", a);
//            
        } else {
            String err = "Wrong username or password!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("/view/common/login.jsp").forward(request, response);
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
