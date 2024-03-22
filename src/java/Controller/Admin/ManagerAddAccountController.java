/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.*;
import Model.*;
import Uils.*;
import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import util.SendMailLC;

/**
 *
 * @author LanChau
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 200, // 2MB
          maxFileSize = 1024 * 1024 * 1000, // 10MB
          maxRequestSize = 1024 * 1024 * 5000)   // 50MB
@WebServlet(name = "ManagerAddAccountController", urlPatterns = {"/ManagerAddAccount"})
public class ManagerAddAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("acc") != null) {

            request.setAttribute("checkActive", "Add account");

            request.getRequestDispatcher("/view/admin/ManagerAddAccount.jsp").forward(request, response);
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

        Account account = new Account();

        String username = request.getParameter("username");
        String gmail = request.getParameter("gmail");
        String fullName = request.getParameter("textFullName");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        String gender = request.getParameter("gender");
        String roleSelect = request.getParameter("roleSelect");
        String pass = request.getParameter("pass");

        account.setEmail(gmail);
        account.setUser_name(username);
        account.setFullName(fullName);
        account.setPhone(phone);
        account.setAddress(address);
        account.setGender(gender);
        account.setRoleName(roleSelect);
        account.setStatus("true");
        account.setPassword(pass);

        Part photo = request.getPart("txtAvatar");

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
        String relativePath = File.separator + "web" + File.separator + "imgUser";

        // Tạo đường dẫn tới thư mục Img nằm ngoài ổ build
        String imgDirPath = projectName + relativePath;

        // Tạo đường dẫn tới thư mục Img nằm ổ build
        String imgDirPathBuild = appPath + relativePath;

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

        boolean check = true;

        Account accountInfo = null;

        accountInfo = new customerDAO().getCustomerACByEmail(gmail);

        if (accountInfo == null) {
            accountInfo = new adminDAO().getAdminACByEmail(gmail);
        }
        if (accountInfo == null) {
            accountInfo = new ManagementDAO().getManagementACByEmail(gmail);
        }
//        if (roleSelect.equals("Customer")) {
//            accountInfo = new CustomerDAO().getCustomerByEmail(gmail);
//        } else if (roleSelect.equals("Admin")) {
//            accountInfo = new AdminDAO().getAdminByEmail(gmail);
//        } else if (roleSelect.equals("Management")) {
//            accountInfo = new ManagementDao().getManagementByEmail(gmail);
//        }

        if (accountInfo != null) {
            check = false;
            request.setAttribute("errorEmail", "Email is exist");
        }

        accountInfo = null;

        accountInfo = new customerDAO().getCustomerACByUsername(username);

        if (accountInfo == null) {
            accountInfo = new adminDAO().getAdminACByUsername(username);
        }

        if (accountInfo == null) {
            accountInfo = new ManagementDAO().getManagementACByUsername(username);
        }
//        if (roleSelect.equals("Customer")) {
//            accountInfo = new CustomerDAO().getCustomerByUsername(username);
//        } else if (roleSelect.equals("Admin")) {
//            accountInfo = new AdminDAO().getAdminByUsername(username);
//        } else if (roleSelect.equals("Management")) {
//            accountInfo = new ManagementDao().getManagementByUsername(username);
//        }

        if (accountInfo != null) {
            check = false;
            request.setAttribute("errorUserName", "UserName is exist");
        }

        if (check) {
            if (roleSelect.equals("Customer")) {
                new customerDAO().addAC(account);
            } else if (roleSelect.equals("Admin")) {
                new adminDAO().addAC(account);
            } else if (roleSelect.equals("Management")) {
                Admin admin = (Admin) request.getSession().getAttribute("acc");
                account.setAdminCreateId(Integer.parseInt(admin.getUserID()));

                new ManagementDAO().addAC(account);
            }
            
            SendMailLC.sendMailAfterAddAccount(account);
            response.sendRedirect("ManagerAccount");
        } else {
            request.setAttribute("userAccount", account);

            request.getRequestDispatcher("/view/admin/ManagerAddAccount.jsp").forward(request, response);
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
