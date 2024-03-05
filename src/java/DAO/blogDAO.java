/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class BlogDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public ArrayList<Blog> getPagingBlogList(int a) {
        ArrayList<Blog> bloglist = new ArrayList<>();
        String query = "select b.*, cb.categoryBlog_name from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id \n"
                + "order by b.blog_id\n"
                + "OFFSET ? rows fetch next 10 rows only";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setInt(1, (a - 1) * 10);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getDate(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(10),
                        String.valueOf(rs.getBoolean(9)));
                bloglist.add(b);
            }

        } catch (Exception e) {
        }
        return bloglist;
    }

    public int getNumBlog() {
        String query = "select count(*) from Blog";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);

            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<CategoryBlog> getCateBlog() {
        ArrayList<CategoryBlog> list = new ArrayList<>();
        String query = "select * from Category_blog";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                CategoryBlog b = new CategoryBlog(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        String.valueOf(rs.getBoolean(3)));
                list.add(b);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<CategoryBlog> getCateBlogAndNumBlog() {
        ArrayList<CategoryBlog> list = new ArrayList<>();
        String query = "select cb.categoryBlog_id,cb.categoryBlog_name, count(b.blog_id) as numBlog from Category_blog cb join Blog b on b.categoryBlog_id = cb.categoryBlog_id where b.status=1 \n"
                + "group by cb.categoryBlog_id, cb.categoryBlog_name";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                CategoryBlog b = new CategoryBlog(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        String.valueOf(rs.getInt(3)),
                        null);
                list.add(b);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Blog> getPaging5BlogList(int a) {
        ArrayList<Blog> bloglist = new ArrayList<>();
        String query = "select b.*, cb.categoryBlog_name from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id where b.status=1 \n"
                + "order by b.updated_date desc\n"
                + "OFFSET ? rows fetch next 5 rows only";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setInt(1, (a - 1) * 5);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getDate(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(10),
                        String.valueOf(rs.getBoolean(9)));
                bloglist.add(b);
            }

        } catch (Exception e) {
        }
        return bloglist;
    }

    public ArrayList<Blog> getPaging15BlogList(int a, String cateId, String s) {
        ArrayList<Blog> bloglist = new ArrayList<>();
        String query = null;
        if (cateId == null && s == null) {
            query = "select b.*, cb.categoryBlog_name from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id where b.status=1 \n"
                    + "order by b.updated_date desc\n"
                    + "OFFSET ? rows fetch next 15 rows only";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setInt(1, (a - 1) * 15);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Blog b = new Blog(String.valueOf(rs.getInt(1)),
                            rs.getString(2),
                            rs.getString(3),
                            String.valueOf(rs.getDate(4)),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(10),
                            String.valueOf(rs.getBoolean(9)));
                    bloglist.add(b);
                }
            } catch (Exception e) {
            }
        } else if (cateId != null && s == null) {
            query = "select b.*, cb.categoryBlog_name from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id where b.status=1 and b.categoryBlog_id = ? \n"
                    + "order by b.updated_date desc\n"
                    + "OFFSET ? rows fetch next 15 rows only";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setInt(1, Integer.parseInt(cateId));
                stm.setInt(2, (a - 1) * 15);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Blog b = new Blog(String.valueOf(rs.getInt(1)),
                            rs.getString(2),
                            rs.getString(3),
                            String.valueOf(rs.getDate(4)),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(10),
                            String.valueOf(rs.getBoolean(9)));
                    bloglist.add(b);
                }
            } catch (Exception e) {
            }
        } else if (cateId == null && s != null) {
            query = "SELECT b.*, cb.categoryBlog_name FROM Blog b JOIN Category_blog cb ON b.categoryBlog_id = cb.categoryBlog_id WHERE b.status = 1 and b.title like ? or b.content like ? or b.brief_infor like ? \n"
                    + "ORDER BY b.updated_date DESC\n"
                    + "OFFSET ? ROWS FETCH NEXT 15 ROWS ONLY;";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setString(1, "%" + s + "%");
                stm.setString(2, "%" + s + "%");
                stm.setString(3, "%" + s + "%");
                stm.setInt(4, (a - 1) * 15);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Blog b = new Blog(String.valueOf(rs.getInt(1)),
                            rs.getString(2),
                            rs.getString(3),
                            String.valueOf(rs.getDate(4)),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(10),
                            String.valueOf(rs.getBoolean(9)));
                    bloglist.add(b);
                }
            } catch (Exception e) {
            }
        }

        return bloglist;
    }

    public static void main(String[] args) {
    }

    public void addNewBlog(String title, String user_id, String content, String brief_infor, String category_id, String status, String url_thumbnail) {
    }

    public Blog getBlogById(String blogId) {
        String query = "select * from Blog where blog_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, blogId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Blog(String.valueOf(rs.getInt(1)), rs.getString(2), rs.getString(3), String.valueOf(rs.getDate(4)), rs.getString(5), rs.getString(6), rs.getString(7), String.valueOf(rs.getInt(8)), String.valueOf(rs.getBoolean(9)));
            }

        } catch (Exception e) {
        }
        return null;
    }
    public ArrayList<Blog> getBlogList() {
        ArrayList<Blog> bloglist = new ArrayList<>();
        String query = "select b.*, cb.categoryBlog_name from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id ";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(3),
                        String.valueOf(rs.getDate(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(10),
                        String.valueOf(rs.getBoolean(9)));
                bloglist.add(b);
            }

        } catch (Exception e) {
        }
        return bloglist;
    }
}
