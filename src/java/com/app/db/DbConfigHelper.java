package com.app.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConfigHelper {

    private String host;
    private String port;
    private String dbName;
    private String userId;
    private String dbType;
    private String password;
    private String driver;

    public DbConfigHelper(String driver, String host, String port, String dbName, String userId, String password,
            String dbType) {

        this.driver = driver;
        this.host = host;
        this.port = port;
        this.dbName = dbName;
        this.userId = userId;
        this.password = password;
        this.dbType = dbType.trim().toUpperCase();
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDbUrl() {

        String url = "jdbc:mysql://" + this.host + ":" + this.port + "/" + this.dbName;
        switch (this.dbType) {
            case "MYSQL":
                break;
            case "SQL":
                url = "jdbc:sqlserver://" + this.host + ":" + this.port + ";" + this.dbName;
                break;
            default:
                break;
        }
        return url;
    }

    public Connection getConnection() throws Exception {
        Class.forName(this.driver);
        return DriverManager.getConnection(getDbUrl(), this.userId, this.password);
    }
}
