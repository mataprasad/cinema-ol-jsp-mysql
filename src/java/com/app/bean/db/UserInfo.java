package com.app.bean.db;

public class UserInfo {

    public int getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(int user_Id) {
        User_Id = user_Id;
    }

    public String getUser_LoginName() {
        return User_LoginName;
    }

    public void setUser_LoginName(String user_LoginName) {
        User_LoginName = user_LoginName;
    }

    public String getUser_LoginPassword() {
        return User_LoginPassword;
    }

    public void setUser_LoginPassword(String user_LoginPassword) {
        User_LoginPassword = user_LoginPassword;
    }

    public String getUser_Email() {
        return User_Email;
    }

    public void setUser_Email(String user_Email) {
        User_Email = user_Email;
    }

    public String getUser_MobileNo() {
        return User_MobileNo;
    }

    public void setUser_MobileNo(String user_MobileNo) {
        User_MobileNo = user_MobileNo;
    }

    public String getUser_FName() {
        return User_FName;
    }

    public void setUser_FName(String user_FName) {
        User_FName = user_FName;
    }

    public String getUser_LName() {
        return User_LName;
    }

    public void setUser_LName(String user_LName) {
        User_LName = user_LName;
    }

    public String getUser_Add() {
        return User_Add;
    }

    public void setUser_Add(String user_Add) {
        User_Add = user_Add;
    }

    public String getUser_City() {
        return User_City;
    }

    public void setUser_City(String user_City) {
        User_City = user_City;
    }

    public String getUser_State() {
        return User_State;
    }

    public void setUser_State(String user_State) {
        User_State = user_State;
    }

    public String getUser_SQ() {
        return User_SQ;
    }

    public void setUser_SQ(String user_SQ) {
        User_SQ = user_SQ;
    }

    public String getUser_SA() {
        return User_SA;
    }

    public void setUser_SA(String user_SA) {
        User_SA = user_SA;
    }

    public String getUser_Type() {
        return User_Type;
    }

    public void setUser_Type(String user_Type) {
        User_Type = user_Type;
    }

    public boolean isUser_IsActive() {
        return User_IsActive;
    }

    public void setUser_IsActive(boolean user_IsActive) {
        User_IsActive = user_IsActive;
    }

    public boolean isUser_IsAdmin() {
        if ("ADMIN".equals(User_Type)) {
            return true;
        }
        return false;
    }

    private int User_Id = 0;

    private String User_LoginName = "";

    private String User_LoginPassword = "";

    private String User_Email = "";

    private String User_MobileNo = "";

    private String User_FName = "";

    private String User_LName = "";

    private String User_Add = "";

    private String User_City = "";

    private String User_State = "";

    private String User_SQ = "";

    private String User_SA = "";

    private String User_Type = "";

    private boolean User_IsActive = false;
}
