package com.app.framework.web;

import com.app.bean.db.MovieInfo;
import com.app.bean.db.UserInfo;

import javax.servlet.http.HttpServletRequest;

public class ModelBinder {

    public static UserInfo populateUserInfo(HttpServletRequest request) {

        UserInfo obj = new UserInfo();

        obj.setUser_LoginName(request.getParameter("User_LoginName"));
        obj.setUser_LoginPassword(request.getParameter("User_LoginPassword"));
        obj.setUser_Email(request.getParameter("User_Email"));
        obj.setUser_MobileNo(request.getParameter("User_MobileNo"));
        obj.setUser_FName(request.getParameter("User_FName"));
        obj.setUser_LName(request.getParameter("User_LName"));
        obj.setUser_Add(request.getParameter("User_Add"));
        obj.setUser_City(request.getParameter("User_City"));
        obj.setUser_State(request.getParameter("User_State"));
        obj.setUser_SQ(request.getParameter("User_SQ"));
        obj.setUser_SA(request.getParameter("User_SA"));
        obj.setUser_Type(request.getParameter("User_Type"));

        return obj;
    }

    public static MovieInfo populateMovieInfo(HttpServletRequest request) {
        MovieInfo obj = new MovieInfo();
        obj.setMovie_Casts(request.getParameter("txtCasts"));
        obj.setMovie_Director(request.getParameter("txtDirector"));
        obj.setMovie_Industry(request.getParameter("ddlIndustry"));
        obj.setMovie_Language(request.getParameter("ddlLanguage"));
        obj.setMovie_ReleaseDate(request.getParameter("txtReleaseDate"));
        //obj.setMovie_Status(Integer.parseInt(request.getParameter("ddlStatus")));
        return obj;
    }
}
