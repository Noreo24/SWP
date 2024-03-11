/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.ProductDAO;
import DAO.categoryDAO;
import DAO.headphoneDetailDAO;
import DAO.laptopDetailDAO;
import DAO.phoneDetailDAO;
import DAO.productImagesDAO;
import DAO.tabletDetailDAO;
import DAO.trademarkDAO;
import Model.Admin;
import Model.Category;
import Model.Trademark;
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
        List<Trademark> tmList = tmDAO.listAllTrademark();

        try {
            if (a != null) {
                String productId = request.getParameter("id");
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
                if (cateID == "1") {
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
                    pdDAO.addPhoneDetail(phoneColor, phoneScreenSize, phoneScreenTech, phoneRareCam, phoneFrontCam, phoneChip, phoneRAM, phoneROM, phonePIN, phoneSIM, phoneSystem, phoneScreenFeaured, productId, phoneOtherFeaured);
                } else if (cateID == "2") {

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

                String quantity = request.getParameter("quantity");
                if (Integer.parseInt(quantity) < 0) {
                    quantity = "0";
                } else if (Integer.parseInt(quantity) % 1 > 0.5) {
                    quantity = String.valueOf((Integer.parseInt(quantity) / 1) + 1);
                } else if (Integer.parseInt(quantity) % 1 < 0.5) {
                    quantity = String.valueOf((Integer.parseInt(quantity) / 1));
                }

                String sale = request.getParameter("sale");
                String originalPrice = request.getParameter("originalPrice");
                String salePrice = request.getParameter("salePrice");
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                String updateDate = formatter.format(currentDate);

                String fileName = "";
                Part filePart = request.getPart("thumbnail");
                fileName = (String) filePart.getSubmittedFileName();
                if (!fileName.isEmpty()) {
                    if (isImage(fileName)) {
                        fileName = uploadFile.uploadFile(request, "thumbnail");
                        piDAO.addNewProductImage(productId, "1", "image/" + fileName);
                        pDAO.addNewProduct(productName, originalPrice, sale, salePrice, highlight, description, trademarkID, status,
                                quantity, "1", cateID, updateDate, "0", "1", "0");
                        response.sendRedirect("manageProduct");
                    } else {
                        String targetURL = "editProduct?pid=" + productId;
                        response.sendRedirect(targetURL);
                    }
                } else {
                    String targetURL = "editProduct?pid=" + productId;
                    response.sendRedirect(targetURL);
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
