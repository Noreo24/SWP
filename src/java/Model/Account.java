/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author LanChau
 */
public class Account {

    private String userID,
            fullName,
            avatar,
            gender,
            email,
            user_name,
            password,
            phone,
            address,
            status, roleName;

    private int adminCreateId;

    private Account adminCreate;

    public Account() {
    }

    public Account(String adminId, String fullName, String avatar, String gender, String email, String user_name, String password, String phone, String address, String roleName) {
        this.userID = adminId;
        this.fullName = fullName;
        this.avatar = avatar;
        this.gender = gender;
        this.email = email;
        this.user_name = user_name;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.roleName = roleName;
    }

    public Account(String userId, String fullName, String avatar, String gender, String email, String password, String user_name, String phone, String address, String roleName, String status) {
        this.userID = userId;
        this.fullName = fullName;
        this.avatar = avatar;
        this.gender = gender;
        this.password = password;
        this.user_name = user_name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.roleName = roleName;
        this.status = status;
    }

    public int getAdminCreateId() {
        return adminCreateId;
    }

    public void setAdminCreateId(int adminCreateId) {
        this.adminCreateId = adminCreateId;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Account getAdminCreate() {
        return adminCreate;
    }

    public void setAdminCreate(Account adminCreate) {
        this.adminCreate = adminCreate;
    }

}
