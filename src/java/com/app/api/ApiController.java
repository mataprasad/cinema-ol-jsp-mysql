package com.app.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.bean.vm.VMSelectShow;
import com.app.biz.ShowService;
import com.app.framework.web.BaseController;

@WebServlet("/api")
public class ApiController extends BaseController {

    private static final long serialVersionUID = 1L;

    public ApiController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this._dbConfig = this.InitDbConfig();
        String action = this.getAction(request);

        VMSelectShow obj = null;

        switch (action) {
            case "fill-date-list":
                try {
                    obj = (VMSelectShow) this.populateJson(VMSelectShow.class, request);
                    this.fillDateList(obj, request, response);
                } catch (Exception e) {

                    throw new ServletException(e.getMessage());
                }
                break;
            case "fill-time-list":
                try {
                    obj = (VMSelectShow) this.populateJson(VMSelectShow.class, request);
                    this.fillTimeList(obj, request, response);
                } catch (Exception e) {

                    throw new ServletException(e.getMessage());
                }
                break;
            default:
                break;
        }
    }

    private void fillDateList(VMSelectShow obj, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        ShowService service = new ShowService(this._dbConfig);
        this.json(service.fillDateList(obj.getpMovieTitle()), request, response);
    }

    private void fillTimeList(VMSelectShow obj, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        ShowService service = new ShowService(this._dbConfig);
        this.json(service.fillTimeList(obj.getpMovieTitle(), obj.getpMovieDate()), request, response);
    }
}
