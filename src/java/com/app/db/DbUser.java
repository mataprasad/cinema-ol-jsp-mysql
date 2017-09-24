package com.app.db;

import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.app.bean.db.UserInfo;
import com.app.bean.json.SelectListItem;
import com.app.bean.vm.VMBookTicket;
import com.app.bean.vm.VMBookingHistory;
import com.app.bean.vm.VMLogin;
import com.app.bean.vm.VMRegister;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public class DbUser {

    private DbConfigHelper dbConfig = null;

    public DbUser(DbConfigHelper dbConfig) {
        this.dbConfig = dbConfig;
    }

    public UserInfo doUserLogin(VMLogin obj, boolean forAdmin) throws Exception {
        try {
            String user_type = "USER";
            if (forAdmin) {
                user_type = "ADMIN";
            }
            obj.setTxtLoginId(obj.getTxtLoginId().trim().toLowerCase());

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<UserInfo> h = new BeanHandler<UserInfo>(UserInfo.class);

            UserInfo data = run.query(
                    "select User_Id,User_LoginName,User_LoginPassword,User_Email,User_MobileNo,User_FName,User_LName,User_Add,User_City,User_State,User_SQ,User_SA,User_Type,User_IsActive from UserInfo where User_LoginName=? and User_LoginPassword=? and User_IsActive=1 and User_Type=?;",
                    h, obj.getTxtLoginId(), obj.getTxtLoginPass(), user_type);

            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public UserInfo getUser(String userName) throws Exception {
        try {
            String user_type = "USER";
            userName = userName.trim().toLowerCase();

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<UserInfo> h = new BeanHandler<UserInfo>(UserInfo.class);

            UserInfo data = run.query(
                    "select User_Id,User_LoginName,User_LoginPassword,User_Email,User_MobileNo,User_FName,User_LName,User_Add,User_City,User_State,User_SQ,User_SA,User_Type,User_IsActive from UserInfo where User_LoginName=? and User_IsActive=1 and User_Type=?;",
                    h, userName, user_type);

            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<VMBookingHistory> getBookingHistory(int userId, int pageSize, int pageNo) throws Exception {
        try {
            int min = ((pageNo - 1) * pageSize) + 1;
            int max = min + (pageSize - 1);
            String sql = "CALL usp_get_booking_history(?,?,?);";

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<List<VMBookingHistory>> h = new BeanListHandler<VMBookingHistory>(VMBookingHistory.class);

            List<VMBookingHistory> data = run.query(sql, h, userId, min, max);

            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean isUserExists(String txtUName) throws Exception {
        try {
            String sql = "select 1 as col from UserInfo where User_LoginName=? and User_Type='USER'";
            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<Object> h = new ScalarHandler<Object>("col");

            Object data = run.query(
                    sql,
                    h, txtUName);
            return data != null;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean registerUser(VMRegister obj) throws Exception {
        try {
            obj.setTxtUName(obj.getTxtUName().trim().toLowerCase());
            String sql
                    = "INSERT INTO UserInfo (User_LoginName,User_LoginPassword,User_Email,User_MobileNo,User_FName,"
                    + "User_LName,User_Add,User_City,User_State,User_SQ,User_SA,User_Type,User_IsActive)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            int result = run.update(sql,
                    obj.getTxtUName(),
                    obj.getTxtRePass(),
                    obj.getTxtEmail(),
                    obj.getTxtMobile(),
                    obj.getTxtFName(),
                    obj.getTxtLName(),
                    obj.getTxtAdd1() + " " + obj.getTxtAdd2(),
                    obj.getTxtCity(),
                    obj.getDdlState(),
                    obj.getTxtSQ(),
                    obj.getTxtSA(), "USER", 1
            );

            return result > 0;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean changePassword(UserInfo obj, boolean withUserName) throws Exception {
        try {

            String sql = "update UserInfo set User_LoginPassword=? where User_Id=?;";
            String userId = "" + obj.getUser_Id();
            
            if (withUserName) {
                userId = obj.getUser_LoginName();
                sql = "update UserInfo set User_LoginPassword=? where User_LoginName=? AND user_type='USER';";
            }

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            int result = run.update(sql,
                    obj.getUser_LoginPassword(),
                    userId
            );
            return result > 0;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public VMBookTicket getBookingDetails(long id) throws Exception {
        VMBookTicket data = new VMBookTicket();
        try {

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();
            QueryRunner run = new QueryRunner(dataSource, true);
            String sqlTicketInfo = ""
                    + "SELECT ShowInfo.Movie_Name,TicketInfo.Ticket_Id,TicketInfo.Ticket_No,TicketInfo.User_Id, "
                    + "TicketInfo.Show_Date as 'Show_Date' ,TicketInfo.Show_Time, "
                    + "TicketInfo.Booking_Date as 'Booking_Date' "
                    + "FROM TicketInfo INNER JOIN ShowInfo ON "
                    + "TicketInfo.Show_Id = ShowInfo.Show_Id where TicketInfo.Ticket_Id=?;";
            String sqlTicketDetail = "SELECT Sheat_No as text,Sheat_Cost as value,Ticket_id FROM TicketDetail where Ticket_id=?;";

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);
            ResultSetHandler<VMBookTicket> h1 = new BeanHandler<VMBookTicket>(VMBookTicket.class);

            List<SelectListItem> deatils = run.query(sqlTicketDetail, h, id);
            data = run.query(sqlTicketInfo, h1, id);
            if (data != null) {
                data.setSheats(deatils);
            }
        } catch (Exception e) {
        }
        return data;
    }

    public boolean updateUser(UserInfo obj) throws Exception {
        try {
            String sql = ""
                    + "Update UserInfo set User_Email=?,User_MobileNo=?,"
                    + "User_FName=?,User_LName=?,User_Add=?,"
                    + "User_City=?,User_State=?,User_SQ=?,User_SA=? "
                    + " where User_Id=?";

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            int result = run.update(sql,
                    obj.getUser_Email(),
                    obj.getUser_MobileNo(),
                    obj.getUser_FName(),
                    obj.getUser_LName(),
                    obj.getUser_Add(),
                    obj.getUser_City(),
                    obj.getUser_State(),
                    obj.getUser_SQ(),
                    obj.getUser_SA(),
                    obj.getUser_Id()
            );

            return result > 0;
        } catch (Exception ex) {
            throw ex;
        }
    }
}
