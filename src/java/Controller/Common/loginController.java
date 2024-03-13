/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.adminDAO;
import DAO.customerDAO;
import DAO.managementDAO;
import Model.Admin;
import Model.Customer;
import Model.Management;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.Encode;

/**
 *
 * @author Admin
 */
public class loginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String rempass = request.getParameter("rememberpass");
        adminDAO adao = new adminDAO();
        customerDAO cdao = new customerDAO();
        managementDAO mdao = new managementDAO();
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
        if (cdao.getCustomerByUsername(username, pass) != null) {
            Customer c = cdao.getCustomerByUsername(username, pass);
            if (c.getStatus().equals("true")) {
                HttpSession session = request.getSession();
                session.setAttribute("acc", c);
                response.sendRedirect("homepage");
            } else {
                String err = "Your account is banned!";
                request.setAttribute("err", err);
                request.getRequestDispatcher("/view/common/login.jsp").forward(request, response);
            }
        } else if (adao.getAdminByUsername(username, pass) != null) {
            Admin a = adao.getAdminByUsername(username, pass);
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            response.sendRedirect("dashboard");
        }  else if (mdao.getManagementByUsername(username, pass) != null) {
            Management m = mdao.getManagementByUsername(username, pass);
            HttpSession session = request.getSession();
            session.setAttribute("acc", m);
            response.sendRedirect("dashboard");
        }
        else {
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
