/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.customerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.Encode;

/**
 *
 * @author Admin
 */
public class registerController extends HttpServlet {

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
            out.println("<title>Servlet registerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerController at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        customerDAO cdao = new customerDAO();

        if (!email.matches("^[\\w\\.-]+@[\\w\\.-]+\\.\\w+$")) {
            String err = "Email is invalid!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("/view/common/register.jsp").forward(request, response);
        } else if (!phone.matches("^\\d{10}$") && !phone.matches("^\\d{11}$")) {
            String err = "Phone number is invalid!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("/view/common/register.jsp").forward(request, response);
        } else if (cdao.getCustomerByEmail(email) != null) {
            String err = "Email is existed!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("/view/common/register.jsp").forward(request, response);
        } else if (cdao.getCustomerByUsername(username) != null) {
            String err = "Username is existed!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("/view/common/register.jsp").forward(request, response);
        } else if (!repass.equals(pass)) {
            String err = "Repassword must be the same as password!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("/view/common/register.jsp").forward(request, response);
        } else if (pass.length() < 6 || pass.length() > 24) {
            String err = "Password must be 6 to 24 characters!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("/view/common/register.jsp").forward(request, response);
        } else {
            cdao.registCustomer(email, username, Encode.toSHA1(pass), fullname, phone, address);
            response.sendRedirect("/PhoneShop/view/common/login.jsp");
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
