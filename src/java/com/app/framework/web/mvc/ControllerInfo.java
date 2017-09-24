/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.framework.web.mvc;

import java.util.Map;

/**
 *
 * @author CHAUHAN
 */
public class ControllerInfo {

    private String controllerClassName;
    Map<String, Map<String, ActionInfo>> actions;

    public String getControllerClassName() {
        return controllerClassName;
    }

    public void setControllerClassName(String className) {
        this.controllerClassName = className;
    }

    public Map<String, Map<String, ActionInfo>> getActions() {
        return actions;
    }

    public void setActions(Map<String, Map<String, ActionInfo>> actionList) {
        this.actions = actionList;
    }
}
