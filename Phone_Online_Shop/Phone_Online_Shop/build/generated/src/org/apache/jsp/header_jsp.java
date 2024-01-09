package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta charset=\"utf-8\">\n");
      out.write("\t\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("\t\t <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n");
      out.write("\n");
      out.write("\t\t<title>Electro - HTML Ecommerce Template</title>\n");
      out.write("\n");
      out.write(" \t\t<!-- Google font -->\n");
      out.write(" \t\t<link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,500,700\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write(" \t\t<!-- Bootstrap -->\n");
      out.write(" \t\t<link type=\"text/css\" rel=\"stylesheet\" href=\"css/bootstrap.min.css\"/>\n");
      out.write("\n");
      out.write(" \t\t<!-- Slick -->\n");
      out.write(" \t\t<link type=\"text/css\" rel=\"stylesheet\" href=\"css/slick.css\"/>\n");
      out.write(" \t\t<link type=\"text/css\" rel=\"stylesheet\" href=\"css/slick-theme.css\"/>\n");
      out.write("\n");
      out.write(" \t\t<!-- nouislider -->\n");
      out.write(" \t\t<link type=\"text/css\" rel=\"stylesheet\" href=\"css/nouislider.min.css\"/>\n");
      out.write("\n");
      out.write(" \t\t<!-- Font Awesome Icon -->\n");
      out.write(" \t\t<link rel=\"stylesheet\" href=\"css/font-awesome.min.css\">\n");
      out.write("\n");
      out.write(" \t\t<!-- Custom stlylesheet -->\n");
      out.write(" \t\t<link type=\"text/css\" rel=\"stylesheet\" href=\"css/style.css\"/>\n");
      out.write("\n");
      out.write("\t\t<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n");
      out.write("\t\t<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n");
      out.write("\t\t<!--[if lt IE 9]>\n");
      out.write("\t\t  <script src=\"https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js\"></script>\n");
      out.write("\t\t  <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n");
      out.write("\t\t<![endif]-->\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\t<body>\n");
      out.write("\t\t<!-- HEADER -->\n");
      out.write("\t\t<header>\n");
      out.write("\t\t\t<!-- TOP HEADER -->\n");
      out.write("\t\t\t<div id=\"top-header\">\n");
      out.write("\t\t\t\t<div class=\"container\">\n");
      out.write("\t\t\t\t\t<ul class=\"header-links pull-left\">\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\"><i class=\"fa fa-phone\"></i> +021-95-51-84</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\"><i class=\"fa fa-envelope-o\"></i> email@email.com</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\"><i class=\"fa fa-map-marker\"></i> 1734 Stonecoal Road</a></li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t<ul class=\"header-links pull-right\">\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\"><i class=\"fa fa-dollar\"></i> USD</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\"><i class=\"fa fa-user-o\"></i> My Account</a></li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<!-- /TOP HEADER -->\n");
      out.write("\n");
      out.write("\t\t\t<!-- MAIN HEADER -->\n");
      out.write("\t\t\t<div id=\"header\">\n");
      out.write("\t\t\t\t<!-- container -->\n");
      out.write("\t\t\t\t<div class=\"container\">\n");
      out.write("\t\t\t\t\t<!-- row -->\n");
      out.write("\t\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t\t<!-- LOGO -->\n");
      out.write("\t\t\t\t\t\t<div class=\"col-md-3\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"header-logo\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\" class=\"logo\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<img style=\"width: 250px\" src=\"./img/logo.png\" alt=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<!-- /LOGO -->\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<!-- SEARCH BAR -->\n");
      out.write("\t\t\t\t\t\t<div class=\"col-md-6\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"header-search\">\n");
      out.write("\t\t\t\t\t\t\t\t<form>\n");
      out.write("\t\t\t\t\t\t\t\t\t<select class=\"input-select\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"0\">All Categories</option>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"1\">Category 01</option>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"1\">Category 02</option>\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\n");
      out.write("\t\t\t\t\t\t\t\t\t<input class=\"input\" placeholder=\"Search here\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<button class=\"search-btn\">Search</button>\n");
      out.write("\t\t\t\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<!-- /SEARCH BAR -->\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<!-- ACCOUNT -->\n");
      out.write("\t\t\t\t\t\t<div class=\"col-md-3 clearfix\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"header-ctn\">\n");
      out.write("\t\t\t\t\t\t\t\t<!-- Wishlist -->\n");
      out.write("\t\t\t\t\t\t\t\t<div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"#\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-heart-o\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span>Your Wishlist</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"qty\">2</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<!-- /Wishlist -->\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t<!-- Cart -->\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"dropdown\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"true\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-shopping-cart\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span>Your Cart</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"qty\">3</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"cart-dropdown\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"cart-list\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"product-widget\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"product-img\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"./img/product01.png\" alt=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"product-body\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<h3 class=\"product-name\"><a href=\"#\">product name goes here</a></h3>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<h4 class=\"product-price\"><span class=\"qty\">1x</span>$980.00</h4>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<button class=\"delete\"><i class=\"fa fa-close\"></i></button>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"product-widget\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"product-img\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"./img/product02.png\" alt=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"product-body\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<h3 class=\"product-name\"><a href=\"#\">product name goes here</a></h3>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<h4 class=\"product-price\"><span class=\"qty\">3x</span>$980.00</h4>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<button class=\"delete\"><i class=\"fa fa-close\"></i></button>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"cart-summary\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<small>3 Item(s) selected</small>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<h5>SUBTOTAL: $2940.00</h5>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"cart-btns\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\">View Cart</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Checkout  <i class=\"fa fa-arrow-circle-right\"></i></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<!-- /Cart -->\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t<!-- Menu Toogle -->\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"menu-toggle\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"#\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-bars\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span>Menu</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<!-- /Menu Toogle -->\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<!-- /ACCOUNT -->\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<!-- row -->\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<!-- container -->\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<!-- /MAIN HEADER -->\n");
      out.write("\t\t</header>\n");
      out.write("\t\t<!-- /HEADER -->\n");
      out.write("\n");
      out.write("\t\t<!-- NAVIGATION -->\n");
      out.write("\t\t<nav id=\"navigation\">\n");
      out.write("\t\t\t<!-- container -->\n");
      out.write("\t\t\t<div class=\"container\">\n");
      out.write("\t\t\t\t<!-- responsive-nav -->\n");
      out.write("\t\t\t\t<div id=\"responsive-nav\">\n");
      out.write("\t\t\t\t\t<!-- NAV -->\n");
      out.write("\t\t\t\t\t<ul class=\"main-nav nav navbar-nav\">\n");
      out.write("\t\t\t\t\t\t<li class=\"active\"><a href=\"#\">Home</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">Hot Deals</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">Categories</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">Laptops</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">Smartphones</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">Cameras</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"#\">Accessories</a></li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t<!-- /NAV -->\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<!-- /responsive-nav -->\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<!-- /container -->\n");
      out.write("\t\t</nav>\n");
      out.write("\t\t<!-- /NAVIGATION -->\n");
      out.write("        </body>\n");
      out.write("        \n");
      out.write("</html>");
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
