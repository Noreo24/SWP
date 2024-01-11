/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class trademark {

    private String trademark_id,
            trademark_name,
            status;

    public trademark() {
    }

    public trademark(String trademark_id, String trademark_name, String status) {
        this.trademark_id = trademark_id;
        this.trademark_name = trademark_name;
        this.status = status;
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
    
}
