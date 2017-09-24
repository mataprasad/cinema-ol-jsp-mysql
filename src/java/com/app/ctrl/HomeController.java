package com.app.ctrl;

import com.app.bean.db.UserInfo;
import com.app.framework.web.mvc.IActionResult;
import com.app.framework.web.mvc.Controller;
import java.io.IOException;
import javax.servlet.ServletException;

public class HomeController extends Controller {

    public IActionResult index() throws ServletException, IOException {
        return this.view("/WEB-INF/views/public/index.jsp");
    }

    public IActionResult edit(UserInfo data) throws ServletException, IOException {
        return this.json(data);
    }
}
