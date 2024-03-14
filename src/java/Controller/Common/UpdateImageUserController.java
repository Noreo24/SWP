/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

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
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.List;
import org.apache.tomcat.jakartaee.commons.io.IOUtils;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author LanChau
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 200, // 2MB
        maxFileSize = 1024 * 1024 * 1000, // 10MB
        maxRequestSize = 1024 * 1024 * 5000)   // 50MB
@WebServlet(name = "UpdateImageUserController", urlPatterns = {"/UpdateImageUser"})
public class UpdateImageUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // request.getRequestDispatcher("/test.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        HttpSession session = request.getSession();

        if (session.getAttribute("acc") != null) {
            try {
                Account account = new Account();

                String role = session.getAttribute("role").toString();

                switch (role) {
                    case "Customer":
                        Customer customer = (Customer) session.getAttribute("acc");
                        account = new customerDAO().getCustomerACByEmail(customer.getEmail());
                        break;
                    case "Admin":
                        Admin admin = (Admin) session.getAttribute("acc");
                        account = new adminDAO().getAdminACByEmail(admin.getEmail());
                        break;
                    case "Management":
                        Management management = (Management) session.getAttribute("acc");
                        account = new managementDAO().getManagementACByEmail(management.getEmail());
                        break;
                }

                Part photo = request.getPart("photo");

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
//                        System.out.println("Định dạng ảnh không được hỗ trợ");
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
                String relativePath = File.separator + "web" + File.separator + "imgUser";

                // Tạo đường dẫn tới thư mục Img nằm ngoài ổ build
                String imgDirPath = projectName + relativePath;

                // Tạo đường dẫn tới thư mục Img nằm ổ build
                String imgDirPathBuild = appPath + relativePath;

                // Tạo đối tượng File cho ảnh cần xóa
                File imageFile = new File(imgDirPath + File.separator + account.getAvatar());
                File imageFileBuild = new File(imgDirPathBuild + File.separator + account.getAvatar());

                // Kiểm tra xem tệp tồn tại trước khi xóa
                if (imageFile.exists()) {
                    if (imageFile.delete()) {
                        System.out.println("\n\n Co X cooooooooooooooooooooooo\n\n");
                    }
                    System.out.println("\n\n Co K cooooooooooooooooooooooo\n\n");
                } else {
                    System.out.println("\n\nKo cooooooooooooooooooooooo\n\n");
                }

                if (imageFileBuild.exists()) {
                    System.out.println("\n\n Co1 cooooooooooooooooooooooo\n\n");
                    imageFileBuild.delete();
                } else {
                    System.out.println("\n\nKo1 cooooooooooooooooooooooo\n\n");
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
                String submittedFileName = Util.generateRandomName(10) + "_" + account.getUser_name() + "_" + account.getRoleName() + "." + imgType;

                // Tạo đường dẫn tới file trong thư mục Img
                String filePath = imgDirPath + File.separator + submittedFileName;

                String filePathBuild = imgDirPathBuild + File.separator + submittedFileName;

                // Ghi file vào thư mục Img
                photo.write(filePath);

                photo.write(filePathBuild);

                account.setAvatar(submittedFileName);

               if (role.equals("Customer")) {
                    new customerDAO().updateACCustomer(account);
                } else if (role.equals("Admin")) {
                    new adminDAO().updateACAdmin(account);
                } else if (role.equals("Management")) {
                    new managementDAO().updateACManagement(account);
                }

                switch (role) {
                    case "Customer":
                        Customer customerOld = (Customer) session.getAttribute("acc");
                        Customer customer = new customerDAO().getCustomerByEmail(customerOld.getEmail());
                        session.setAttribute("acc", customer);
                        break;
                    case "Admin":
                        Admin adminOld = (Admin) session.getAttribute("acc");
                        Admin admin = new adminDAO().getAdminByEmail(adminOld.getEmail());
                        session.setAttribute("acc", admin);
                        break;
                    case "Management":
                        Management managemenOldt = (Management) session.getAttribute("acc");
                        Management managemen = new managementDAO().getManagementByEmail(managemenOldt.getEmail());
                        session.setAttribute("acc", managemen);
                        break;
                }

                Thread.sleep(2000);

                response.sendRedirect("UpdateProfileUser");
//                out.print("File " + submittedFileName + " has been uploaded successfully to " + filePath + "------" + photo.getContentType());
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
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
