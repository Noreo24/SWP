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
            Account account = new AccountDAO().getUserById(request.getParameter("userID"));
            
            request.setAttribute("userAccount", account);
            
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
        Account cus = new AccountDAO().getUserById(request.getParameter("userID"));
        
        String fullName = request.getParameter("textFullName");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        String avatar = request.getParameter("txtAvatar");
        String gender = request.getParameter("gender");
        
        cus.setFullName(fullName);
        cus.setPhone(phone);
        cus.setAddress(address);
        cus.setAvatar(avatar);
        cus.setGender(gender);
        
        new AccountDAO().update(cus);
        
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
