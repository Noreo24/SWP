/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.*;
import Model.*;
import Uils.Util;
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
import java.io.File;
import java.util.ArrayList;

/**
 *
 * @author buiph
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 200, // 2MB
        maxFileSize = 1024 * 1024 * 1000, // 10MB
        maxRequestSize = 1024 * 1024 * 5000)   // 50MB
@WebServlet(name = "ManagerEditBrandController", urlPatterns = {"/ManagerEditBrand"})
public class ManagerEditBrandController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("acc") != null) {
            Trademark trademark = new trademarkDAO().getTrademarkByID(Integer.parseInt(request.getParameter("id")));

            request.setAttribute("trademark", trademark);
            request.setAttribute("checkActive", "Manage Edit Brand");

            request.getRequestDispatcher("/view/admin/ManagerEditBrand.jsp").forward(request, response);
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

        if (session.getAttribute("acc") != null) {

            Trademark trademark = new Trademark();
            trademark.setTrademark_id(request.getParameter("txtId"));
            trademark.setTrademark_name(request.getParameter("txtName"));
            trademark.setDescription(request.getParameter("txtDes"));
//            trademark.setImg(request.getParameter("txtImg"));

            Part photo = request.getPart("txtAvatar");

            if (request.getPart("txtAvatar") != null && photo.getSize() != 0) {
                // Lấy loại MIME của phần ảnh
                String contentType = photo.getContentType();

                String imgType = "jpg";

                // Kiểm tra loại MIME để xác định định dạng ảnh
                if (contentType != null) {
                    if (contentType.equals("image/jpeg") || contentType.equals("image/jpg")) {
                        imgType = "jpeg";
                    } else if (contentType.equals("image/png")) {
                        imgType = "png";
                    } else {
                        String[] arrPho = photo.getSubmittedFileName().trim().split(".");
                        imgType = arrPho[arrPho.length - 1];
                    }
                } else {
                    System.out.println("Không thể xác định loại ảnh");
                }

                // Lấy đường dẫn thực tế đến thư mục gốc của ứng dụng
                String appPath = request.getServletContext().getRealPath("");

                // Lấy tên thư mục gốc của dự án
                String projectName = appPath.substring(0, appPath.length() - 11);

                // Lấy đường dẫn tương đối từ thư mục WEB-INF
                String relativePath = File.separator + "web" + File.separator + "imgBrand";

                // Tạo đường dẫn tới thư mục Img nằm ngoài ổ build
                String imgDirPath = projectName + relativePath;

                // Tạo đường dẫn tới thư mục Img nằm ổ build
                String imgDirPathBuild = appPath + relativePath;

                // Tạo đối tượng File cho ảnh cần xóa
                File imageFile = new File(imgDirPath + File.separator + trademark.getTrademark_id());
                File imageFileBuild = new File(imgDirPathBuild + File.separator + trademark.getTrademark_id());

                // Kiểm tra xem tệp tồn tại trước khi xóa
                if (imageFile.exists()) {
                    if (imageFile.delete()) {
                    }
                }
                if (imageFileBuild.exists()) {
                    imageFileBuild.delete();
                }
                
                // Tạo thư mục Img nếu nó chưa tồn tại
                File imgDir = new File(imgDirPath);
                if (!imgDir.exists()) {
                    imgDir.mkdirs();
                }

                File imgDir2 = new File(imgDirPathBuild);
                if (!imgDir2.exists()) {
                    imgDir2.mkdirs();
                }
                
                 // Lấy tên file gốc 
                String submittedFileName = Util.generateRandomName(10) + "_" + trademark.getTrademark_id() +  "." + imgType;

                // Tạo đường dẫn tới file trong thư mục Img
                String filePath = imgDirPath + File.separator + submittedFileName;

                String filePathBuild = imgDirPathBuild + File.separator + submittedFileName;

                // Ghi file vào thư mục Img
                photo.write(filePath);

                photo.write(filePathBuild);
                
                trademark.setImg(submittedFileName);
            }

            new trademarkDAO().update(trademark);

            response.sendRedirect("ManagerBrand");
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
