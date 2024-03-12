/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.ProductDAO;
import DAO.productImagesDAO;
import Model.Product;
import Model.productImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Admin
 */
@WebServlet(name = "searchAjaxPriceMinToMax", urlPatterns = {"/searchAjaxPriceMinToMax"})
public class searchAjaxPriceMinToMax extends HttpServlet {

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

        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);

        int priceMinInt = Integer.parseInt(request.getParameter("priceMin"));
        String priceMin = String.valueOf(priceMinInt);
        int priceMaxInt = Integer.parseInt(request.getParameter("priceMax"));
        String priceMax = String.valueOf(priceMaxInt);

//        if (Integer.parseInt(priceMin) % 1 == 0 && Integer.parseInt(priceMax) % 1 == 0) {
        ProductDAO pDAO = new ProductDAO();
        productImagesDAO piDAO = new productImagesDAO();

        List<Product> searchByPriceMinToMax = pDAO.searchByPriceMinToMax(priceMin, priceMax);
        List<productImage> allImages = piDAO.getAllImage();

        for (Product i : searchByPriceMinToMax) {
            long related_original_price = Long.parseLong(i.getOriginal_prices());
            long related_new_price = Long.parseLong(i.getSale_prices());
            i.setOriginal_prices(currencyVN.format(related_original_price));
            i.setSale_prices(currencyVN.format(related_new_price));
        }

        PrintWriter out = response.getWriter();
        for (Product o : searchByPriceMinToMax) {
            for (productImage i : allImages) {
                if (o.getProduct_id() == null ? String.valueOf(i.getProduct_id()) == null : o.getProduct_id().equals(i.getProduct_id())) {
                    if ("1".equals(o.getStatus())) {
                        if ("1".equals(o.getSale())) {
                            out.println("<div class=\"col-md-4 col-xs-6\">\n"
                                    + "                                    <div class=\"product\">\n"
                                    + "                                        <div class=\"product-img\">\n"
                                    + "                                        <img src=\"" + i.getImages() + "\">\n"
                                    + "                                     <div class=\"product-label\">\n"
                                    + "                                                    <span class=\"sale\">SALE</span>\n"
                                    + "                                                </div>\n"
                                    + "                                        </div>\n");
                            if (Float.parseFloat(o.getAvr_rated_star()) > 4.0 && Float.parseFloat(o.getAvr_rated_star()) <= 5.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) > 3.0 && Float.parseFloat(o.getAvr_rated_star()) <= 4.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) > 2.0 && Float.parseFloat(o.getAvr_rated_star()) <= 3.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) > 1.0 && Float.parseFloat(o.getAvr_rated_star()) <= 2.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) > 0.0 && Float.parseFloat(o.getAvr_rated_star()) <= 1.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) == 0.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                        } else {
                            out.println("<div class=\"col-md-4 col-xs-6\">\n"
                                    + "                                    <div class=\"product\">\n"
                                    + "                                        <div class=\"product-img\">\n"
                                    + "                                        <img src=\"" + i.getImages() + "\">\n"
                                    + "                                        </div>\n");
                            if (Float.parseFloat(o.getAvr_rated_star()) > 4.0 && Float.parseFloat(o.getAvr_rated_star()) <= 5.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) > 3.0 && Float.parseFloat(o.getAvr_rated_star()) <= 4.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) > 2.0 && Float.parseFloat(o.getAvr_rated_star()) <= 3.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) > 1.0 && Float.parseFloat(o.getAvr_rated_star()) <= 2.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) > 0.0 && Float.parseFloat(o.getAvr_rated_star()) <= 1.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                            if (Float.parseFloat(o.getAvr_rated_star()) == 0.0) {
                                out.println(" <div class=\"product-body\">\n"
                                        + "                                            <h3 class=\"product-name\"><a href=\"productDetail?pid=" + o.getProduct_id() + "\">" + o.getProduct_name() + "</a></h3>\n"
                                        + "                                                <h4 class=\"product-price\">" + o.getSale_prices() + " <del class=\"product-old-price\">" + o.getOriginal_prices() + "</del></h4>\n"
                                        + "                                            <div>\n"
                                        + "                                                    <div class=\"product-rating\">\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                        <i class=\"fa fa-star-o\"></i>\n"
                                        + "                                                    </div>\n"
                                        + "                                            </div>\n"
                                        + "                                            <div class=\"product-btns\">\n"
                                        + "                                                <button class=\"add-to-wishlist\"><i class=\"fa fa-heart-o\"></i><span class=\"tooltipp\">add to wishlist</span></button>\n"
                                        + "                                                <button class=\"add-to-compare\"><i class=\"fa fa-exchange\"></i><span class=\"tooltipp\">add to compare</span></button>\n"
                                        + "                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>\n"
                                        + "                                            </div>\n"
                                        + "                                        </div>\n"
                                        + "                                        <div class=\"add-to-cart\">\n"
                                        + "                                            <button class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>\n"
                                        + "                                        </div>\n"
                                        + "                                    </div>\n"
                                        + "                                </div>");
                            }
                        }
                    }
                }
            }
        }
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
