package com.app.ctrl;

import com.app.bean.db.MovieInfo;
import com.app.bean.json.SelectListItem;
import com.app.bean.vm.VMManageShow;
import com.app.bean.vm.VMMovieInfo;
import com.app.biz.CommonService;
import com.app.biz.MovieService;
import com.app.biz.ShowService;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.framework.web.BaseController;
import com.app.util.Constant;
import com.google.gson.Gson;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/admin")
public class AdminController extends BaseController {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this._dbConfig = this.InitDbConfig();
        String action = this.getAction(request);
        MovieService movieService = null;

        switch (action) {
            case "":
            case "home":
                this.view("admin/index.jsp", request, response);
                break;
            case "manage-show":
                this.manageMovieGet(request, response);
                break;
            case "remove-movie":
                movieService = new MovieService(this._dbConfig);
                 {
                    try {
                        request.setAttribute(Constant.TempDataKeys.MOVIE_LIST, movieService.getMoviesToRemove());
                    } catch (Exception ex) {
                        throw new ServletException(ex.getMessage());
                    }
                }
                this.view("admin/remove-movie.jsp", request, response);
                break;
            case "add-movie":
                this.addMovieGet(request, response);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this._dbConfig = this.InitDbConfig();
        String action = this.getAction(request);
        MovieService movieService = null;

        switch (action) {
            case "remove-movie":
                movieService = new MovieService(this._dbConfig);
                String json = request.getParameter("hdSelectedMovie");
                Gson g = new Gson();
                String[] selectedValues = g.fromJson(json, String[].class);
                 {
                    try {
                        if (movieService.removeMovie(selectedValues)) {
                            request.setAttribute(Constant.TempDataKeys.MSG, "Selected item removed successfully.");
                        }
                        request.setAttribute(Constant.TempDataKeys.MOVIE_LIST, movieService.getMoviesToRemove());
                    } catch (Exception ex) {
                        throw new ServletException(ex.getMessage());
                    }
                }
                this.view("admin/remove-movie.jsp", request, response);
            case "add-movie":
                VMMovieInfo objMovieInfo = new VMMovieInfo();
                this.populate(objMovieInfo, request);
                String uploadedFileName = this.uploadFile(request, "fuPoster", "images/movieImages");
                MovieInfo obj = new MovieInfo();
                obj.setMovie_Casts(objMovieInfo.getTxtCasts());
                obj.setMovie_Director(objMovieInfo.getTxtDirector());
                obj.setMovie_Industry(objMovieInfo.getDdlIndustry());
                obj.setMovie_Language(objMovieInfo.getDdlLanguage());
                obj.setMovie_ReleaseDate(objMovieInfo.getTxtReleaseDate());
                obj.setMovie_Status(objMovieInfo.getDdlStatus());
                obj.setMovie_Title(objMovieInfo.getTxtTitle());
                obj.setMovie_ImageURL(uploadedFileName);
                movieService = new MovieService(this._dbConfig);
                 {
                    try {
                        if (movieService.addNewMovie(obj)) {
                            request.setAttribute(Constant.TempDataKeys.MSG, "Movie Added successfully.");
                        } else {
                            request.setAttribute(Constant.TempDataKeys.MSG, "Oops there is issue while processing.");
                        }
                    } catch (Exception ex) {
                        throw new ServletException(ex.getMessage());
                    }
                }
                addMovieGet(request, response);
                break;
            case "manage-show":
                VMManageShow objVMManageShow = new VMManageShow();
                this.populate(objVMManageShow, request);
                ShowService showService = new ShowService(this._dbConfig);
                 {
                    try {
                        if (showService.addShowInfo(objVMManageShow)) {
                            request.setAttribute(Constant.TempDataKeys.MSG, "Show added successfully.");
                        } else {
                            request.setAttribute(Constant.TempDataKeys.MSG, "Oops there is issue while processing.");
                        }
                    } catch (Exception ex) {
                        throw new ServletException(ex.getMessage());
                    }
                }
                this.manageMovieGet(request, response);
            default:
                break;
        }
    }

    private void manageMovieGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommonService commonService = new CommonService(this._dbConfig);
        MovieService movieService = new MovieService(this._dbConfig);

        List<SelectListItem> ddlHallList = null;
        List<SelectListItem> ddlTimeList = null;
        List<SelectListItem> ddlMovieList = null;

        try {
            ddlHallList = commonService.getHallList();
            ddlTimeList = commonService.getTimeList();
            ddlMovieList = movieService.getMovieList();

            request.setAttribute(Constant.TempDataKeys.DDL_HALL_LIST, ddlHallList);
            request.setAttribute(Constant.TempDataKeys.DDL_TIME_LIST, ddlTimeList);
            request.setAttribute(Constant.TempDataKeys.DDL_MOVIE_LIST, ddlMovieList);
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage());
        }

        this.view("admin/manage-show.jsp", request, response);
    }

    private void addMovieGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommonService commonService = new CommonService(this._dbConfig);

        List<SelectListItem> ddlStatus = null;
        List<SelectListItem> ddlLanguage = null;
        List<SelectListItem> ddlIndustry = null;

        try {
            ddlStatus = commonService.getStatusList();
            ddlLanguage = commonService.getLanguageList();
            ddlIndustry = commonService.getIndustryList();

            request.setAttribute(Constant.TempDataKeys.DDL_STATUS_LIST, ddlStatus);
            request.setAttribute(Constant.TempDataKeys.DDL_LANGUAGE_LIST, ddlLanguage);
            request.setAttribute(Constant.TempDataKeys.DDL_INDUSTRY_LIST, ddlIndustry);
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage());
        }

        this.view("admin/add-movie.jsp", request, response);
    }

}
