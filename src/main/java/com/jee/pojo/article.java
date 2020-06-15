package com.jee.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class article {
    private Integer id;

    private Integer articleTypeid;

    private String articleTitle;

    private String articleContent;

    private Date articleSdtime;

    private String articleInfo;

    private Integer articleCount;

    private Integer articleMasterid;

    public article(Integer id, Integer articleTypeid, String articleTitle, String articleContent, Date articleSdtime, String articleInfo, Integer articleCount, Integer articleMasterid) {
        this.id = id;
        this.articleTypeid = articleTypeid;
        this.articleTitle = articleTitle;
        this.articleContent = articleContent;
        this.articleSdtime = articleSdtime;
        this.articleInfo = articleInfo;
        this.articleCount = articleCount;
        this.articleMasterid = articleMasterid;
    }

    public article() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getArticleTypeid() {
        return articleTypeid;
    }

    public void setArticleTypeid(Integer articleTypeid) {
        this.articleTypeid = articleTypeid;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }

    public Date getArticleSdtime() {
        return articleSdtime;
    }

    public String getLocalTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd HH:mm");//设置日期格式
        String date = df.format(articleSdtime);
        return date;
    }

    public void setArticleSdtime(Date articleSdtime) {
        this.articleSdtime = articleSdtime;
    }

    public String getArticleInfo() {
        return articleInfo;
    }

    public void setArticleInfo(String articleInfo) {
        this.articleInfo = articleInfo == null ? null : articleInfo.trim();
    }

    public Integer getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(Integer articleCount) {
        this.articleCount = articleCount;
    }

    public Integer getArticleMasterid() {
        return articleMasterid;
    }

    public void setArticleMasterid(Integer articleMasterid) {
        this.articleMasterid = articleMasterid;
    }
}