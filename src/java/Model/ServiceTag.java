/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class ServiceTag {

    String service_tag_id,
            product_id,
            service_tag,
            status;

    public ServiceTag() {
    }

    public ServiceTag(String service_tag_id, String product_id, String service_tag, String status) {
        this.service_tag_id = service_tag_id;
        this.product_id = product_id;
        this.service_tag = service_tag;
        this.status = status;
    }

    public String getService_tag_id() {
        return service_tag_id;
    }

    public void setService_tag_id(String service_tag_id) {
        this.service_tag_id = service_tag_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getService_tag() {
        return service_tag;
    }

    public void setService_tag(String service_tag) {
        this.service_tag = service_tag;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
