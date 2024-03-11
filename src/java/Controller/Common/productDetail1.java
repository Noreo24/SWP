/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.*; 
import Model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Admin
 */
@WebServlet(name = "productDetail", urlPatterns = {"/productDetail"})
public class productDetail1 extends HttpServlet {

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

        String id = request.getParameter("pid");
//        String id = "5";
        String stringFeedbackPageNum = request.getParameter("feedbackPageNum");
        int feedbackPageNum = 1;
        if (stringFeedbackPageNum != null) {
            feedbackPageNum = Integer.parseInt(stringFeedbackPageNum);
        }

        ProductDAO pDAO = new ProductDAO();
        categoryDAO cDAO = new categoryDAO();
        feedbackDAO fDAO = new feedbackDAO();
        customerDAO cusDAO = new customerDAO();
        productImagesDAO piDAO = new productImagesDAO();
        phoneDetailDAO pdDAO = new phoneDetailDAO();
        laptopDetailDAO ltDAO = new laptopDetailDAO();
        tabletDetailDAO tbDAO = new tabletDetailDAO();
        headphoneDetailDAO hpDAO = new headphoneDetailDAO();

        Product p = pDAO.getProductByID(id);
        Category cate = cDAO.getCategoryByProductID(id);
        int numberOfFeedback = fDAO.numberOfFeedback(id);
        List<feedback> list3F = fDAO.feedbackPaging(id, feedbackPageNum);
        Customer acc = cusDAO.getCustomerById(id);
        List<productImage> listProductImages = piDAO.getImageByProductId(id);
        List<productImage> allImages = piDAO.getAllImage();
        List<Product> relatedProduct = pDAO.get4RelatedProduct(Integer.parseInt(cate.getCategory_id()), id);
        List<Category> listAllCategory = cDAO.getAllCategory();

        // Định dạng giá tiền cho sản phẩm chính
        long original_price = Long.parseLong(p.getOriginal_prices());
        long new_price = Long.parseLong(p.getSale_prices());
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        p.setOriginal_prices(currencyVN.format(original_price));
        p.setSale_prices(currencyVN.format(new_price));
        
        // Định dạng giá tiền cho sản phẩm liên quan
        for (Product i : relatedProduct) {
            long related_original_price = Long.parseLong(i.getOriginal_prices());
            long related_new_price = Long.parseLong(i.getSale_prices());
            i.setOriginal_prices(currencyVN.format(related_original_price));
            i.setSale_prices(currencyVN.format(related_new_price));
        }
        
        // Phân trang
        int endPage = numberOfFeedback / 3;
        if (numberOfFeedback % 3 != 0) {
            endPage++;
        }
        
        // Lấy thông tin chi tiết của sản phẩm
        int cateID = Integer.parseInt(cate.getCategory_id());
        switch (cateID) {
            case 1:
                PhoneDetail pd = pdDAO.phoneDetail(id);
                request.setAttribute("phone_detail", pd);
                break;
            case 2:
                LaptopDetail lt = ltDAO.lapDetail(id);
                request.setAttribute("lap_detail", lt);
                break;
            case 3:
                TabletDetail tb = tbDAO.tabletDetail(id);
                request.setAttribute("tablet_detail", tb);
                break;
            case 4:
                HeadphoneDetail hp = hpDAO.headphoneDetail(id);
                request.setAttribute("headphone_detail", hp);
                break;
            default:
                break;
        }

        // Chuyển dữ liệu sang JSP file
        request.setAttribute("product_images", listProductImages);
        request.setAttribute("endP", endPage);
        request.setAttribute("product_detail", p);
        request.setAttribute("category", cate);
        request.setAttribute("number_of_feedback", numberOfFeedback);
        request.setAttribute("list_3_feedback", list3F);
        request.setAttribute("customer_info", acc);
        request.setAttribute("relatedProduct", relatedProduct);
        request.setAttribute("allImages", allImages);
        request.setAttribute("allCategories", listAllCategory);

        request.getRequestDispatcher("/view/common/product.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
