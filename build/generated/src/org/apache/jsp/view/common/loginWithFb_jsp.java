package org.apache.jsp.view.common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loginWithFb_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>Facebook Login JavaScript Example</title>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().\n");
      out.write("    console.log('statusChangeCallback');\n");
      out.write("    console.log(response);                   // The current login status of the person.\n");
      out.write("    if (response.status === 'connected') {   // Logged into your webpage and Facebook.\n");
      out.write("      testAPI();  \n");
      out.write("    } else {                                 // Not logged into your webpage or we are unable to tell.\n");
      out.write("      document.getElementById('status').innerHTML = 'Please log ' +\n");
      out.write("        'into this webpage.';\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("\n");
      out.write("  function checkLoginState() {               // Called when a person is finished with the Login Button.\n");
      out.write("    FB.getLoginStatus(function(response) {   // See the onlogin handler\n");
      out.write("      statusChangeCallback(response);\n");
      out.write("    });\n");
      out.write("  }\n");
      out.write("\n");
      out.write("\n");
      out.write("  window.fbAsyncInit = function() {\n");
      out.write("    FB.init({\n");
      out.write("      appId      : '2168851590124502',\n");
      out.write("      cookie     : true,                     // Enable cookies to allow the server to access the session.\n");
      out.write("      xfbml      : true,                     // Parse social plugins on this webpage.\n");
      out.write("      version    : 'v19.0'           // Use this Graph API version for this call.\n");
      out.write("    });\n");
      out.write("\n");
      out.write("\n");
      out.write("    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.\n");
      out.write("      statusChangeCallback(response);        // Returns the login status.\n");
      out.write("    });\n");
      out.write("  };\n");
      out.write(" \n");
      out.write("  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.\n");
      out.write("    console.log('Welcome!  Fetching your information.... ');\n");
      out.write("    FB.api('/me', function(response) {\n");
      out.write("      console.log('Successful login for: ' + response.name);\n");
      out.write("      document.getElementById('status').innerHTML =\n");
      out.write("        'Thanks for logging in, ' + response.name + '!';\n");
      out.write("    });\n");
      out.write("  }\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- The JS SDK Login Button -->\n");
      out.write("\n");
      out.write("<fb:login-button scope=\"public_profile,email\" onlogin=\"checkLoginState();\">\n");
      out.write("</fb:login-button>\n");
      out.write("\n");
      out.write("<div id=\"status\">\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<!-- Load the JS SDK asynchronously -->\n");
      out.write("<script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_US/sdk.js\"></script>\n");
      out.write("</body>\n");
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
