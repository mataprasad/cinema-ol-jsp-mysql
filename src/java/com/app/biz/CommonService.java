package com.app.biz;

import java.util.List;

import org.joda.time.DateTime;

import com.app.bean.json.PingResponse;
import com.app.bean.json.SelectListItem;
import com.app.db.DbCommon;
import com.app.db.DbConfigHelper;

public class CommonService {

    DbConfigHelper dbConfig;
    DbCommon dbCommon = null;

    public CommonService(DbConfigHelper dbConfig) {
        this.dbConfig = dbConfig;
        this.dbCommon = new DbCommon(dbConfig);
    }

    public PingResponse getPingResponse() {
        PingResponse ping = new PingResponse();
        ping.setDateIsoString(new DateTime().toMutableDateTimeISO().toString());
        return ping;
    }    

    public List<SelectListItem> getAllStates() throws Exception {
        return this.dbCommon.getAllStates();
    }

    public List<SelectListItem> getHallList() throws Exception {
        return this.dbCommon.getHallList();
    }

    public List<SelectListItem> getTimeList() throws Exception {
        return this.dbCommon.getTimeList();
    }    

    public List<SelectListItem> getStatusList() throws Exception {
        return this.dbCommon.getStatusList();
    }

    public List<SelectListItem> getLanguageList() throws Exception {
        return this.dbCommon.getLanguageList();
    }

    public List<SelectListItem> getIndustryList() throws Exception {
        return this.dbCommon.getIndustryList();
    }
}
