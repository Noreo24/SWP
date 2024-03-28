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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "addProductControl", urlPatterns = {"/addProductControl"})
@MultipartConfig
public class addProductControl extends HttpServlet {

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
        Date currentDate = new Date();

        Admin a = (Admin) session.getAttribute("acc");
        ProductDAO pDAO = new ProductDAO();
        productImagesDAO piDAO = new productImagesDAO();
        categoryDAO cDAO = new categoryDAO();
        trademarkDAO tmDAO = new trademarkDAO();
        phoneDetailDAO pdDAO = new phoneDetailDAO();
        laptopDetailDAO ltDAO = new laptopDetailDAO();
        tabletDetailDAO tbDAO = new tabletDetailDAO();
        headphoneDetailDAO hpDAO = new headphoneDetailDAO();

        List<Category> cList = cDAO.getAllCategory();
        List<Trademark> tmList = tmDAO.listAllTrademarkAdmin();
        String countProduct = String.valueOf(pDAO.totalNumberOfProduct());

        try {
            if (a != null) {
//                String productId = request.getParameter("id");
                String productName = request.getParameter("productName");
                String highlight = request.getParameter("highlight");
                String description = request.getParameter("content");

                String cateID = "";
                String cateSelect = request.getParameter("cateSelect");
                for (Category c : cList) {
                    if (cateSelect.equals(c.getCategory_name())) {
                        cateID = c.getCategory_id();
                        break;
                    }
                }
                if ("1".equals(cateID)) {
                    String phoneColor = request.getParameter("phoneColor");
                    String phoneScreenSize = request.getParameter("phoneScreenSize");
                    String phoneScreenTech = request.getParameter("phoneScreenTech");
                    String phoneRareCam = request.getParameter("phoneRareCam");
                    String phoneFrontCam = request.getParameter("phoneFrontCam");
                    String phoneChip = request.getParameter("phoneChip");
                    String phoneRAM = request.getParameter("phoneRAM");
                    String phoneROM = request.getParameter("phoneROM");
                    String phonePIN = request.getParameter("phonePIN");
                    String phoneSIM = request.getParameter("phoneSIM");
                    String phoneSystem = request.getParameter("phoneSystem");
                    String phoneScreenFeaured = request.getParameter("phoneScreenFeaured");
                    String phoneOtherFeaured = request.getParameter("phoneOtherFeaured");
                    pdDAO.addPhoneDetail(countProduct + 1, phoneColor, phoneScreenSize, phoneScreenTech, phoneRareCam, phoneFrontCam, phoneChip, phoneRAM, phoneROM, phonePIN,
                            phoneSIM, phoneSystem, phoneScreenFeaured, phoneOtherFeaured);
                } else if ("2".equals(cateID)) {
                    String lapColor = request.getParameter("lapColor");
                    String lapScreenSize = request.getParameter("lapScreenSize");
                    String lapScreenTech = request.getParameter("lapScreenTech");
                    String lapChip = request.getParameter("lapChip");
                    String lapRAM = request.getParameter("lapRAM");
                    String lapPIN = request.getParameter("lapPIN");
                    String lapSystem = request.getParameter("lapSystem");
                    String lapScreenFeatured = request.getParameter("lapScreenFeatured");
                    String lapOtherFeatured = request.getParameter("lapOtherFeatured");
                    ltDAO.addLaptopDetail(countProduct + 1, lapColor, lapScreenSize, lapScreenTech, lapChip, lapRAM, lapPIN, lapSystem, lapScreenFeatured, lapOtherFeatured);
                } else if ("3".equals(cateID)) {
                    String tabletColor = request.getParameter("tabletColor");
                    String tabletScreenSize = request.getParameter("tabletScreenSize");
                    String tabletScreenTech = request.getParameter("tabletScreenTech");
                    String tabletRareCam = request.getParameter("tabletRareCam");
                    String tabletFrontCam = request.getParameter("tabletFrontCam");
                    String tabletChip = request.getParameter("tabletChip");
                    String tabletRAM = request.getParameter("tabletRAM");
                    String tabletROM = request.getParameter("tabletROM");
                    String tabletPIN = request.getParameter("tabletPIN");
                    String tabletSIM = request.getParameter("tabletSIM");
                    String tabletSystem = request.getParameter("tabletSystem");
                    String tabletScreen = request.getParameter("tabletScreen");
                    String tabletScreenFeatured = request.getParameter("tabletScreenFeatured");
                    String tabletOtherFeatured = request.getParameter("tabletOtherFeatured");
                    tbDAO.addTabletDetail(countProduct + 1, tabletColor, tabletScreenSize, tabletScreenTech, tabletRareCam, tabletFrontCam, tabletChip, tabletRAM,
                            tabletROM, tabletPIN, tabletSIM, tabletSystem, tabletScreen, tabletScreenFeatured, tabletOtherFeatured);
                } else if ("4".equals(cateID)) {
                    String headphoneColor = request.getParameter("headphoneColor");
                    String headphoneConnect = request.getParameter("headphoneConnect");
                    String headphonePIN = request.getParameter("headphonePIN");
                    String headphoneSound = request.getParameter("headphoneSound");
                    String headphoneMic = request.getParameter("headphoneMic");
                    String headphoneControl = request.getParameter("headphoneControl");
                    String headphoneWater = request.getParameter("headphoneWater");
                    String headphoneOtherFeatured = request.getParameter("headphoneOtherFeatured");
                    hpDAO.addHeadphoneDetail(countProduct + 1, headphoneColor, headphoneConnect, headphonePIN, headphoneSound, headphoneMic, headphoneControl, headphoneWater, headphoneOtherFeatured);
                }

                String trademarkID = "";
                String trademarkSelect = request.getParameter("trademarkSelect");
                for (Trademark tm : tmList) {
                    if (trademarkSelect.equals(tm.getTrademark_name())) {
                        trademarkID = tm.getTrademark_id();
                        break;
                    }
                }

                String status = request.getParameter("status");

                StringBuilder q = new StringBuilder();
                for (int i = 0; i < request.getParameter("quantity").length(); i++) {
                    char currentChar = request.getParameter("quantity").charAt(i);
                    // Kiểm tra xem ký tự hiện tại có phải là số không
                    if (Character.isDigit(currentChar)) {
                        q.append(currentChar); // Nếu là số, thêm vào kết quả
                    }
                }
                String quantity = q.toString();

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
                        pDAO.addNewProduct(productName, originalPrice, sale, salePrice, highlight, description, trademarkID, "1",
                                quantity, "1", cateID, updateDate, "0", "1", "0");
                        piDAO.addNewProductImage(pDAO.getLastProduct().getProduct_id(), "1", "image/" + fileName);
                        response.sendRedirect("manageProduct");
                    } else {
                        response.sendRedirect("/view/admin/addProduct.jsp");
                    }
                } else {
                    response.sendRedirect("/view/admin/addProduct.jsp");
                }
            }
        } catch (ServletException | IOException e) {
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
