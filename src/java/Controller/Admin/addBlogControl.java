/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.blogDAO;
import Model.Admin;
import helper.UploadFile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 *
 * @author Admin
 */
@WebServlet(name = "addBlogControl", urlPatterns = {"/addblogcontrol"})
@MultipartConfig
public class addBlogControl extends HttpServlet {

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
        UploadFile uploadFile = new UploadFile();
        HttpSession session = request.getSession();
        Admin a = (Admin) session.getAttribute("acc");
        blogDAO bd = new blogDAO();
        try {
            if (a != null) {
                String title = request.getParameter("title");
                String brief_infor = request.getParameter("brief_infor");
                String content = request.getParameter("content");
                String categoryId = request.getParameter("categoryId");
                String status = request.getParameter("status");

                String fileName = "";
                Part filePart = request.getPart("thumbnail");
                fileName = (String) filePart.getSubmittedFileName();
                if (!fileName.isEmpty()) {
                    if (isImage(fileName)) {
                        fileName = uploadFile.uploadFile(request, "thumbnail");
                        bd.addNewBlog(title, a.getUserID(), content, fileName, brief_infor, categoryId, status);
                        response.sendRedirect("bloglistmanage");
                    } else {
                        request.setAttribute("ERROR", "File is not valid!");
                        request.getRequestDispatcher("/view/admin/addNewBlog.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("ERROR", "This blog doesn't have thumbnail!");
                    request.getRequestDispatcher("/view/admin/addNewBlog.jsp").forward(request, response);
                }

            } else {
                request.getRequestDispatcher("/view/common/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    private boolean isImage(String fileName) {
        // Get the file extension
        String ext = fileName.substring(fileName.length() - 4, fileName.length());
        // Check if the extension is one of the supported image formats
        return ext.contains("jpg") || ext.contains("jpeg") || ext.contains("png") || ext.contains("gif") || ext.contains("bmp") || ext.contains("JPG") || ext.contains("JPEG") || ext.contains("PNG") || ext.contains("GIF") || ext.contains("BMP");
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
