/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kietpt.dto;

import java.sql.Timestamp;

/**
 *
 * @author KietPT
 */
public class CommentDTO {
    int idComment,postId;
    String contentOfCmt,userId,fullname;
    boolean status;
    Timestamp timeOfCmt;

    public CommentDTO(int idComment, int postId, String contentOfCmt, String userId, String fullname, boolean status, Timestamp timeOfCmt) {
        this.idComment = idComment;
        this.postId = postId;
        this.contentOfCmt = contentOfCmt;
        this.userId = userId;
        this.fullname = fullname;
        this.status = status;
        this.timeOfCmt = timeOfCmt;
    }

    public CommentDTO() {
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    

    public Timestamp getTimeOfCmt() {
        return timeOfCmt;
    }

    public void setTimeOfCmt(Timestamp timeOfCmt) {
        this.timeOfCmt = timeOfCmt;
    }

    public int getIdComment() {
        return idComment;
    }

    public void setIdComment(int idComment) {
        this.idComment = idComment;
    }

    

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getContentOfCmt() {
        return contentOfCmt;
    }

    public void setContentOfCmt(String contentOfCmt) {
        this.contentOfCmt = contentOfCmt;
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
    
}
