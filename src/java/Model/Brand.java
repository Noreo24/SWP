/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author buiph
 */
public class Brand {

    private int id;
    private String name, img, des;

    private ArrayList<Product> list = new ArrayList<>();

    public Brand() {
    }

    public Brand(int id, String name, String img, String des) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.des = des;
    }

    public Brand(int id, String name, String img, String des, ArrayList<Product> products) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.des = des;
        this.list = products;
    }

    public ArrayList<Product> getList() {
        return list;
    }

    public void setList(ArrayList<Product> list) {
        this.list = list;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

}
