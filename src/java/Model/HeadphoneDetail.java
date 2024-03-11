/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class HeadphoneDetail {

    public String connect,
            headphone_detail_id,
            color,
            using_time,
            sound_tech,
            micro,
            control_method,
            waterproof,
            product_id,
            other_feature;

    public HeadphoneDetail() {
    }

    public HeadphoneDetail(String connect, String headphone_detail_id, String color, String using_time, String sound_tech, String micro, String control_method, String waterproof, String product_id, String other_feature) {
        this.connect = connect;
        this.headphone_detail_id = headphone_detail_id;
        this.color = color;
        this.using_time = using_time;
        this.sound_tech = sound_tech;
        this.micro = micro;
        this.control_method = control_method;
        this.waterproof = waterproof;
        this.product_id = product_id;
        this.other_feature = other_feature;
    }

    public String getConnect() {
        return connect;
    }

    public void setConnect(String connect) {
        this.connect = connect;
    }

    public String getHeadphone_detail_id() {
        return headphone_detail_id;
    }

    public void setHeadphone_detail_id(String headphone_detail_id) {
        this.headphone_detail_id = headphone_detail_id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getUsing_time() {
        return using_time;
    }

    public void setUsing_time(String using_time) {
        this.using_time = using_time;
    }

    public String getSound_tech() {
        return sound_tech;
    }

    public void setSound_tech(String sound_tech) {
        this.sound_tech = sound_tech;
    }

    public String getMicro() {
        return micro;
    }

    public void setMicro(String micro) {
        this.micro = micro;
    }

    public String getControl_method() {
        return control_method;
    }

    public void setControl_method(String control_method) {
        this.control_method = control_method;
    }

    public String getWaterproof() {
        return waterproof;
    }

    public void setWaterproof(String waterproof) {
        this.waterproof = waterproof;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getOther_feature() {
        return other_feature;
    }

    public void setOther_feature(String other_feature) {
        this.other_feature = other_feature;
    }
    
}
