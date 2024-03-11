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
        if (a != null //                || m != null
                ) {
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
            List<Trademark> allTrademarks = tmDAO.listAllTrademark();
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
        try {
            String productId = request.getParameter("id");
            String productName = request.getParameter("productName");
            String highlight = request.getParameter("highlight");
            String description = request.getParameter("content");
            String categoryId = request.getParameter("categoryId");
            String trademarkId = request.getParameter("trademarkId");
            String status = request.getParameter("status");

            String sold = request.getParameter("sold");
            if (Integer.parseInt(sold) < 0) {
                sold = "0";
            } else if (Integer.parseInt(sold) % 1 > 0.5) {
                sold = String.valueOf((Integer.parseInt(sold) / 1) + 1);
            } else if (Integer.parseInt(sold) % 1 < 0.5) {
                sold = String.valueOf((Integer.parseInt(sold) / 1));
            }

            String quantity = request.getParameter("remain");
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

//            pDAO.editProduct(productId, productName, highlight, description, categoryId, trademarkId, status, sold,
//                    quantity, sale, originalPrice, salePrice, updateDate);
//            response.sendRedirect("manageProduct");
            String fileName = "";
            Part filePart = request.getPart("thumbnail");
            fileName = (String) filePart.getSubmittedFileName();
            if (!fileName.isEmpty()) {
                if (isImage(fileName)) {
                    fileName = uploadFile.uploadFile(request, "thumbnail");
                    piDAO.changeThumbnailByProductID(productId, "image/" + fileName);
                    pDAO.editProduct(productId, productName, highlight, description, categoryId, trademarkId,
                            status, sold, quantity, sale, originalPrice, salePrice, updateDate);
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
