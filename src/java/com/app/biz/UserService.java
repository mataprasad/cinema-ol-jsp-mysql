package com.app.biz;

import java.util.List;

import com.app.bean.db.UserInfo;
import com.app.bean.vm.VMBookTicket;
import com.app.bean.vm.VMBookingHistory;
import com.app.bean.vm.VMLogin;
import com.app.bean.vm.VMRegister;
import com.app.db.DbConfigHelper;
import com.app.db.DbUser;
import com.app.util.Constant;

public class UserService {

    DbConfigHelper dbConfig;
    DbUser dbUser;

    public UserService(DbConfigHelper dbConfig) {
        this.dbConfig = dbConfig;
        this.dbUser = new DbUser(dbConfig);
    }

    public UserInfo doUserLogin(VMLogin obj, boolean forAdmin) throws Exception {
        return this.dbUser.doUserLogin(obj, forAdmin);
    }

    public List<VMBookingHistory> getBookingHistory(int userId, int pageSize, int pageNo) throws Exception {
        return this.dbUser.getBookingHistory(userId, pageSize, pageNo);
    }

    public boolean registerUser(VMRegister obj) throws Exception {
        if (this.dbUser.isUserExists(obj.getTxtUName())) {
            throw new Exception(Constant.ErrorMessages.USER_ALREADY_EXITS);
        }
        return this.dbUser.registerUser(obj);
    }

    public boolean changePassword(UserInfo obj,boolean withUserName) throws Exception {
        return this.dbUser.changePassword(obj,withUserName);
    }

    public VMBookTicket getBookingDetails(long id) throws Exception {
        return this.dbUser.getBookingDetails(id);
    }
    
    public boolean updateUser(UserInfo obj) throws Exception {
        return this.dbUser.updateUser(obj);
    }
    
    public boolean isUserExists(String txtUName) throws Exception {
        return this.dbUser.isUserExists(txtUName);
    }
    
    public UserInfo getUser(String userName) throws Exception {
        return this.dbUser.getUser(userName);
    }
}
