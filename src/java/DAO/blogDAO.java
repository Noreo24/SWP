/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Blog;
import Model.categoryBlog;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Model.Chart;

/**
 *
 * @author Admin
 */
public class blogDAO {

    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    public ArrayList<Blog> getPagingBlogList(int a, String search, String categoryBlogId) {
        ArrayList<Blog> bloglist = new ArrayList<>();
        if ((search == null && categoryBlogId == null) || (search == "" && categoryBlogId == "")) {
            String query = "select b.*, cb.categoryBlog_name from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id \n"
                    + "order by b.blog_id\n"
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
        } else if ((search != null && categoryBlogId == null) || (search != "" && categoryBlogId == "")) {
            String query = "select b.*, cb.categoryBlog_name from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id  where b.title like ?\n"
                    + "order by b.blog_id\n"
                    + "OFFSET ? rows fetch next 15 rows only";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setString(1, "%" + search + "%");
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
        } else if (search != "" && categoryBlogId != "") {
            String query = "select b.*, cb.categoryBlog_name from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id  where b.categoryBlog_id = ? and b.title like ?\n"
                    + "order by b.blog_id\n"
                    + "OFFSET ? rows fetch next 15 rows only";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setString(1, categoryBlogId);
                stm.setString(2, "%" + search + "%");
                stm.setInt(3, (a - 1) * 15);
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
        } else if ((search == "" && categoryBlogId != "")) {
            String query = "select b.*, cb.categoryBlog_name from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id  where b.categoryBlog_id = ?\n"
                    + "order by b.blog_id\n"
                    + "OFFSET ? rows fetch next 15 rows only";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setString(1, categoryBlogId);
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
        }
        return bloglist;
    }
// blog list manage

    public int getAllNumBlog(String search, String categoryBlog_id) {
        if ((search == null && categoryBlog_id == null) || (search == "" && categoryBlog_id == "") || (search == "" && categoryBlog_id == null)) {
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
        } else if ((search != "" && categoryBlog_id == "")) {
            String query = "select count(*) from Blog where title = ?";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setString(1, search);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }

            } catch (Exception e) {
            }
        } else if ((search == "" && categoryBlog_id != null)) {
            String query = "select count(*) from Blog where categoryBlog_id = ?";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setString(1, categoryBlog_id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }

            } catch (Exception e) {
            }
        } else if ((search != "" && categoryBlog_id != "")) {
            String query = "select count(*) from Blog where categoryBlog_id = ? and title = ?";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setString(1, categoryBlog_id);
                stm.setString(2, search);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }

            } catch (Exception e) {
            }
        }
        return 0;

    }

    public int getNumBlog(String cateId, String s) {
        if (cateId == null && s == null) {
            String query = "select count(*) from Blog where status = 1";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);

                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }

            } catch (Exception e) {
            }
        } else if (cateId != null && s == null) {
            String query = "select count(*) from Blog where status = 1 and categoryBlog_id = ?";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setString(1, cateId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }

            } catch (Exception e) {
            }
        } else if (cateId == null && s != null) {
            String query = "select count(*) from Blog where status = 1 and title like ? or content like ? or brief_infor like ?";
            try {
                cnn = new DBContext().getConnection();//mo ket noi voi sql
                stm = cnn.prepareStatement(query);
                stm.setString(1, "%" + s + "%");
                stm.setString(2, "%" + s + "%");
                stm.setString(3, "%" + s + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }

            } catch (Exception e) {
            }
        }
        return 0;

    }

    public ArrayList<categoryBlog> getCateBlog() {
        ArrayList<categoryBlog> list = new ArrayList<>();
        String query = "select * from Category_blog";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                categoryBlog b = new categoryBlog(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        String.valueOf(rs.getBoolean(3)));
                list.add(b);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<categoryBlog> getCateBlogAndNumBlog() {
        ArrayList<categoryBlog> list = new ArrayList<>();
        String query = "select cb.categoryBlog_id,cb.categoryBlog_name, count(b.blog_id) as numBlog from Category_blog cb join Blog b on b.categoryBlog_id = cb.categoryBlog_id where b.status=1 \n"
                + "group by cb.categoryBlog_id, cb.categoryBlog_name";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                categoryBlog b = new categoryBlog(String.valueOf(rs.getInt(1)),
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
            query = "select b.*, cb.categoryBlog_name, a.fullName from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id join Admin a on a.userId = b.author_id where b.status=1 \n"
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
                            rs.getString(11),
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
            query = "select b.*, cb.categoryBlog_name, a.fullName from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id join Admin a on a.userId = b.author_id where b.status=1 and b.categoryBlog_id = ? \n"
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
                            rs.getString(11),
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
            query = "SELECT b.*, cb.categoryBlog_name, a.fullName FROM Blog b JOIN Category_blog cb ON b.categoryBlog_id = cb.categoryBlog_id join Admin a on a.userId = b.author_id WHERE b.status = 1 and (b.title like ? or b.content like ? or b.brief_infor like ?) \n"
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
                            rs.getString(11),
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
        blogDAO b = new blogDAO();
        System.out.println(b.getCateBlog());
    }

    public void addNewBlog(String title, String author_id, String content, String thumbnail, String brief_infor, String categoryBlog_id, String status) {
        String query = "insert into Blog(title, author_id, content, thumbnail, brief_infor, categoryBlog_id, status) values (?, ?, ?, ?, ?, ?, ?)";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, title);
            stm.setString(2, author_id);
            stm.setString(3, content);
            stm.setString(4, thumbnail);
            stm.setString(5, brief_infor);
            stm.setString(6, categoryBlog_id);
            stm.setString(7, status);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public Blog getBlogById(String blogId) {
        String query = "select b.*, cb.categoryBlog_name, a.fullName from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id join Admin a on a.userId = b.author_id where blog_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, blogId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Blog(String.valueOf(rs.getInt(1)), rs.getString(2), rs.getString(11), String.valueOf(rs.getDate(4)), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(10), String.valueOf(rs.getBoolean(9)));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Blog> getBlogList() {
        ArrayList<Blog> bloglist = new ArrayList<>();
        String query = "select b.*, cb.categoryBlog_name, a.fullName from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id join Admin a on a.userId = b.author_id ";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(11),
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

    public List<Chart> getChartBlogBar(String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String query = "select count(*) from Blog where updated_date = DATEADD(DAY, ?, ?)";
            try {
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                rs = stm.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                query = "select  DATEADD(DAY, ?, ?)";
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (Exception e) {
                System.out.println(e);
            }
        }

        return list;
    }

    public List<Chart> getChartBlogArea(String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String query = "select count(*) from Blog where updated_date <= DATEADD(DAY, ?, ?)";
            try {
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                rs = stm.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                query = "select  DATEADD(DAY, ?, ?)";
                cnn = new DBContext().getConnection();
                stm = cnn.prepareStatement(query);
                stm.setInt(1, i);
                stm.setString(2, start);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (Exception e) {
                System.out.println(e);
            }
        }

        return list;
    }

    public void editBlog(String id, String title, String content, String fileName, String brief_infor, String categoryId, String status) {
        String query = "UPDATE Blog\n"
                + "                SET title = ?, content = ?, thumbnail = ?, brief_infor = ?, categoryBlog_id = ?, status= ?\n"
                + "                WHERE blog_id = ?;";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, title);
            stm.setString(2, content);
            stm.setString(3, fileName);
            stm.setString(4, brief_infor);
            stm.setString(5, categoryId);
            stm.setString(6, status);
            stm.setString(7, id);
            rs = stm.executeQuery();
        } catch (Exception e) {
        }
    }

    public void changeBlogStatus(String blogId, String newStatus) {
        String query = "UPDATE Blog\n"
                + "SET status = ?\n"
                + "WHERE blog_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, newStatus);
            stm.setString(2, blogId);
            rs = stm.executeQuery();

        } catch (Exception e) {
        }
    }

    public String getCateBlogIdById(String blogId) {
        String query = "select categoryBlog_id from Blog where blog_id = ?";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, blogId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }

        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Blog> getRelateBlogList(String cateId) {
        ArrayList<Blog> bloglist = new ArrayList<>();
        String query = null;
        query = "select TOP 5 b.*, cb.categoryBlog_name, a.fullName from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id join Admin a on a.userId = b.author_id where b.status=1 and b.categoryBlog_id = ?\n"
                + "order by b.updated_date desc";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            stm.setString(1, cateId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(11),
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

    public ArrayList<Blog> getBlogListToExport() {
        ArrayList<Blog> bloglist = new ArrayList<>();
        String query = "select b.*, cb.categoryBlog_name, a.fullName from Blog b join Category_blog cb on b.categoryBlog_id = cb.categoryBlog_id join Admin a on a.userId = b.author_id \n"
                + "              order by b.blog_id";
        try {
            cnn = new DBContext().getConnection();//mo ket noi voi sql
            stm = cnn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(String.valueOf(rs.getInt(1)),
                        rs.getString(2),
                        rs.getString(11),
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
