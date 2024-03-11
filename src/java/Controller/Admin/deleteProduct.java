///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package Controller.Admin;
//
//import DAO.*;
//import Model.*;
//import helper.UploadFile;
//import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import jakarta.servlet.http.Part;
//import java.io.File;
//import java.util.Date;
//import java.text.NumberFormat;
//import java.text.SimpleDateFormat;
//import java.time.LocalDate;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Locale;
//
//@WebServlet(name = "deleteProduct", urlPatterns = {"/deleteProduct"})
//public class deleteProduct extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//
//        Admin a = (Admin) session.getAttribute("acc");
//        String pid = request.getParameter("pid");
////        Management m = (Management) session.getAttribute("acc");
////        Customer c = (Customer) session.getAttribute("acc");
//        if (a == null) {
//            request.setAttribute("err", "Please login to access this page!");
//            request.getRequestDispatcher("/view/common/login.jsp").forward(request, response);
//            return;
//        }
//        if ("true".equals(a.getRoleId())// || "3".equals(a.getRoleId())
//                ) {
//            try {
//                ProductDAO pDAO = new ProductDAO();
//                Product p = pDAO.getProductByID(pid);
//                pDAO.deleteProduct(pid, p.getCategory_id());
//                request.getRequestDispatcher("manageProduct").forward(request, response);
//            } catch (Exception e) {
//            }
//        } else {
////            request.setAttribute("messAccess", "You are not allowed to access this page!");
//            response.sendRedirect("home");
//        }
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        Date currentDate = new Date();
//        UploadFile uploadFile = new UploadFile();
//        ProductDAO pDAO = new ProductDAO();
//        try {
//            String productId = request.getParameter("id");
//            String productName = request.getParameter("productName");
//            String highlight = request.getParameter("highlight");
//            String description = request.getParameter("content");
//            String categoryId = request.getParameter("categoryId");
//            String trademarkId = request.getParameter("trademarkId");
//            String status = request.getParameter("status");
//            String sold = request.getParameter("sold");
//            String quantity = request.getParameter("remain");
//            String sale = request.getParameter("sale");
//            String originalPrice = request.getParameter("originalPrice");
//            String salePrice = request.getParameter("salePrice");
//
//            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//            String updateDate = dateFormat.format(currentDate);
//
//            pDAO.editProduct(productId, productName, highlight, description, categoryId, trademarkId, status, sold,
//                    quantity, sale, originalPrice, salePrice, updateDate);
//            response.sendRedirect("manageProduct");
//
////            String fileName = "";
////            Part filePart = request.getPart("thumbnail");
////            fileName = (String) filePart.getSubmittedFileName();
////            if (!fileName.isEmpty()) {
////                if (isImage(fileName)) {
////                    fileName = uploadFile.uploadFile(request, "thumbnail");
////                    pDAO.editProduct(productId, productName, highlight, description, categoryId, trademarkId, status, sold,
////                            quantity, sale, originalPrice, salePrice, updateDate);
////                    response.sendRedirect("manageProduct");
////                } else {
////                    request.setAttribute("ERROR", "File is not valid!");
////                    request.getRequestDispatcher("editProduct").forward(request, response);
////                }
////            } else {
////                request.setAttribute("ERROR", "This blog doesn't have thumbnail!");
////                request.getRequestDispatcher("editProduct").forward(request, response);
////            }
//        } catch (Exception e) {
//        }
//    }
//
//    private boolean isImage(String fileName) {
//        // Get the file extension
//        String ext = fileName.substring(fileName.length() - 4, fileName.length());
//        // Check if the extension is one of the supported image formats
//        return ext.contains("jpg") || ext.contains("jpeg") || ext.contains("png") || ext.contains("gif") || ext.contains("bmp") || ext.contains("JPG") || ext.contains("JPEG") || ext.contains("PNG") || ext.contains("GIF") || ext.contains("BMP");
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
