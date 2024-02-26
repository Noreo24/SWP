/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class LaptopDetail {

    public String laptop_detail_id,
            color,
            screen_size,
            screen_tech,
            chip,
            ram,
            pin,
            operation_system,
            screen_feature,
            product_id,
            other_feature;

    public LaptopDetail() {
    }

    public LaptopDetail(String laptop_detail_id, String color, String screen_size, String screen_tech, String chip, String ram, String pin, String operation_system, String screen_feature, String product_id, String other_feature) {
        this.laptop_detail_id = laptop_detail_id;
        this.color = color;
        this.screen_size = screen_size;
        this.screen_tech = screen_tech;
        this.chip = chip;
        this.ram = ram;
        this.pin = pin;
        this.operation_system = operation_system;
        this.screen_feature = screen_feature;
        this.product_id = product_id;
        this.other_feature = other_feature;
    }

    public String getLaptop_detail_id() {
        return laptop_detail_id;
    }

    public void setLaptop_detail_id(String laptop_detail_id) {
        this.laptop_detail_id = laptop_detail_id;
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

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
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
