package com.app.bean.vm;

import com.app.util.DateHelper;

public class VMManageShow {

    private String ddlHall = "";
    private String datepicker = "";
    private String ddlTime = "";
    private String ddlMovie = "";

    public String getDdlHall() {
        return ddlHall;
    }

    public void setDdlHall(String ddlHall) {
        this.ddlHall = ddlHall;
    }

    public String getDatepicker() {
        return datepicker;
    }

    public String getDatepickerDate() {
        return DateHelper.FromDD_MM_YYYY(datepicker);
    }

    public void setDatepicker(String datepicker) {
        this.datepicker = datepicker;
    }

    public String getDdlTime() {
        return ddlTime;
    }

    public void setDdlTime(String ddlTime) {
        this.ddlTime = ddlTime;
    }

    public String getDdlMovie() {
        return ddlMovie;
    }

    public void setDdlMovie(String ddlMovie) {
        this.ddlMovie = ddlMovie;
    }

}
