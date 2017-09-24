package com.app.ctrl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.bean.db.UserInfo;
import com.app.bean.vm.VMContactForm;
import com.app.bean.vm.VMLogin;
import com.app.bean.vm.VMRegister;
import com.app.biz.CommonService;
import com.app.biz.MovieService;
import com.app.biz.UserService;
import com.app.framework.web.BaseController;
import com.app.util.Constant;
import java.util.logging.Level;
import java.util.logging.Logger;
import nl.captcha.Captcha;
import org.apache.commons.mail.HtmlEmail;

@WebServlet("/public")
public class PublicController extends BaseController {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this._dbConfig = this.InitDbConfig();
        String basePath = this.getServletContext().getContextPath();
        String action = this.getAction(request);
        MovieService movieService = null;

        switch (action) {
            case "home":
            case "":
                movieService = new MovieService(this._dbConfig);
                try {
                    request.setAttribute(Constant.TempDataKeys.RUNNING_MOVIES, movieService.fillMovieList());
                    request.setAttribute(Constant.TempDataKeys.MOVIES_URLS, movieService.getMoviesImageURL());
                } catch (Exception ex) {
                    throw new ServletException(ex.getMessage());
                }
                this.view("public/index.jsp", request, response);
                break;
            case "about":
                this.view("public/about.jsp", request, response);
                break;
            case "contact":
                this.view("public/contact.jsp", request, response);
                break;
            case "log-out":
                request.getSession().invalidate();
                response.sendRedirect(basePath + "/public");
                break;
            case "login":
                request.setAttribute(Constant.TempDataKeys.TITLE, " ");
                request.setAttribute(Constant.TempDataKeys.POST_URL, "public?do=login");
                this.view("public/login.jsp", request, response);
                break;
            case "login-admin":
                request.setAttribute(Constant.TempDataKeys.TITLE, " ADMIN");
                request.setAttribute(Constant.TempDataKeys.POST_URL, "public?do=admin-login");
                this.view("public/login.jsp", request, response);
                break;
            case "register":
                CommonService commonService = new CommonService(this._dbConfig);
                try {
                    request.setAttribute(Constant.TempDataKeys.STATE_LIST, commonService.getAllStates());
                } catch (Exception ex) {
                    throw new ServletException(ex.getMessage());
                }
                this.view("public/register.jsp", request, response);
                break;
            case "reset-pass":
                request.setAttribute(Constant.TempDataKeys.STEP, "1");
                this.view("public/reset-pass.jsp", request, response);
                break;
            case "movie":
                movieService = new MovieService(this._dbConfig);
                try {
                    request.setAttribute(Constant.TempDataKeys.MOVIE_LIST, movieService.getRunningMovies());
                } catch (Exception ex) {
                    throw new ServletException(ex.getMessage());
                }
                this.view("public/movie.jsp", request, response);
                break;
            case "movie-up-comming":
                movieService = new MovieService(this._dbConfig);
                try {
                    request.setAttribute(Constant.TempDataKeys.MOVIE_LIST, movieService.getUpCommingMovies());
                } catch (Exception ex) {
                    throw new ServletException(ex.getMessage());
                }
                this.view("public/movie-up-comming.jsp", request, response);
                break;
            case "make-show-selectionx":
                break;
            default:
                //response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this._dbConfig = this.InitDbConfig();
        String action = this.getAction(request);

        switch (action) {
            case "login":
                this.login(request, response, false);
                break;
            case "admin-login":
                this.login(request, response, true);
                break;
            case "contact":
                this.contact(request, response);
                break;
            case "register":
                this.register(request, response);
                break;
            case "reset-pass": {
                try {
                    this.resetPass(request, response);
                } catch (Exception ex) {
                    throw new ServletException(ex.getMessage());
                }
                this.view("public/reset-pass.jsp", request, response);
            }
            break;
            default:
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void resetPass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        String step = request.getParameter(Constant.TempDataKeys.STEP);
        String userName = request.getParameter("txtUserName");
        UserService userService = new UserService(this._dbConfig);
        UserInfo obj = null;
        switch (step) {
            case "1":
                obj = userService.getUser(userName);
                if (obj != null) {
                    request.setAttribute(Constant.TempDataKeys.SQ, obj.getUser_SQ());
                    request.setAttribute(Constant.TempDataKeys.HD_USER, userName);
                    request.setAttribute(Constant.TempDataKeys.STEP, "2");
                } else {
                    request.setAttribute(Constant.TempDataKeys.MSG, userName + " - User does not exists");
                    request.setAttribute(Constant.TempDataKeys.STEP, "1");
                }
                break;
            case "2":
                userName = request.getParameter(Constant.TempDataKeys.HD_USER);
                String sa = request.getParameter(Constant.TempDataKeys.SA);
                obj = userService.getUser(userName);
                if (obj != null) {
                    if (obj.getUser_SA().equals(sa.trim())) {
                        request.setAttribute(Constant.TempDataKeys.HD_USER, userName);
                        request.setAttribute(Constant.TempDataKeys.STEP, "3");
                    } else {
                        request.setAttribute(Constant.TempDataKeys.SQ, obj.getUser_SQ());
                        request.setAttribute(Constant.TempDataKeys.HD_USER, userName);
                        request.setAttribute(Constant.TempDataKeys.MSG, "Security answer not matched.");
                        request.setAttribute(Constant.TempDataKeys.STEP, "2");
                    }
                }
                break;
            case "3":
                userName = request.getParameter(Constant.TempDataKeys.HD_USER);
                String newPass = request.getParameter("txtRePass");

                obj = new UserInfo();
                obj.setUser_LoginName(userName);
                obj.setUser_LoginPassword(newPass);

                if (userService.changePassword(obj, true)) {
                    request.setAttribute(Constant.TempDataKeys.MSG, "Password change successfully.");
                    request.setAttribute(Constant.TempDataKeys.STEP, "3");
                } else {
                    request.setAttribute(Constant.TempDataKeys.MSG, "Unable to change password.");
                    request.setAttribute(Constant.TempDataKeys.STEP, "3");
                }

                break;
            default:
                break;
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        VMRegister formData = new VMRegister();
        this.populate(formData, request);

        Captcha captcha = (Captcha) request.getSession().getAttribute(Captcha.NAME);
        if (!captcha.isCorrect(formData.getTxtVeriCode())) {
            request.setAttribute(Constant.TempDataKeys.ERROR_MSG, Constant.ErrorMessages.CAPTCHA_ERROR);
            this.registerGet(request, response);
            return;
        }

        UserService userService = new UserService(this._dbConfig);
        try {
            if (userService.registerUser(formData)) {
                VMLogin objVMLogin = new VMLogin();
                objVMLogin.setTxtLoginId(formData.getTxtUName());
                objVMLogin.setTxtLoginPass(formData.getTxtRePass());
                UserInfo dataTable = userService.doUserLogin(objVMLogin, false);
                this.loginSuccessRedirect(request, response, dataTable, false);
            }
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage());
        }
        this.registerGet(request, response);
    }

    private void registerGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommonService commonService = new CommonService(this._dbConfig);
        try {
            request.setAttribute(Constant.TempDataKeys.STATE_LIST, commonService.getAllStates());
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage());
        }
        this.view("public/register.jsp", request, response);
    }

    private void contact(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        VMContactForm formData = new VMContactForm();
        this.populate(formData, request);
        //this.json(formData, request, response);
        String mail = "";
        mail += "<html xmlns=\"http://www.w3.org/1999/xhtml\"><head><title></title></head><body><div style=\"border: 1px solid #993333; width: 450px; height: 350px; background-color: #CCCCCC;\"><table  style=\"width:100%\"><tr><td style=\"width: 58px;\">Name :</td><td>";
        mail += formData.getTxtContact().trim().toUpperCase();
        mail += "</td></tr><tr><td style=\"width: 58px;\">Address :</td><td>";
        mail += formData.getTxtAddress().trim().toUpperCase();
        mail += "</td></tr><tr><td style=\"width: 58px;\">Contact :</td><td>";
        mail += formData.getTxtContact().trim().toUpperCase();
        mail += "</td></tr><tr><td style=\"width: 58px;\">Email :</td><td>";
        mail += formData.getTxtEmail().trim().toUpperCase();
        mail += "</td></tr><tr><td style=\"width: 58px;\">Views :</td><td>";
        mail += formData.getTxtViews().trim().toUpperCase();
        mail += "</td></tr></table></div></body></html>";
        try {
            HtmlEmail email = new HtmlEmail();
            email.setHostName("smtp.gmail.com");
            email.addTo(formData.getTxtEmail(), formData.getTxtContact());
            email.setFrom("mataprasad045@gmail.com", "CinemaOL");
            email.setSubject("Thank you for visiting CinemaOl !");
            email.setAuthentication("mataprasad045@gmail.com", "");
            email.setSSLOnConnect(true);
            email.setSslSmtpPort("465");
            email.setHtmlMsg(mail);
            email.setTextMsg("Your email client does not support HTML messages");
            email.send();
        } catch (Exception ex) {
            //intentionaly left blank
        }

        request.setAttribute(Constant.TempDataKeys.MSG, "Thanx for your feedback.");
        this.view("public/contact.jsp", request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response, boolean isAdmin)
            throws ServletException, IOException {
        VMLogin objVMLogin = new VMLogin();
        this.populate(objVMLogin, request);
        UserService userService = new UserService(this._dbConfig);
        UserInfo dataTable = null;
        try {
            dataTable = userService.doUserLogin(objVMLogin, isAdmin);
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage());
        }
        if (dataTable != null) {
            this.loginSuccessRedirect(request, response, dataTable, isAdmin);
        } else {
            request.setAttribute(Constant.TempDataKeys.ERROR, "Invalid user name or/and password !");
            if (isAdmin) {
                request.setAttribute(Constant.TempDataKeys.TITLE, " ADMIN");
                request.setAttribute(Constant.TempDataKeys.POST_URL, "public?do=admin-login");
            } else {
                request.setAttribute(Constant.TempDataKeys.TITLE, " ");
                request.setAttribute(Constant.TempDataKeys.POST_URL, "public?do=login");
            }
            this.view("public/login.jsp", request, response);
        }
    }
}
