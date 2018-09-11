/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kietpt.dto;

import java.util.Date;

/**
 *
 * @author Trung Nguyen
 */
public class Error_UserDTO {
    private String errorUserId,errorPass,errorFullname,errorPhone,errorAddr,errorMail;
    private String errorDob;
    int errorRole,errorStatus;

    public Error_UserDTO(String errorUserId, String errorPass, String errorFullname, String errorPhone, String errorAddr, String errorMail, String errorDob, int errorRole, int errorStatus) {
        this.errorUserId = errorUserId;
        this.errorPass = errorPass;
        this.errorFullname = errorFullname;
        this.errorPhone = errorPhone;
        this.errorAddr = errorAddr;
        this.errorMail = errorMail;
        this.errorDob = errorDob;
        this.errorRole = errorRole;
        this.errorStatus = errorStatus;
    }

    public Error_UserDTO() {
    }

    public String getErrorUserId() {
        return errorUserId;
    }

    public void setErrorUserId(String errorUserId) {
        this.errorUserId = errorUserId;
    }

    public String getErrorPass() {
        return errorPass;
    }

    public void setErrorPass(String errorPass) {
        this.errorPass = errorPass;
    }

    public String getErrorFullname() {
        return errorFullname;
    }

    public void setErrorFullname(String errorFullname) {
        this.errorFullname = errorFullname;
    }

    public String getErrorPhone() {
        return errorPhone;
    }

    public void setErrorPhone(String errorPhone) {
        this.errorPhone = errorPhone;
    }

    public String getErrorAddr() {
        return errorAddr;
    }

    public void setErrorAddr(String errorAddr) {
        this.errorAddr = errorAddr;
    }

    public String getErrorMail() {
        return errorMail;
    }

    public void setErrorMail(String errorMail) {
        this.errorMail = errorMail;
    }

    public String getErrorDob() {
        return errorDob;
    }

    public void setErrorDob(String errorDob) {
        this.errorDob = errorDob;
    }

    public int getErrorRole() {
        return errorRole;
    }

    public void setErrorRole(int errorRole) {
        this.errorRole = errorRole;
    }

    public int getErrorStatus() {
        return errorStatus;
    }

    public void setErrorStatus(int errorStatus) {
        this.errorStatus = errorStatus;
    }
    
    
}
