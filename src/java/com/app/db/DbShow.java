package com.app.db;

import com.app.bean.db.ShowDetail;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.app.bean.json.SelectListItem;
import com.app.bean.vm.VMManageShow;
import com.app.bean.vm.VMSelectShowPost;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public class DbShow {

    private DbConfigHelper dbConfig = null;

    public DbShow(DbConfigHelper dbConfig) {
        this.dbConfig = dbConfig;
    }

    public List<SelectListItem> fillDateList(String pMovieTitle) throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query(
                    "SELECT distinct  DATE_FORMAT(Show_Date, '%d/%m/%Y') as text, DATE_FORMAT(Show_Date, '%d/%m/%Y')  as value FROM ShowInfo WHERE Show_Date>=NOW() and Movie_Name=?;",
                    h, pMovieTitle);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<SelectListItem> fillTimeList(String pMovieTitle, String pMovieDate) throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query(
                    "SELECT distinct Show_StartTime as text,Show_StartTime as value FROM ShowInfo WHERE DATE_FORMAT(Show_Date, '%d/%m/%Y')=? and Movie_Name=?;", h, pMovieDate,
                    pMovieTitle);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean addShowInfo(VMManageShow obj) throws Exception {
        try {
            String sql = "INSERT INTO ShowInfo (Show_Date,Show_StartTime,Movie_Name,Hall_No)VALUES"
                    + "(?,?,?,?)";

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            int result = run.update(sql,
                    obj.getDatepickerDate(),
                    obj.getDdlTime(),
                    obj.getDdlMovie(),
                    obj.getDdlHall()
            );

            return result > 0;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public ShowDetail getShowDetail(int showId) throws Exception {
        try {
            String sql = "select s.Show_Id,DATE_FORMAT(Show_Date, '%d/%m/%Y') AS Show_Date, "
                    + "s.Show_StartTime,s.Movie_Name,(select h.Hall_No from HallInfo h "
                    + "where Hall_Id=s.Hall_No) As Hall_No  from ShowInfo s where s.Show_Id=?";

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<ShowDetail> h = new BeanHandler<ShowDetail>(ShowDetail.class);

            ShowDetail data = run.query(sql, h, showId);

            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public int getShowId(VMSelectShowPost obj) throws Exception {
        try {
            String sql = "select Show_Id from ShowInfo "
                    + "                        where DATE_FORMAT(Show_Date, '%d/%m/%Y')=? "
                    + "                        and Movie_Name=? and Show_StartTime=?";

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<Object> h = new ScalarHandler<Object>("Show_Id");

            Object data = run.query(
                    sql,
                    h, obj.getDdlShowDate(), obj.getDdlShowMovie(), obj.getDdlShowTime());
            if (data == null) {
                data = "-1";
            }
            return Integer.parseInt(data.toString());
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<SelectListItem> getShowSeats(int show_id) throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            String sql = "select Sheat_No as text from TicketDetail where Show_Id=?;";

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query(sql, h, show_id);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public long addTicketInfo(int userId, int sheatsCount, String showDate, String showTime, String showId, String totalCost, String bookingDate)
            throws Exception {
        try {
            String sql = ""
                    + "INSERT INTO TicketInfo "
                    + "(Ticket_No,User_Id,Show_Date,Show_Time,Show_Id,Ticket_Amount,IsPaid,Sheats_Count,Booking_Date) "
                    + "VALUES(?,?,STR_TO_DATE(?,'%d-%M-%Y'),?,?,?,0,?,now()); ";

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<String> h = new ScalarHandler<String>("col");

            String tNo = run.query("SELECT CONVERT(ifnull(max(Ticket_no),0)+1,CHAR(100)) as col from TicketInfo;", h);

            run.update(sql,
                    tNo,
                    userId,
                    showDate,
                    showTime,
                    showId,
                    totalCost,
                    sheatsCount
            );

            String tId = run.query("SELECT CONVERT(LAST_INSERT_ID(),CHAR(100))  as col", h);
            return Long.parseLong(tId);
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean addTicketDetial(int showId, int ticketId, List<SelectListItem> selectSheats) throws Exception {
        try {
            String sql = "";
            for (SelectListItem item : selectSheats) {
                sql += "INSERT INTO TicketDetail (Ticket_id,Sheat_No,Sheat_Cost,Show_Id) VALUES ('" + ticketId + "','" + item.getText() + "','" + item.getValue() + "','" + showId + "');";
            }

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            int result = run.update(sql);

            return result > 0;
        } catch (Exception ex) {
            throw ex;
        }
    }

}
