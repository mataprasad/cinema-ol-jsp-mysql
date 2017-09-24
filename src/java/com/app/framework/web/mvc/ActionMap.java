/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.framework.web.mvc;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Map;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;

public class ActionMap {

    private String controller;
    private String action;
    private String model;

    public static String getFullURL(HttpServletRequest request) {
        StringBuffer requestURL = request.getRequestURL();
        String queryString = request.getQueryString();

        if (queryString == null) {
            return requestURL.toString();
        } else {
            return requestURL.append('?').append(queryString).toString();
        }
    }
    
    public static ActionMap Init(ServletRequest request, ServletResponse response) throws IOException {
        ActionMap actMap = null;
        HttpServletRequest req = ((HttpServletRequest) request);
        String s1 = req.getContextPath();
        String s2 = req.getRequestURI();
        String s3 = req.getRequestURL().toString();
        String fullUrl = getFullURL(req).toLowerCase();
        if (fullUrl.contains(".css") || fullUrl.contains(".js") || fullUrl.contains(".html") || fullUrl.contains(".jpg") || fullUrl.contains(".png") || fullUrl.contains(".gif") || fullUrl.contains(".icon")) {
            return null;
        }
        Gson g = new Gson();
        String requestedResource = s2.replace(s1 + "/", "");
        String[] urlParts = requestedResource.split("/");
        if (urlParts != null && urlParts.length >= 2) {
            String controller = urlParts[0];
            String action = urlParts[1];

            String jsonFilePath = req.getServletContext().getRealPath("/WEB-INF/action-map.json");

            String json = FileUtils.readFileToString(new File(jsonFilePath), "utf-8");

            Type listType = new TypeToken<Map<String, ControllerInfo>>() {
            }.getType();
            Map<String, ControllerInfo> map = g.fromJson(json, listType);

            String method = req.getMethod();
            if (map.containsKey(controller)) {
                actMap = new ActionMap();
                ControllerInfo cInfo = map.get(controller);
                ActionInfo mInfo = cInfo.getActions().get(action).get(method);
                actMap.setController(cInfo.getControllerClassName());
                actMap.setAction(mInfo.getMethodName());
                actMap.setModel(mInfo.getModelClassName());
            }
        }
        return actMap;
    }

    public String getController() {
        return this.controller;
    }

    public String getAction() {
        return this.action;
    }

    public String getModel() {
        return this.model;
    }

    public void setController(String ctrl) {
        this.controller = ctrl;
    }

    public void setAction(String act) {
        this.action = act;
    }

    public void setModel(String model) {
        this.model = model;
    }

}
