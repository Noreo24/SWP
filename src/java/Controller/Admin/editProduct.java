/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.*;
import Model.*;
import helper.UploadFile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import java.time.LocalDate;
import java.time.ZoneId;

/**
 *
 * @author LanChau
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 200, // 2MB
        maxFileSize = 1024 * 1024 * 1000, // 10MB
        maxRequestSize = 1024 * 1024 * 5000)   // 50MB
@WebServlet(name = "editProduct", urlPatterns = {"/editProduct"})
public class editProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        LocalDate localDate = LocalDate.now();
        Date currentDate = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//        Locale localeVN = new Locale("vi", "VN");
//        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);

        Admin a = (Admin) session.getAttribute("acc");
//        Management m = (Management) session.getAttribute("acc");
//        Customer c = (Customer) session.getAttribute("acc");
        if (a != null) {
            String pid = request.getParameter("pid");

            ProductDAO pDAO = new ProductDAO();
            productImagesDAO piDAO = new productImagesDAO();
            trademarkDAO tmDAO = new trademarkDAO();
            categoryDAO cDAO = new categoryDAO();
            phoneDetailDAO pdDAO = new phoneDetailDAO();
            laptopDetailDAO ltDAO = new laptopDetailDAO();
            tabletDetailDAO tbDAO = new tabletDetailDAO();
            headphoneDetailDAO hpDAO = new headphoneDetailDAO();

            Product product = pDAO.getProductByID(pid);
            List<productImage> allImages = piDAO.getAllImage();
            List<Trademark> allTrademarks = tmDAO.listAllTrademarkAdmin();
            List<Category> allCategories = cDAO.getAllCategory();
            int cateID = Integer.parseInt(product.getCategory_id());
            switch (cateID) {
                case 1:
                    PhoneDetail pd = pdDAO.phoneDetail(request.getParameter("pid"));
                    request.setAttribute("phone_detail", pd);
                    break;
                case 2:
                    LaptopDetail lt = ltDAO.lapDetail(request.getParameter("pid"));
                    request.setAttribute("lap_detail", lt);
                    break;
                case 3:
                    TabletDetail tb = tbDAO.tabletDetail(request.getParameter("pid"));
                    request.setAttribute("tablet_detail", tb);
                    break;
                case 4:
                    HeadphoneDetail hp = hpDAO.headphoneDetail(request.getParameter("pid"));
                    request.setAttribute("headphone_detail", hp);
                    break;
                default:
                    break;
            }

            String updateDate = formatter.format(currentDate);

//            if ((String) request.getAttribute("ERROR") != null) {
//                request.setAttribute("ERROR", (String) request.getAttribute("ERROR"));
//            }
            request.setAttribute("product", product);
            request.setAttribute("allImages", allImages);
            request.setAttribute("allTrademarks", allTrademarks);
            request.setAttribute("allCategories", allCategories);
            request.setAttribute("updateDate", updateDate);

            request.getRequestDispatcher("/view/admin/editProduct.jsp").forward(request, response);
//        } else if (c != null) {
//            response.sendRedirect("home");
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

        Date currentDate = new Date();
        UploadFile uploadFile = new UploadFile();
        ProductDAO pDAO = new ProductDAO();
        productImagesDAO piDAO = new productImagesDAO();
        phoneDetailDAO pdDAO = new phoneDetailDAO();
        laptopDetailDAO ltDAO = new laptopDetailDAO();
        tabletDetailDAO tbDAO = new tabletDetailDAO();
        headphoneDetailDAO hpDAO = new headphoneDetailDAO();

        try {
            String productId = request.getParameter("pId");
            String productName = request.getParameter("productName");
            String highlight = request.getParameter("highlight");
            String description = request.getParameter("content");
            String categoryId = request.getParameter("categoryId");
            String trademarkId = request.getParameter("trademarkId");

            
            StringBuilder s = new StringBuilder();
            for (int i = 0; i < request.getParameter("sold").length(); i++) {
                char currentChar = request.getParameter("sold").charAt(i);
                // Kiểm tra xem ký tự hiện tại có phải là số không
                if (Character.isDigit(currentChar)) {
                    s.append(currentChar); // Nếu là số, thêm vào kết quả
                }
            }
            String sold = s.toString();
            if (Integer.parseInt(sold) <= 0) {
                sold = pDAO.getProductByID(productId).getSole();
            }
//            
//            if (Integer.parseInt(sold) < 0) {
//                sold = pDAO.getProductByID(productId).getSole();
//            } else if (Integer.parseInt(sold) % 1 > 0.5) {
//                sold = String.valueOf((Integer.parseInt(sold) / 1) + 1);
//            } else if (Integer.parseInt(sold) % 1 < 0.5) {
//                sold = String.valueOf((Integer.parseInt(sold) / 1));
//            }

            
            StringBuilder r = new StringBuilder();
            for (int i = 0; i < request.getParameter("remain").length(); i++) {
                char currentChar = request.getParameter("remain").charAt(i);
                // Kiểm tra xem ký tự hiện tại có phải là số không
                if (Character.isDigit(currentChar)) {
                    r.append(currentChar); // Nếu là số, thêm vào kết quả
                }
            }
            String quantity = r.toString();
            if (Integer.parseInt(quantity) <= 0) {
                quantity = pDAO.getProductByID(productId).getQuantity();
            }
//            if (Integer.parseInt(quantity) < 0) {
//                quantity = pDAO.getProductByID(productId).getQuantity();
//            } else if (Integer.parseInt(quantity) % 1 > 0.5) {
//                quantity = String.valueOf((Integer.parseInt(quantity) / 1) + 1);
//            } else if (Integer.parseInt(quantity) % 1 < 0.5) {
//                quantity = String.valueOf((Integer.parseInt(quantity) / 1));
//            }

            String sale = request.getParameter("sale");

            StringBuilder oPrice = new StringBuilder();
            for (int i = 0; i < request.getParameter("originalPrice").length(); i++) {
                char currentChar = request.getParameter("originalPrice").charAt(i);
                // Kiểm tra xem ký tự hiện tại có phải là số không
                if (Character.isDigit(currentChar)) {
                    oPrice.append(currentChar); // Nếu là số, thêm vào kết quả
                }
            }
            String originalPrice = oPrice.toString();
            if (Integer.parseInt(originalPrice) == 0) {
                originalPrice = pDAO.getProductByID(productId).getOriginal_prices();
            }

            String salePrice = "";
            if ("1".equals(sale)) {
                StringBuilder sPrice = new StringBuilder();
                for (int i = 0; i < request.getParameter("salePrice").length(); i++) {
                    char currentChar = request.getParameter("salePrice").charAt(i);
                    // Kiểm tra xem ký tự hiện tại có phải là số không
                    if (Character.isDigit(currentChar)) {
                        sPrice.append(currentChar); // Nếu là số, thêm vào kết quả
                    }
                }
                salePrice = sPrice.toString();
                if (Integer.parseInt(salePrice) == 0) {
                    salePrice = pDAO.getProductByID(productId).getSale_prices();
                }
            } else {
                salePrice = "0";
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String updateDate = formatter.format(currentDate);

            String fileName = "";
            Part filePart = request.getPart("thumbnail");
            fileName = (String) filePart.getSubmittedFileName();
            if (!fileName.isEmpty()) {
                if (isImage(fileName)) {
                    fileName = uploadFile.uploadFile(request, "thumbnail");
                    piDAO.changeThumbnailByProductID(productId, "image/" + fileName);
                    pDAO.editProduct(productId, productName, highlight, description, categoryId, trademarkId, sold, quantity, sale, originalPrice, salePrice, updateDate);
                    switch (categoryId) {
                        case "1":
                            String color = request.getParameter("phoneColor");
                            String screenSize = request.getParameter("phoneScreenSize");
                            String screenTech = request.getParameter("phoneScreenTech");
                            String rearCam = request.getParameter("phoneCamRear");
                            String frontCam = request.getParameter("phoneCamFront");
                            String chip = request.getParameter("phoneChip");
                            String ram = request.getParameter("phoneRam");
                            String rom = request.getParameter("phoneRom");
                            String pin = request.getParameter("phonePin");
                            String sim = request.getParameter("phoneSim");
                            String os = request.getParameter("phoneOS");
                            String screenFeature = request.getParameter("phoneScreenFeature");
                            String other = request.getParameter("phoneOther");
                            if (pDAO.getProductByID(productId).getCategory_id().equals(categoryId)) {
                                pdDAO.editPhoneDetail(productId, color, screenSize, screenTech, rearCam, frontCam, chip, ram, rom, pin, sim, os, screenFeature, other);
                            } else {
                                pdDAO.addPhoneDetail(productId, color, screenSize, screenTech, rearCam, frontCam, chip, ram, rom, pin, sim, os, screenFeature, other);
                            }
                        case "2":
                            String lapColor = request.getParameter("lapColor");
                            String lapScreenSize = request.getParameter("lapScreenSize");
                            String lapScreenTech = request.getParameter("lapScreenTech");
                            String lapChip = request.getParameter("lapChip");
                            String lapRam = request.getParameter("lapRam");
                            String lapPin = request.getParameter("lapPin");
                            String lapOS = request.getParameter("lapOS");
                            String lapScreenFeature = request.getParameter("lapScreenFeature");
                            String lapOther = request.getParameter("lapOther");
                            if (pDAO.getProductByID(productId).getCategory_id().equals(categoryId)) {
                                ltDAO.editLaptopDetail(productId, lapColor, lapScreenSize, lapScreenTech, lapChip, lapRam, lapPin, lapOS, lapScreenFeature, lapOther);
                            } else {
                                ltDAO.addLaptopDetail(productId, lapColor, lapScreenSize, lapScreenTech, lapChip, lapRam, lapPin, lapOS, lapScreenFeature, lapOther);
                            }
                        case "3":
                            String tabColor = request.getParameter("tabColor");
                            String tabScreenSize = request.getParameter("tabScreenSize");
                            String tabScreenTech = request.getParameter("tabScreenTech");
                            String tabCamRear = request.getParameter("tabCamRear");
                            String tabCamFront = request.getParameter("tabCamFront");
                            String tabChip = request.getParameter("tabChip");
                            String tabRam = request.getParameter("tabRam");
                            String tabRom = request.getParameter("tabRom");
                            String tabPin = request.getParameter("tabPin");
                            String tabSim = request.getParameter("tabSim");
                            String tabOS = request.getParameter("tabOS");
                            String tabScreenResolution = request.getParameter("tabScreenResolution");
                            String tabScreenFeature = request.getParameter("tabScreenFeature");
                            String tabOther = request.getParameter("tabOther");
                            if (pDAO.getProductByID(productId).getCategory_id().equals(categoryId)) {
                                tbDAO.editTabletDetail(productId, tabColor, tabScreenSize, tabScreenTech, tabCamRear, tabCamFront, tabChip, tabRam, tabRom, tabPin, tabSim, tabOS, tabScreenResolution, tabScreenFeature, tabOther);
                            } else {
                                tbDAO.addTabletDetail(productId, tabColor, tabScreenSize, tabScreenTech, tabCamRear, tabCamFront, tabChip, tabRam, tabRom, tabPin, tabSim, tabOS, tabScreenResolution, tabScreenFeature, tabOther);
                            }
                        case "4":
                            String headphoneColor = request.getParameter("headphoneColor");
                            String headphoneConnect = request.getParameter("headphoneConnect");
                            String headphoneTime = request.getParameter("headphoneTime");
                            String headphoneSound = request.getParameter("headphoneSound");
                            String headphoneMic = request.getParameter("headphoneMic");
                            String headphoneCotrol = request.getParameter("headphoneCotrol");
                            String headphoneWaterproof = request.getParameter("headphoneWaterproof");
                            String headphoneOther = request.getParameter("headphoneOther");
                            if (pDAO.getProductByID(productId).getCategory_id().equals(categoryId)) {
                                hpDAO.editHeadphoneDetail(productId, headphoneConnect, headphoneColor, headphoneTime, headphoneSound, headphoneMic, headphoneCotrol, headphoneWaterproof, headphoneOther);
                            } else {
                                hpDAO.addHeadphoneDetail(productId, headphoneConnect, headphoneColor, headphoneTime, headphoneSound, headphoneMic, headphoneCotrol, headphoneWaterproof, headphoneOther);
                            }
                    }
                    response.sendRedirect("manageProduct");
                } else {
                    String targetURL = "editProduct?pid=" + productId;
//                    request.setAttribute("ERROR", "File is not valid!");
//                    request.getRequestDispatcher(targetURL).forward(request, response);
                    response.sendRedirect(targetURL);
                }
            } else {
                String targetURL = "editProduct?pid=" + productId;
////                request.setAttribute("ERROR", "This product doesn't have thumbnail!");
////                request.getRequestDispatcher(targetURL).forward(request, response);
                response.sendRedirect(targetURL);
            }
        } catch (Exception e) {
        }
    }

    private boolean isImage(String fileName) {
        // Get the file extension
        String ext = fileName.substring(fileName.length() - 4, fileName.length());
        // Check if the extension is one of the supported image formats
        return ext.contains("jpg") || ext.contains("jpeg") || ext.contains("png") || ext.contains("gif") || ext.contains("bmp") || ext.contains("webp") || ext.contains("JPG") || ext.contains("JPEG") || ext.contains("PNG") || ext.contains("GIF") || ext.contains("BMP") || ext.contains("WEBP");
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
