package org.apache.jsp.view.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addtocart_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta http-equiv=\"X-UA_Compatible\" content=\"IE-adge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("    <title>Javascript-cart</title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <section class=\"product\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"product-items\">\n");
      out.write("                <div class=\"product-item\">\n");
      out.write("                    <img src=\"images/product10.jpg\" alt=\"\">\n");
      out.write("                    <div class=\"product-item-text\">\n");
      out.write("                        <p><span>320.000</span><sup>đ</sup></p>\n");
      out.write("                        <h1 style=\"font-weight: bold; font-size: 18px;\">Iphone 14ProMax</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <button>Add to cart</button>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"product-item\">\n");
      out.write("                    <img src=\"images/product11.webp\" alt=\"\">\n");
      out.write("                    <div class=\"product-item-text\">\n");
      out.write("                        <p><span>320.000</span><sup>đ</sup></p>\n");
      out.write("                        <h1 style=\"font-weight: bold; font-size: 18px;\">Iphone 13ProMax</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <button>Add to cart</button>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"product-item\">\n");
      out.write("                    <img src=\"images/product12.jpg\" alt=\"\">\n");
      out.write("                    <div class=\"product-item-text\">\n");
      out.write("                        <p><span>320.000</span><sup>đ</sup></p>\n");
      out.write("                        <h1 style=\"font-weight: bold; font-size: 18px;\">Iphone XSMax</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <button>Add to cart</button>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"product-item\">\n");
      out.write("                    <img src=\"images/product13.jpg\" alt=\"\">\n");
      out.write("                    <div class=\"product-item-text\">\n");
      out.write("                        <p><span>320.000</span><sup>đ</sup></p>\n");
      out.write("                        <h1 style=\"font-weight: bold; font-size: 18px;\">Iphone 12ProMax</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <button>Add to cart</button>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"product-item\">\n");
      out.write("                    <img src=\"images/product14.jpg\" alt=\"\">\n");
      out.write("                    <div class=\"product-item-text\">\n");
      out.write("                        <p><span>320.000</span><sup>đ</sup></p>\n");
      out.write("                        <h1 style=\"font-weight: bold; font-size: 18px;\">Iphone 15ProMax</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <button>Add to cart</button>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <section class=\"cart\">\n");
      out.write("        <h2>Cart</h2>\n");
      out.write("        <form action=\"\">\n");
      out.write("            <table>\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Sản phẩm</th>\n");
      out.write("                        <th>Giá</th>\n");
      out.write("                        <th>SL</th>\n");
      out.write("                        <th>Chọn</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td style=\"display: flex;align-items: center;\"><img style=\"width: 70px;\" src=\"images/product10.jpg\" alt=\"\">Iphone 14ProMax</td>\n");
      out.write("                        <td><p><span>320.000</span><sup>đ</sup></p></td>\n");
      out.write("                        <td><input style=\"width: 30px; outline: none;\" type=\"number\" value=\"1\" min=\"0\"></td>\n");
      out.write("                        <td style=\"cursor: pointer;\">Xóa</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td style=\"display: flex;align-items: center;\"><img style=\"width: 70px;\" src=\"images/product11.webp\" alt=\"\">Iphone 13ProMax</td>\n");
      out.write("                        <td><p><span>320.000</span><sup>đ</sup></p></td>\n");
      out.write("                        <td><input style=\"width: 30px; outline: none;\" type=\"number\" value=\"1\" min=\"1\"></td>\n");
      out.write("                        <td style=\"cursor: pointer;\">Xóa</td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            <div style=\"text-align: right;\" class=\"price-total\">\n");
      out.write("                <p style=\"font-weight: bold;\">Tổng tiền:<span>320.000</span><sup>đ</sup></p>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
