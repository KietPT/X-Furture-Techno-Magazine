/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kietpt.dto;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author MyPC
 */
public class UsersDTO implements Serializable {

    private String userId, password, fullname, phone, address, mail;
    private int role, statusId;
    private boolean sex;
    private Timestamp birthday;

    public UsersDTO() {
    }

    public UsersDTO(String userId, String password, String fullname, String phone, String address, String mail, int role, int statusId, boolean sex, Timestamp birthday) {
        this.userId = userId;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.mail = mail;
        this.role = role;
        this.statusId = statusId;
        this.sex = sex;
        this.birthday = birthday;
    }

    public UsersDTO(String userId, String password, String fullname, String phone, String address, String mail, boolean sex, Timestamp birthday) {
        this.userId = userId;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.mail = mail;
        this.sex = sex;
        this.birthday = birthday;
    }

    public UsersDTO(String userId, String fullname, String phone, String address, String mail, int role, int statusId, boolean sex, Timestamp birthday) {
        this.userId = userId;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.mail = mail;
        this.role = role;
        this.statusId = statusId;
        this.sex = sex;
        this.birthday = birthday;
    }

    public UsersDTO(String userId, String fullname, String phone, String address, String mail, boolean sex, Timestamp birthday) {
        this.userId = userId;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.mail = mail;
        this.sex = sex;
        this.birthday = birthday;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public Timestamp getBirthday() {
        return birthday;
    }

    public void setBirthday(Timestamp birthday) {
        this.birthday = birthday;
    }
}
