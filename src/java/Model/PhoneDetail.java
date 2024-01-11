/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class phoneDetail {

    private String phone_detail_id,
            color,
            screen_size,
            screen_tech,
            camera_rear,
            front_camera,
            chip,
            ram,
            rom,
            pin,
            sim,
            operation_system,
            screen_feature,
            product_id,
            other_feature;

    public phoneDetail() {
    }

    public phoneDetail(String phone_detail_id, String color, String screen_size, String screen_tech, String camera_rear, String front_camera, String chip, String ram, String rom, String pin, String sim, String operation_system, String screen_feature, String product_id, String other_feature) {
        this.phone_detail_id = phone_detail_id;
        this.color = color;
        this.screen_size = screen_size;
        this.screen_tech = screen_tech;
        this.camera_rear = camera_rear;
        this.front_camera = front_camera;
        this.chip = chip;
        this.ram = ram;
        this.rom = rom;
        this.pin = pin;
        this.sim = sim;
        this.operation_system = operation_system;
        this.screen_feature = screen_feature;
        this.product_id = product_id;
        this.other_feature = other_feature;
    }

    public String getPhone_detail_id() {
        return phone_detail_id;
    }

    public void setPhone_detail_id(String phone_detail_id) {
        this.phone_detail_id = phone_detail_id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getScreen_size() {
        return screen_size;
    }

    public void setScreen_size(String screen_size) {
        this.screen_size = screen_size;
    }

    public String getScreen_tech() {
        return screen_tech;
    }

    public void setScreen_tech(String screen_tech) {
        this.screen_tech = screen_tech;
    }

    public String getCamera_rear() {
        return camera_rear;
    }

    public void setCamera_rear(String camera_rear) {
        this.camera_rear = camera_rear;
    }

    public String getFront_camera() {
        return front_camera;
    }

    public void setFront_camera(String front_camera) {
        this.front_camera = front_camera;
    }

    public String getChip() {
        return chip;
    }

    public void setChip(String chip) {
        this.chip = chip;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getRom() {
        return rom;
    }

    public void setRom(String rom) {
        this.rom = rom;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getSim() {
        return sim;
    }

    public void setSim(String sim) {
        this.sim = sim;
    }

    public String getOperation_system() {
        return operation_system;
    }

    public void setOperation_system(String operation_system) {
        this.operation_system = operation_system;
    }

    public String getScreen_feature() {
        return screen_feature;
    }

    public void setScreen_feature(String screen_feature) {
        this.screen_feature = screen_feature;
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
