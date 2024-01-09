/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Trademark extends DBContext {


    private String trademark_id,
            trademark_name,
            status;

    public Trademark() {
        connectDB();
    }

    public Trademark(String trademark_id, String trademark_name, String status) {
        this.trademark_id = trademark_id;
        this.trademark_name = trademark_name;
        this.status = status;
        connectDB();
    }

    public String getTrademark_id() {
        return trademark_id;
    }

    public void setTrademark_id(String trademark_id) {
        this.trademark_id = trademark_id;
    }

    public String getTrademark_name() {
        return trademark_name;
    }

    public void setTrademark_name(String trademark_name) {
        this.trademark_name = trademark_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    //Khai báo các thành phần xủ lý DB
    Connection cnn;//Kết nối với DB
    //Statement stm;//Thực hiện câu lệnh SQL: select,insert,update,delete
    PreparedStatement stm;
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    private void connectDB() {
        //cnn=(new DBContext()).connection;
        cnn = connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Connect fail");
        }
    }
    
    public ArrayList<Trademark> getAllTrademarks() {
        ArrayList<Trademark> data=new ArrayList<>();
        try {
            String strSQL="select * from Trademark";
            stm=cnn.prepareStatement(strSQL);
            rs=stm.executeQuery();
            while(rs.next()){
                String trademarkId=String.valueOf(rs.getInt(1));
                String trademarkName=rs.getString(2);
                String tstatus = String.valueOf(rs.getBoolean(3));
                Trademark t = new Trademark(trademarkId, trademarkName, tstatus);
                data.add(t);
            }
        } catch (Exception e) {
            System.out.println("getListTrademark:"+e.getMessage());
        }
        return data;
    }
}
