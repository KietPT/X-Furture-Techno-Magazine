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
public class PostDTO {

    private String content, collaborator, title, mainContent, symbolPic, moderator, categoryName,
            collaboratorName, moderatorName;
    private int cateId, status, postId, numberOfView, totalPost, totalView;

    public int getTotalView() {
        return totalView;
    }

    public void setTotalView(int totalView) {
        this.totalView = totalView;
    }

    public int getTotalPost() {
        return totalPost;
    }

    public PostDTO(String collaboratorName, int totalPost, int totalView) {
        this.collaboratorName = collaboratorName;
        this.totalPost = totalPost;
        this.totalView = totalView;
    }

    public void setTotalPost(int totalPost) {
        this.totalPost = totalPost;
    }
    Timestamp postedDate, publishedDate;

    public PostDTO(String content, String collaborator, String title, String mainContent, String symbolPic,
            int cateId, int status, int postId, Timestamp postedDate) {
        this.content = content;
        this.collaborator = collaborator;
        this.title = title;
        this.mainContent = mainContent;
        this.symbolPic = symbolPic;
        this.cateId = cateId;
        this.status = status;
        this.postId = postId;
        this.postedDate = postedDate;
    }

    public PostDTO(String content, String collaborator, String title, String mainContent, String symbolPic,
            int cateId, int status, Timestamp postedDate, Timestamp publishedDate, int view) {
        this.content = content;
        this.collaborator = collaborator;
        this.title = title;
        this.mainContent = mainContent;
        this.symbolPic = symbolPic;
        this.cateId = cateId;
        this.status = status;
        this.postedDate = postedDate;
        this.publishedDate = publishedDate;
        this.numberOfView = view;
    }

    public PostDTO(String content, String collaborator, String title, String mainContent, String symbolPic,
            String categoryName, String collaboratorName, int cateId, int status, int postId,
            Timestamp postedDate, Timestamp publishedDate, int view) {
        this.content = content;
        this.collaborator = collaborator;
        this.title = title;
        this.mainContent = mainContent;
        this.symbolPic = symbolPic;
        this.categoryName = categoryName;
        this.collaboratorName = collaboratorName;
        this.cateId = cateId;
        this.status = status;
        this.postId = postId;
        this.postedDate = postedDate;
        this.publishedDate = publishedDate;
        this.numberOfView = view;
    }

    public int getNumberOfView() {
        return numberOfView;
    }

    public void setNumberOfView(int numberOfView) {
        this.numberOfView = numberOfView;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCollaboratorName() {
        return collaboratorName;
    }

    public void setCollaboratorName(String collaboratorName) {
        this.collaboratorName = collaboratorName;
    }

    public String getModeratorName() {
        return moderatorName;
    }

    public void setModeratorName(String moderatorName) {
        this.moderatorName = moderatorName;
    }

    public PostDTO() {
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCollaborator() {
        return collaborator;
    }

    public void setCollaborator(String collaborator) {
        this.collaborator = collaborator;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMainContent() {
        return mainContent;
    }

    public void setMainContent(String mainContent) {
        this.mainContent = mainContent;
    }

    public String getSymbolPic() {
        return symbolPic;
    }

    public void setSymbolPic(String symbolPic) {
        this.symbolPic = symbolPic;
    }

    public String getModerator() {
        return moderator;
    }

    public void setModerator(String moderator) {
        this.moderator = moderator;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public Timestamp getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(Timestamp postedDate) {
        this.postedDate = postedDate;
    }

    public Timestamp getPublishedDate() {
        return publishedDate;
    }

    public void setPublishedDate(Timestamp publishedDate) {
        this.publishedDate = publishedDate;
    }

}
