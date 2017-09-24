package com.app.db;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.app.bean.json.SelectListItem;

public class DbCommon {

    private DbConfigHelper dbConfig = null;

    public DbCommon(DbConfigHelper dbConfig) {
        this.dbConfig = dbConfig;
    }

    public List<SelectListItem> getAllStates() throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query(
                    "select UPPER(State_Name) as text,UPPER(State_Name) as value from StateInfo",
                    h);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<SelectListItem> getHallList() throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query("SELECT Hall_Id as value,Hall_No as text FROM HallInfo", h);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<SelectListItem> getTimeList() throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query("SELECT Time_StartTime as text,Time_StartTime as value FROM TimingInfo", h);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }
   
    public List<SelectListItem> getStatusList() throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query("SELECT MovieStatus_Id as value ,MovieStatus_Value as text FROM MovieStatusInfo order by MovieStatus_Value;", h);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<SelectListItem> getLanguageList() throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query("SELECT distinct Language_Name as text,Language_Name as value FROM MovieLanguageInfo order by Language_Name;", h);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<SelectListItem> getIndustryList() throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query("SELECT distinct Industry_Name as text,Industry_Name as value FROM MovieIndustryInfo order by Industry_Name;", h);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

}
