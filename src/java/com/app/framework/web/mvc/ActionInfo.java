package com.app.framework.web.mvc;

import java.util.ArrayList;
import java.util.List;

public class ActionInfo {

    private String methodName = "";
    private String modelClassName = "";
    private List<String> allowedRoles = new ArrayList<String>();

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getModelClassName() {
        return modelClassName;
    }

    public void setModelClassName(String inputModelClass) {
        this.modelClassName = inputModelClass;
    }

    public List<String> getAllowedRoles() {
        return allowedRoles;
    }

    public void setAllowedRoles(List<String> allowedRoles) {
        this.allowedRoles = allowedRoles;
    }
}
