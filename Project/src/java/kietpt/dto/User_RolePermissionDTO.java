/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kietpt.dto;

import java.io.Serializable;

/**
 *
 * @author MyPC
 */
public class User_RolePermissionDTO implements Serializable {

    private String userId, fullname, rolename;
    private int statusId;

    public User_RolePermissionDTO() {
    }

    public User_RolePermissionDTO(String userId, String fullname, String rolename, int statusId) {
        this.userId = userId;
        this.fullname = fullname;
        this.rolename = rolename;
        this.statusId = statusId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }
}
