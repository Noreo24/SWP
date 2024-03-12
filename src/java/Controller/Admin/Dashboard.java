/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.DateDAO;
import DAO.blogDAO;
import DAO.orderDAO;
import Model.Category;
import Model.Date;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.Chart;
import Model.Trademark;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Dashboard", urlPatterns = {"/dashboard"})
public class Dashboard extends HttpServlet {

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
            out.println("<title>Servlet Dashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Dashboard at " + request.getContextPath() + "</h1>");
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
        DateDAO dd = new DateDAO();
        Date date = dd.get7day();
        blogDAO bd = new blogDAO();
        orderDAO od = new orderDAO();
        String start = date.getStart().toString();
        String end = date.getEnd().toString();
        if (request.getParameter("start") != null) {
            start = request.getParameter("start");
            end = request.getParameter("end");
        }
        int day = dd.CountDayByStartEnd(start, end);
        // set chart blog 
        List<Chart> listChartBlogBar = bd.getChartBlogBar(start, day);
        List<Chart> listChartBlogArea = bd.getChartBlogArea(start, day);
        List<Chart> listChartRevenueBar = od.getChartRevenueBar(start, day);
        int maxListChartBlogBar = -1;
        for (Chart o : listChartBlogBar) {
            if (o.getValue() > maxListChartBlogBar) {
                maxListChartBlogBar = o.getValue();
            }
        }
        maxListChartBlogBar = (maxListChartBlogBar / 10 + 1) * 10;

        int maxListChartBlogArea = -1;
        for (Chart o : listChartBlogArea) {
            if (o.getValue() > maxListChartBlogArea) {
                maxListChartBlogArea = o.getValue();
            }
        }
        maxListChartBlogArea = (maxListChartBlogArea / 10 + 1) * 10;

        int maxListChartRevenueBar = -1;
        for (Chart o : listChartRevenueBar) {
            if (o.getValue() > maxListChartRevenueBar) {
                maxListChartRevenueBar = o.getValue();
            }
        }

        maxListChartRevenueBar = (maxListChartRevenueBar / 1000000 + 1) * 1000000;

        List<Trademark> listChartTradeMarkPie = od.getProTradeMarkSold(start, end);
        List<Category> listChartCategoryPie = od.getProCategorySold(start, end);

        request.setAttribute("listChartCategoryPie", listChartCategoryPie);
        request.setAttribute("listChartTradeMarkPie", listChartTradeMarkPie);
        request.setAttribute("listChartBlogBar", listChartBlogBar);
        request.setAttribute("listChartBlogArea", listChartBlogArea);
        request.setAttribute("maxListChartBlogBar", maxListChartBlogBar);
        request.setAttribute("maxListChartBlogArea", maxListChartBlogArea);
        request.setAttribute("listChartRevenueBar", listChartRevenueBar);
        request.setAttribute("maxListChartRevenueBar", maxListChartRevenueBar);

        request.setAttribute("start", start);
        request.setAttribute("end", end);

        
        request.getRequestDispatcher("/view/admin/Dashboard.jsp").forward(request, response);

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
        processRequest(request, response);
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
