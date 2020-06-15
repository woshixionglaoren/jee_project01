package com.jee.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
    private Integer id;

    private Integer articleId;

    private String commentUsername;

    private Date commentDate;

    private String commentContent;

    public Comment(Integer id, Integer articleId, String commentUsername, Date commentDate, String commentContent) {
        this.id = id;
        this.articleId = articleId;
        this.commentUsername = commentUsername;
        this.commentDate = commentDate;
        this.commentContent = commentContent;
    }

    public Comment() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getCommentUsername() {
        return commentUsername;
    }

    public void setCommentUsername(String commentUsername) {
        this.commentUsername = commentUsername == null ? null : commentUsername.trim();
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public String getLocalTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd HH:mm");//设置日期格式
        String date = df.format(commentDate);
        return date;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }
}