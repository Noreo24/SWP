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
        
        if (session.getAttribute("accountSession") != null) {
            Account account = (Account) session.getAttribute("accountSession");
            
            Account accountInfo = null;
            
            if (account.getRoleName().equals("Customer")) {
                accountInfo = new CustomerDAO().getCustomerByEmail(account.getEmail());
                
                request.setAttribute("userAccount", accountInfo);
                
                request.getRequestDispatcher("/view/user/updateProfile.jsp").forward(request, response);
            } else if (account.getRoleName().equals("Admin")) {
                accountInfo = new AdminDAO().getAdminByEmail(account.getEmail());
                
                request.setAttribute("userAccount", accountInfo);
                
                request.getRequestDispatcher("/view/user/updateProfile.jsp").forward(request, response);
            } else if (account.getRoleName().equals("Management")) {
                accountInfo = new ManagementDao().getManagementByEmail(account.getEmail());
                
                request.setAttribute("userAccount", accountInfo);
                
                request.getRequestDispatcher("/view/user/updateProfile.jsp").forward(request, response);
            }
            
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
            
            Account accountInfo = null;
            
            if (account.getRoleName().equals("Customer")) {
                accountInfo = new CustomerDAO().getCustomerByEmail(account.getEmail());
            } else if (account.getRoleName().equals("Admin")) {
                accountInfo = new AdminDAO().getAdminByEmail(account.getEmail());
            } else if (account.getRoleName().equals("Management")) {
                accountInfo = new ManagementDao().getManagementByEmail(account.getEmail());
            }
            
            String fullName = request.getParameter("textFullName");
            String phone = request.getParameter("txtPhone");
            String address = request.getParameter("txtAddress");
            String avatar = request.getParameter("txtAvatar");
            String gender = request.getParameter("gender");
            
            accountInfo.setFullName(fullName);
            accountInfo.setPhone(phone);
            accountInfo.setAddress(address);
            accountInfo.setAvatar(avatar);
            accountInfo.setGender(gender);
            
            if (account.getRoleName().equals("Customer")) {
                new CustomerDAO().updateCustomer(accountInfo);
            } else if (account.getRoleName().equals("Admin")) {
                new AdminDAO().updateAdmin(accountInfo);
            } else if (account.getRoleName().equals("Management")) {
                new ManagementDao().updateManagement(accountInfo);
            }
            
            session.setAttribute("accountSession", accountInfo);
            
            response.sendRedirect("ProfileUser");
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
