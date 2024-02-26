/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAO.customerDAO;
import Model.Customer;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import verify.RandomCode;

/**
 *
 * @author Admin
 */
public class sendotp extends HttpServlet {

    String otpvalue;
    String email;

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sendotp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sendotp at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String otp = request.getParameter("otp");
        if (otp.equals(otpvalue)) {
            customerDAO cdao = new customerDAO();
            Customer c = cdao.getCustomerByEmail(email);
            HttpSession session = request.getSession();
            session.setAttribute("acc", c);
            response.sendRedirect("home");
        } else {
            String err = "Wrong OTP!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("/view/common/enterOTP.jsp").forward(request, response);
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
        email = request.getParameter("email");
        customerDAO adao = new customerDAO();
        if (adao.getCustomerByEmail(email) == null) {
            String err = "This email is not registered";
            request.setAttribute("err", err);
            request.getRequestDispatcher("/view/common/forgotPass.jsp").forward(request, response);
        } else {
            RequestDispatcher dispatcher = null;

            HttpSession mySession = request.getSession();

            RandomCode rc = new RandomCode();
            otpvalue = rc.activateCode();
            String to = email;// change accordingly
            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("tstung5903@gmail.com", "bghb gips dcnq mphi");// Put your email
                    // id and
                    // password here
                }
            });
            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Hello");
                message.setContent("<div\n"
                        + "      style=\"\n"
                        + "      width: 50vw;\n"
                        + "      margin: 0 auto;\n"
                        + "      padding: 20px 100px;\n"
                        + "      text-align: center; \n"
                        + "      border: 3px solid black; \n"
                        + "      border-radius: 10px\n"
                        + "      \"\n"
                        + "    >\n"
                        + "    <h1>Your OTP verification code is</h1>\n"
                        + "      <h3></h3>\n"
                        + "      <small\n"
                        + "        >------------------------------------------------------------------</small>\n"
                        + "      <div\n"
                        + "        style=\"\n"
                        + "          background-color: rgb(171, 168, 168);\n"
                        + "          border-radius: 10px;\n"
                        + "          padding: 10px;\n"
                        + "          width: 30%;\n"
                        + "          margin: 20px auto;\n"
                        + "          letter-spacing: 10px;\">\n"
                        + "        <h1>" + otpvalue + "</h1>\n"
                        + "      </div>\n"
                        + "      <small\n"
                        + "        >---------------------------------------------------------------------</small\n"
                        + "      >\n"
                        + "      <h5><a href=\"\">Thank you!</a></h5>\n"
                        + "    </div>",
                        "text/html");            // send message
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            dispatcher = request.getRequestDispatcher("/view/common/enterOTP.jsp");
            request.setAttribute("message", "OTP is sent to your email id");
            //request.setAttribute("connection", con);
//        mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
            //request.setAttribute("status", "success");
        }
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
