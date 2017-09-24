package com.app.bean.vm;

public class VMMovieInfo {

    private String txtTitle = "";
    private int ddlStatus = 0;
    private String txtDirector = "";
    private String txtCasts = "";
    private String txtReleaseDate = "";
    private String ddlLanguage = "";
    private String ddlIndustry = "";

    public String getTxtTitle() {
        return txtTitle;
    }

    public void setTxtTitle(String txtTitle) {
        this.txtTitle = txtTitle;
    }

    public int getDdlStatus() {
        return ddlStatus;
    }

    public void setDdlStatus(int ddlStatus) {
        this.ddlStatus = ddlStatus;
    }

    public String getTxtDirector() {
        return txtDirector;
    }

    public void setTxtDirector(String txtDirector) {
        this.txtDirector = txtDirector;
    }

    public String getTxtCasts() {
        return txtCasts;
    }

    public void setTxtCasts(String txtCasts) {
        this.txtCasts = txtCasts;
    }

    public String getTxtReleaseDate() {
        return txtReleaseDate;
    }

    public void setTxtReleaseDate(String txtReleaseDate) {
        this.txtReleaseDate = txtReleaseDate;
    }

    public String getDdlLanguage() {
        return ddlLanguage;
    }

    public void setDdlLanguage(String ddlLanguage) {
        this.ddlLanguage = ddlLanguage;
    }

    public String getDdlIndustry() {
        return ddlIndustry;
    }

    public void setDdlIndustry(String ddlIndustry) {
        this.ddlIndustry = ddlIndustry;
    }
}
