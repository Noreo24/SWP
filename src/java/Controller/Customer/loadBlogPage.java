/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import DAO.*;
import Model.*;
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
public class loadBlogPage extends HttpServlet {
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryBlogId = request.getParameter("category");
        String s = request.getParameter("s");
        BlogDAO bdao = new BlogDAO();
        ArrayList<CategoryBlog> cateblogList = bdao.getCateBlogAndNumBlog();
        ArrayList<Blog> nblist = bdao.getPaging5BlogList(1);
        request.setAttribute("blist", nblist);
        request.setAttribute("cateblogList", cateblogList);
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        int a = Integer.parseInt(index);
        ArrayList<Blog> bloglist = bdao.getPaging15BlogList(a, categoryBlogId, s);
        int count = bdao.getNumBlog();
        int endPage = count / 15;
        if (count % 15 != 0) {
            endPage++;
        }
        request.setAttribute("endPage", endPage);
        request.setAttribute("bloglist", bloglist);
        request.setAttribute("index", index);
        request.getRequestDispatcher("/view/user/blog.jsp").forward(request, response);
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
