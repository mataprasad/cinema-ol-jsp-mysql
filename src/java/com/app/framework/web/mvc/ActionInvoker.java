package com.app.framework.web.mvc;

import java.io.IOException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.beanutils.BeanUtils;

public class ActionInvoker {

    public static boolean invoke(ServletRequest request, ServletResponse response) throws IOException {
        boolean success = false;
        ActionMap controllerContext = ActionMap.Init(request, response);
        if (controllerContext == null) {
            success = false;
            return success;
        }
        String ctrl = controllerContext.getController();
        String act = controllerContext.getAction();
        String mod = controllerContext.getModel();
        try {
            Class<?> t = Class.forName(ctrl);
            Object o = t.newInstance();

            Method initController = t.getMethod("initController", ServletRequest.class, ServletResponse.class);
            initController.invoke(o, request, response);

            Method actionMethod = null;
            if (!"".equals(mod)) {
                Class<?> mt = Class.forName(mod);
                actionMethod = t.getMethod(act, mt);
                Object mo = mt.newInstance();
                BeanUtils.populate(mo, request.getParameterMap());
                actionMethod.invoke(o, mo);
            } else {
                actionMethod = t.getMethod(act);
                actionMethod.invoke(o);
            }
            success = true;
            // production code should handle these exceptions more gracefully
        } catch (ClassNotFoundException x) {
            success = false;
        } catch (InstantiationException x) {
            success = false;
        } catch (IllegalAccessException x) {
            success = false;
        } catch (NoSuchMethodException ex) {
            success = false;
        } catch (SecurityException ex) {
            success = false;
        } catch (IllegalArgumentException ex) {
            success = false;
        } catch (InvocationTargetException ex) {
            success = false;
        }
        return success;
    }
}
