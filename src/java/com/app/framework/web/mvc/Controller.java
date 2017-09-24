package com.app.framework.web.mvc;

import com.app.util.Constant;
import com.google.gson.Gson;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Controller {

    public ServletRequest request = null;
    public ServletResponse response = null;

    private Gson g = new Gson();

    public void initController(ServletRequest request, ServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public IActionResult view(String viewName) throws ServletException, IOException {
        request.getRequestDispatcher(viewName).forward(request, response);
        return new ActionResult();
    }

    public IActionResult view(String viewName, Object model) throws ServletException, IOException {
        request.setAttribute("model", model);
        request.getRequestDispatcher(viewName).forward(request, response);
        return new ActionResult();
    }

    public IActionResult json(Object data) throws IOException {
        response.setContentType(Constant.CONTENT_TYPE_JSON);
        response.getWriter().append(g.toJson(data));
        return new ActionResult();
    }
}
