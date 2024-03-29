/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.*;
import Model.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import util.SendMailLC;
import util.Util;

/**
 *
 * @author LanChau
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 200, // 2MB
        maxFileSize = 1024 * 1024 * 1000, // 10MB
        maxRequestSize = 1024 * 1024 * 5000)   // 50MB
@WebServlet(name = "ManagerEditAccountController", urlPatterns = {"/ManagerEditAccount"})
public class ManagerEditAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("acc") != null) {

            String roleName = "";

            if (request.getParameter("roleSelect") != null) {
                roleName = request.getParameter("roleSelect");
            }
            Account accountInfo = null;

            if (roleName.equals("Customer")) {
                accountInfo = new customerDAO().getCustomerACById(request.getParameter("userID"));
            } else if (roleName.equals("Admin")) {
                accountInfo = new adminDAO().getAdminACById(request.getParameter("userID"));
            } else if (roleName.equals("Management")) {
                accountInfo = new ManagementDAO().getManagementACById(request.getParameter("userID"));
            }

            request.setAttribute("userAccount", accountInfo);
            request.setAttribute("checkActive", "Edit account");
            request.setAttribute("accountOld", accountInfo);

            request.getRequestDispatcher("/view/admin/ManagerEditAccount.jsp").forward(request, response);
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

        customerDAO cusDao = new customerDAO();
        adminDAO adDAO = new adminDAO();
        ManagementDAO managementDAO = new ManagementDAO();

        String username = request.getParameter("txtUsername");
        String gmail = request.getParameter("txtGmail");
        String usernameOld = request.getParameter("txtUsernameOld");
        String gmailOld = request.getParameter("txtGmailOld");
        String fullName = request.getParameter("textFullName");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
//        String avatar = request.getParameter("txtAvatar");
        String gender = request.getParameter("gender");
        String roleName = request.getParameter("roleSelect");
        String roleOld = request.getParameter("roleOld");

        Account accountInfo = null;

        if (roleName.equals("Customer")) {
            accountInfo = cusDao.getCustomerACById(request.getParameter("userID"));
        } else if (roleName.equals("Admin")) {
            accountInfo = adDAO.getAdminACById(request.getParameter("userID"));
        } else if (roleName.equals("Management")) {
            accountInfo = managementDAO.getManagementACById(request.getParameter("userID"));
        }

//        request.setAttribute("accountOld", accountInfo);
        boolean check = false;

        if (!gmail.equals(gmailOld)) {
            Account accountCheck = cusDao.getCustomerACByEmail(gmail);
            if (accountCheck == null) {
                accountCheck = adDAO.getAdminACByEmail(gmail);
            }

            if (accountCheck == null) {
                accountCheck = managementDAO.getManagementACByEmail(gmail);
            }

            if (accountCheck != null) {
                check = true;
                request.setAttribute("errorGmail", "Gmail already exists");
            }
        }

        if (!username.equals(usernameOld)) {
            Account accountCheck = cusDao.getCustomerACByUsername(username);
            if (accountCheck == null) {
                accountCheck = adDAO.getAdminACByUsername(username);
            }

            if (accountCheck == null) {
                accountCheck = managementDAO.getManagementACByUsername(username);
            }

            if (accountCheck != null) {
                check = true;
                request.setAttribute("errorUsername", "Username already exists");
            }
        }

        if (!check) {

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
                String relativePath = File.separator + "web" + File.separator + "imgUser";

                // Tạo đường dẫn tới thư mục Img nằm ngoài ổ build
                String imgDirPath = projectName + relativePath;

                // Tạo đường dẫn tới thư mục Img nằm ổ build
                String imgDirPathBuild = appPath + relativePath;

                // Tạo đối tượng File cho ảnh cần xóa
                File imageFile = new File(imgDirPath + File.separator + accountInfo.getAvatar());
                File imageFileBuild = new File(imgDirPathBuild + File.separator + accountInfo.getAvatar());

                // Kiểm tra xem tệp tồn tại trước khi xóa
                if (imageFile.exists()) {
                    if (imageFile.delete()) {
                    }
                }
                if (imageFileBuild.exists()) {
                    imageFileBuild.delete();
                }

                accountInfo.setEmail(gmail);
                accountInfo.setUser_name(username);
                accountInfo.setFullName(fullName);
                accountInfo.setPhone(phone);
                accountInfo.setAddress(address);
                accountInfo.setGender(gender);

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
                String submittedFileName = Util.generateRandomName(10) + "_" + accountInfo.getUser_name() + "_" + accountInfo.getRoleName() + "." + imgType;

                // Tạo đường dẫn tới file trong thư mục Img
                String filePath = imgDirPath + File.separator + submittedFileName;

                String filePathBuild = imgDirPathBuild + File.separator + submittedFileName;

                // Ghi file vào thư mục Img
                photo.write(filePath);

                photo.write(filePathBuild);

                accountInfo.setAvatar(submittedFileName);
            } else {
                accountInfo.setEmail(gmail);
                accountInfo.setUser_name(username);
                accountInfo.setFullName(fullName);
                accountInfo.setPhone(phone);
                accountInfo.setAddress(address);
                accountInfo.setGender(gender);
            }

            HttpSession session = request.getSession();
            Account accountAdmin = null;
            if (session.getAttribute("role") != null) {
                String role = session.getAttribute("role").toString();

                switch (role) {
                    case "Customer":
                        Customer customer = (Customer) session.getAttribute("acc");
                        accountAdmin = new customerDAO().getCustomerACByEmail(customer.getEmail());
                        break;
                    case "Admin":
                        Admin admin = (Admin) session.getAttribute("acc");
                        accountAdmin = new adminDAO().getAdminACByEmail(admin.getEmail());
                        break;
                    case "Management":
                        Management management = (Management) session.getAttribute("acc");
                        accountAdmin = new ManagementDAO().getManagementACByEmail(management.getEmail());
                        break;
                }
            }

            accountInfo.setAdminCreateId(Integer.parseInt(accountAdmin.getUserID()));

            if (!roleName.equals(roleOld)) {
                if (roleOld.equals("Customer")) {
                    cusDao.updateDelete(accountInfo.getUserID(), true);
                } else if (roleOld.equals("Admin")) {
                    adDAO.updateDelete(accountInfo.getUserID(), true);
                } else if (roleOld.equals("Management")) {
                    managementDAO.updateDelete(accountInfo.getUserID(), true);
                }

                if (roleName.equals("Customer")) {
                    int uId = cusDao.checkACDelete(accountInfo.getUser_name(), accountInfo.getEmail());
                    if (uId != 0) {
                        accountInfo.setUserID(uId + "");
                        cusDao.updateACCustomer(accountInfo);
                        cusDao.updateDelete(accountInfo.getUserID(), false);
                    } else {
                        cusDao.addAC(accountInfo);
                    }
                } else if (roleName.equals("Admin")) {
                    int uId = adDAO.checkACDelete(accountInfo.getUser_name(), accountInfo.getEmail());
                    
                    if (uId != 0) {
                        accountInfo.setUserID(uId + "");
                        adDAO.updateACAdmin(accountInfo);
                        adDAO.updateDelete(accountInfo.getUserID(), false);
                    } else {
                        adDAO.addAC(accountInfo);
                    }
                } else if (roleName.equals("Management")) {
                    int uId = managementDAO.checkACDelete(accountInfo.getUser_name(), accountInfo.getEmail());
                    if (uId != 0) {
                        accountInfo.setUserID(uId + "");
                        managementDAO.updateACManagement(accountInfo);
                        managementDAO.updateDelete(accountInfo.getUserID(), false);
                    } else {
                        managementDAO.addAC(accountInfo);
                    }
                }
            } else {
                if (roleName.equals("Customer")) {
                    cusDao.updateACCustomer(accountInfo);
                    
                } else if (roleName.equals("Admin")) {
                    adDAO.updateACAdmin(accountInfo);
                } else if (roleName.equals("Management")) {
                    managementDAO.updateACManagement(accountInfo);
                }
            }

            SendMailLC.sendMailChangProfileByAdmin(accountInfo);

            response.sendRedirect("ManagerAccount");
        } else {
            request.setAttribute("userAccount", accountInfo);
            request.setAttribute("checkActive", "Edit account");

            request.getRequestDispatcher("/view/admin/ManagerEditAccount.jsp").forward(request, response);
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
