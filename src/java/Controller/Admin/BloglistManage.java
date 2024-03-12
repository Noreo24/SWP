/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.blogDAO;
import Model.Blog;
import Model.categoryBlog;
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
public class BloglistManage extends HttpServlet {

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
            out.println("<title>Servlet BloglistManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BloglistManage at " + request.getContextPath() + "</h1>");
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
        String index = request.getParameter("index");
        String search = request.getParameter("search");
        String categoryBlogId = request.getParameter("categoryBlog");
        if (index == null) {
            index = "1";
        }
        int a = Integer.parseInt(index);

        blogDAO bdao = new blogDAO();
        ArrayList<categoryBlog> clist = bdao.getCateBlog();
        ArrayList<Blog> bloglist = bdao.getPagingBlogList(a, search, categoryBlogId);
        int count = bdao.getAllNumBlog(search, categoryBlogId);
        int endPage = count / 15;
        if (count % 15 != 0) {
            endPage++;
        }
        request.setAttribute("categoryBlogId", categoryBlogId);
        request.setAttribute("search", search);
        request.setAttribute("clist", clist);
        request.setAttribute("endPage", endPage);
        request.setAttribute("bloglist", bloglist);
        request.setAttribute("index", index);
        request.setAttribute("bloglist", bloglist);
        request.getRequestDispatcher("/view/admin/ManageBlog.jsp").forward(request, response);
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
