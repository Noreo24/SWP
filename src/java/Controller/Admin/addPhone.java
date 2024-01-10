/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Model.Trademark;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class addPhone extends HttpServlet {

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
            out.println("<title>Servlet addPhone</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addPhone at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("name");
        String highlight = request.getParameter("highlight");
        String desciption = request.getParameter("desciption");
        String oprice = request.getParameter("original_price");
        String sprice = request.getParameter("sale_price");
        String quantity = request.getParameter("quantity");
        String trademark = request.getParameter("trademark");
        String image = request.getParameter("image");
        String screensize = request.getParameter("screen_size");
        String screentech = request.getParameter("screen_tech");
        String camera = request.getParameter("camera");
        String chip = request.getParameter("chip");
        String ram = request.getParameter("ram");
        String pin = request.getParameter("pin");
        String sim = request.getParameter("sim");
        String os = request.getParameter("os");
        String screenfeature = request.getParameter("screenfeature");
        String otherfeature = request.getParameter("other");
        Trademark t = new Trademark();
        ArrayList<Trademark> trademarkList = t.getAllTrademarks();
        System.out.println(name);
//        if (name == null || desciption == null || oprice == null || quantity == null || trademark == null) {
//            String err = " Please enter more information!";
//            request.setAttribute("err", err);
//            request.setAttribute("tlist", trademarkList);
//            request.getRequestDispatcher("addPhone.jsp").forward(request, response);
//        }
//        else{
//            System.out.println("ok");}
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
