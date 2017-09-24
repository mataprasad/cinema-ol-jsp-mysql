package com.app.biz;

import com.app.bean.db.ShowDetail;
import java.util.List;

import com.app.bean.json.SelectListItem;
import com.app.bean.vm.VMBookTicket;
import com.app.bean.vm.VMManageShow;
import com.app.bean.vm.VMSelectShowPost;
import com.app.db.DbConfigHelper;
import com.app.db.DbShow;
import com.app.db.DbUser;
import com.app.util.DateHelper;

public class ShowService {

    DbConfigHelper dbConfig;
    DbShow dbShow;
    DbUser dbUser;

    public ShowService(DbConfigHelper dbConfig) {
        this.dbConfig = dbConfig;
        this.dbShow = new DbShow(dbConfig);
        this.dbUser = new DbUser(dbConfig);
    }

    public List<SelectListItem> fillDateList(String pMovieTitle) throws Exception {

        return this.dbShow.fillDateList(pMovieTitle);
    }

    public List<SelectListItem> fillTimeList(String pMovieTitle, String pMovieDate) throws Exception {

        return this.dbShow.fillTimeList(pMovieTitle, pMovieDate);
    }

    public boolean addShowInfo(VMManageShow obj) throws Exception {
        return this.dbShow.addShowInfo(obj);
    }

    public int getShowId(VMSelectShowPost obj) throws Exception {
        return this.dbShow.getShowId(obj);
    }

    public List<SelectListItem> getShowSeats(int show_id) throws Exception {
        return this.dbShow.getShowSeats(show_id);
    }

    public ShowDetail getShowDetail(int showId) throws Exception {
        return this.dbShow.getShowDetail(showId);
    }

    public VMBookTicket bookTicket(int userId, VMBookTicket obj) throws Exception {

        long ticketId = -1;
        ticketId = this.dbShow.addTicketInfo(userId, obj.getSheats().size(), DateHelper.FromDD_MM_YYYY(obj.getShow_Date()),
                obj.getShow_Time(), obj.getShow_Id(), "" + obj.getTotalCost(), DateHelper.DbNow());
        if (ticketId > -1) {
            this.dbShow.addTicketDetial(Integer.parseInt(obj.getShow_Id()), (int) ticketId, obj.getSheats());

            return this.dbUser.getBookingDetails(ticketId);
        }
        return null;
    }
}
