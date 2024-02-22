package org.apache.jsp.view.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class profile_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Profile Page</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/css/user/profile.css\">\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"container-xl px-4 mt-4\">\r\n");
      out.write("            <!-- Account page navigation-->\r\n");
      out.write("            <nav class=\"nav nav-borders\">\r\n");
      out.write("                <a class=\"nav-link\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/Home\">Home</a>\r\n");
      out.write("                <a class=\"nav-link active ms-0\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/ProfileUser\">Profile</a>\r\n");
      out.write("                <!--                <a class=\"nav-link\" href=\"#\" target=\"__blank\">Billing</a>\r\n");
      out.write("                                <a class=\"nav-link\" href=\"#\" target=\"__blank\">Security</a>\r\n");
      out.write("                                <a class=\"nav-link\" href=\"#\"  target=\"__blank\">Notifications</a>-->\r\n");
      out.write("            </nav>\r\n");
      out.write("            <hr class=\"mt-0 mb-4\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-xl-4\">\r\n");
      out.write("                    <!-- Profile picture card-->\r\n");
      out.write("                    <div class=\"card mb-4 mb-xl-0\">\r\n");
      out.write("                        <!--<div class=\"card-header\"></div>-->\r\n");
      out.write("                        <div class=\"card-body text-center\">\r\n");
      out.write("                            <!-- Profile picture image--> \r\n");
      out.write("                            <img class=\"img-account-profile rounded-circle mb-2\" \r\n");
      out.write("                                 src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${userCustomer.getAvatar()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" \r\n");
      out.write("                                 onerror=\"this.src='http://bootdey.com/img/Content/avatar/avatar1.png'\" \r\n");
      out.write("                                 alt=\"\">\r\n");
      out.write("                            <!-- Profile picture help block-->\r\n");
      out.write("                            <div class=\"small font-italic text-muted mb-4\">  </div>\r\n");
      out.write("                            <!-- Profile picture upload button-->\r\n");
      out.write("                            <a class=\"btn btn-primary\" href=\"\">Update Profile</a>\r\n");
      out.write("                            <a class=\"btn btn-primary\" href=\"#\">Log out</a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-xl-8\">\r\n");
      out.write("                    <!-- Account details card-->\r\n");
      out.write("                    <div class=\"card mb-4\">\r\n");
      out.write("                        <div class=\"card-body\">\r\n");
      out.write("                            <div class=\"panel\">\r\n");
      out.write("                                <div class=\"bio-graph-heading\">\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"panel-body bio-graph-info\">\r\n");
      out.write("                                    <h1 class=\"mb-4\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${userCustomer.getFullName()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h1>\r\n");
      out.write("                                    <div class=\"row\">\r\n");
      out.write("                                        <div class=\"col-md-6\">\r\n");
      out.write("                                            <div class=\"bio-row\">\r\n");
      out.write("                                                <p><span>Email </span>: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${userCustomer.getEmail()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"bio-row\">\r\n");
      out.write("                                                <p><span>User Name </span>: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${userCustomer.getUser_name()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"bio-row\">\r\n");
      out.write("                                                <p><span>Phone </span>: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${userCustomer.getPhone()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"bio-row\">\r\n");
      out.write("                                                <p><span>Adderss </span>: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${userCustomer.getAddress()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <!--                                        <div class=\"col-md-6\">\r\n");
      out.write("                                                                                    <div class=\"bio-row\">\r\n");
      out.write("                                                                                        <p><span>Occupation </span>: UI Designer</p>\r\n");
      out.write("                                                                                    </div>\r\n");
      out.write("                                                                                    <div class=\"bio-row\">\r\n");
      out.write("                                                                                        <p><span>Email </span>: jsmith@flatlab.com</p>\r\n");
      out.write("                                                                                    </div>\r\n");
      out.write("                                                                                    <div class=\"bio-row\">\r\n");
      out.write("                                                                                        <p><span>Mobile </span>: (12) 03 4567890</p>\r\n");
      out.write("                                                                                    </div>\r\n");
      out.write("                                                                                    <div class=\"bio-row\">\r\n");
      out.write("                                                                                        <p><span>Phone </span>: 88 (02) 123456</p>\r\n");
      out.write("                                                                                    </div>\r\n");
      out.write("                                                                                </div>-->\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
