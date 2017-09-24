package com.app.bean.vm;

import com.app.bean.json.SelectListItem;
import com.app.util.DateHelper;
import java.util.*;

public class VMBookTicket {

    private String Ticket_No = "";
    private String Booking_Date = "";
    private String Show_Date = "";
    private String Show_Time = "";
    private String Movie_Name = "";
    private String Ticket_Id = "";
    private String Hall_No = "";
    private String Show_Id = "";
    private String chkSheats = "";
    private String SheatsLayout = "";
    private List<SelectListItem> Sheats = new ArrayList<SelectListItem>();

    public String getTicket_No() {
        return Ticket_No;
    }

    public void setTicket_No(String Ticket_No) {
        this.Ticket_No = Ticket_No;
    }

    public String getBooking_Date() {
        return DateHelper.ToDD_MMM_YYYY(DateHelper.FromDD_MM_YYYY(this.Booking_Date));
    }

    public void setBooking_Date(String Booking_Date) {
        this.Booking_Date = Booking_Date;
    }

    public String getShow_Date() {
        return DateHelper.ToDD_MMM_YYYY(DateHelper.FromDD_MM_YYYY(this.Show_Date));
    }

    public void setShow_Date(String Show_Date) {
        this.Show_Date = Show_Date;
    }

    public String getShow_Time() {
        return Show_Time;
    }

    public void setShow_Time(String Show_Time) {
        this.Show_Time = Show_Time;
    }

    public String getMovie_Name() {
        return Movie_Name;
    }

    public void setMovie_Name(String Movie_Name) {
        this.Movie_Name = Movie_Name;
    }

    public String getTicket_Id() {
        return Ticket_Id;
    }

    public void setTicket_Id(String Ticket_Id) {
        this.Ticket_Id = Ticket_Id;
    }

    public List<SelectListItem> getSheats() {
        return Sheats;
    }

    public void setSheats(List<SelectListItem> Sheats) {
        this.Sheats = Sheats;
    }

    public long getTotalCost() {
        long totalCost = 0;
        if (this.getSheats() != null && this.getSheats().size() > 0) {
            for (int i = 0; i < this.getSheats().size(); i++) {
                totalCost += Long.parseLong(this.getSheats().get(i).getValue());
            }
        }
        return totalCost;
    }

    public String getHall_No() {
        return Hall_No;
    }

    public void setHall_No(String Hall_No) {
        this.Hall_No = Hall_No;
    }

    public String getShow_Id() {
        return Show_Id;
    }

    public void setShow_Id(String Show_Id) {
        this.Show_Id = Show_Id;
    }

    public String getChkSheats() {
        return chkSheats;
    }

    public void setChkSheats(String chkSheats) {
        this.chkSheats = chkSheats;
    }

    public String getSheatsLayout() {
        return SheatsLayout;
    }

    public void setSheatsLayout(String SheatsLayout) {
        this.SheatsLayout = SheatsLayout;
    }
}
