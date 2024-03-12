/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.blogDAO;
import Model.Blog;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Admin
 */
public class exportFile extends HttpServlet {

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
            out.println("<title>Servlet exportFile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet exportFile at " + request.getContextPath() + "</h1>");
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
        String type = request.getParameter("type");
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=list.xls");
        XSSFWorkbook wordkbook = new XSSFWorkbook();
        XSSFSheet sheet = wordkbook.createSheet("list");
        XSSFRow row = null;
        Cell cell = null;
        if (type.equals("blog")) {
            blogDAO bdao = new blogDAO();
            ArrayList<Blog> blogexport = bdao.getBlogListToExport();

            row = sheet.createRow(0);
            cell = row.createCell(0, CellType.STRING);
            cell.setCellValue("DANH SACH BLOG");

            row = sheet.createRow(3);
            cell = row.createCell(0, CellType.STRING);
            cell.setCellValue("STT");

            cell = row.createCell(1, CellType.STRING);
            cell.setCellValue("BLOG_ID");

            cell = row.createCell(2, CellType.STRING);
            cell.setCellValue("TILTLE");

            cell = row.createCell(3, CellType.STRING);
            cell.setCellValue("AUTHOR");

            cell = row.createCell(4, CellType.STRING);
            cell.setCellValue("UPDATED_DATE");
//
//            cell = row.createCell(5, CellType.STRING);
//            cell.setCellValue("CONTENT");

            cell = row.createCell(5, CellType.STRING);
            cell.setCellValue("THUMBNAIL");

            cell = row.createCell(6, CellType.STRING);
            cell.setCellValue("BRIEF_INFOR");

            cell = row.createCell(7, CellType.STRING);
            cell.setCellValue("CATEGORY");

            cell = row.createCell(8, CellType.STRING);
            cell.setCellValue("STATUS");

            for (int i = 0; i < blogexport.size(); i++) {
                //Modelbook book =arr.get(i);
                row = sheet.createRow(4 + i);

                cell = row.createCell(0, CellType.NUMERIC);
                cell.setCellValue(i + 1);

                cell = row.createCell(1, CellType.STRING);
                cell.setCellValue(blogexport.get(i).getBlog_id());

                cell = row.createCell(2, CellType.STRING);
                cell.setCellValue(blogexport.get(i).getTitle());

                cell = row.createCell(3, CellType.STRING);
                cell.setCellValue(blogexport.get(i).getAuthor_id());

                cell = row.createCell(4, CellType.STRING);
                cell.setCellValue(blogexport.get(i).getUpdated_date());
//
//                cell = row.createCell(5, CellType.STRING);
//                cell.setCellValue(blogexport.get(i).getContent());

                cell = row.createCell(5, CellType.STRING);
                cell.setCellValue(blogexport.get(i).getThumbnail());

                cell = row.createCell(6, CellType.STRING);
                cell.setCellValue(blogexport.get(i).getBrief_infor());

                cell = row.createCell(7, CellType.STRING);
                cell.setCellValue(blogexport.get(i).getCategoryBlog_id());

                cell = row.createCell(8, CellType.STRING);
                cell.setCellValue(blogexport.get(i).getStatus());
            }
            wordkbook.write(response.getOutputStream());
            wordkbook.close();
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
