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
public class ErrorObject implements Serializable {

    String userPassError, duplicatedPK, accountBanned, oldPassword, searchError, fromtoError, oldNewError, equalError;

    public String getEqualError() {
        return equalError;
    }

    public void setEqualError(String equalError) {
        this.equalError = equalError;
    }

    public String getFromtoError() {
        return fromtoError;
    }

    public String getOldNewError() {
        return oldNewError;
    }

    public void setOldNewError(String oldNewError) {
        this.oldNewError = oldNewError;
    }

    public void setFromtoError(String fromtoError) {
        this.fromtoError = fromtoError;
    }

    public String getSearchError() {
        return searchError;
    }

    public void setSearchError(String searchError) {
        this.searchError = searchError;
    }
    String message;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getAccountBanned() {
        return accountBanned;
    }

    public void setAccountBanned(String accountBanned) {
        this.accountBanned = accountBanned;
    }

    public String getDuplicatedPK() {
        return duplicatedPK;
    }

    public void setDuplicatedPK(String duplicatedPK) {
        this.duplicatedPK = duplicatedPK;
    }

    public ErrorObject() {
    }

    public String getUserPassError() {
        return userPassError;
    }

    public void setUserPassError(String UserPassError) {
        this.userPassError = UserPassError;
    }

}
