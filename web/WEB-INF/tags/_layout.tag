<%@tag description="Layout" pageEncoding="UTF-8" import="java.util.*,com.app.bean.json.*,com.app.bean.db.*,com.app.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@attribute name="head" fragment="true" required="false" %>
<%@attribute name="footer" fragment="true" required="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>CinemaOL | An Online Cinema Ticket Booking System</title>
        <script type="text/javascript">
            window.history.forward(1);
        </script>
        <script type="text/javascript" src="<c:url value="/resources/jquery-1.6.1.min.js"/>"></script>
        <script type="text/javascript">
            var rev = "fwd";
            function titlebar(val) {
                var msg = "CinemaOL | An Online Cinema Ticket Booking System";
                var res = " ";
                var speed = 100;
                var pos = val;

                msg = "" + msg + "";
                var le = msg.length;
                if (rev == "fwd") {
                    if (pos < le) {
                        pos = pos + 1;
                        scroll = msg.substr(0, pos);
                        document.title = scroll;
                        timer = window.setTimeout("titlebar(" + pos + ")", speed);
                    } else {
                        rev = "bwd";
                        timer = window.setTimeout("titlebar(" + pos + ")", speed);
                    }
                } else {
                    if (pos > 0) {
                        pos = pos - 1;
                        var ale = le - pos;
                        scrol = msg.substr(ale, le);
                        document.title = scrol;
                        timer = window.setTimeout("titlebar(" + pos + ")", speed);
                    } else {
                        rev = "fwd";
                        timer = window.setTimeout("titlebar(" + pos + ")", speed);
                    }
                }
            }

            titlebar(0);
        </script>
        <jsp:invoke fragment="head"/>
        <link href="<c:url value="/resources/style.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/favicon.ico"/>" rel="Shortcut Icon" />
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div style="width: 300px; height: 100px; float: left;">
                    <a href="<c:url value="/public"/>">
                        <img src="<c:url value="/images/appImages/logo.png"/>"  height="100px" width="300px" alt="CinemaOL" id="logo" />
                    </a>
                </div>

                <t:_loginView></t:_loginView>

                </div>
            </div>
            <div id="content">
            <jsp:doBody/>
        </div>

        <div id="footer">
            <div style="height: 20px;">
                <div style="width: 600px; float: left">
                    <ul style="padding: 0px; margin: 0px; list-style-type: none; height: 20px; width: 600px;">
                        <li style="float: left;">Designed and Developed by Mata Prasad Chauhan.
                            All Rights Reserved &copy; 2012
                        </li>
                    </ul>
                </div>
                <div style="width: 100px; height: 20px; float: right;">


                    <ul style="padding: 0px; width: 100px; height: 20px; float: right; margin: 0px; list-style-type: none;">
                        <li style="float: right; height: 20px; width: 100px; margin: 0px; padding: 0px;">
                            <a href="<c:url value="/public?do=login-admin"/>"
                               style="width: 100px; height: 20px; display: block; line-height: 20px; vertical-align: middle; text-align: center; color: #808000; text-decoration: underline; font-weight: bold; font-size: 12pt;">Admin Login  </a></li>
                    </ul>

                </div>
            </div>
        </div>
    </body>
    <!-- 
    <%/* %>
    <%= request.getContextPath()%>
    <%= request.getRequestURI()%>
    <%= request.getRequestURL()%>
    <%=  request.getRealPath("/uploads/" + java.util.UUID.randomUUID().toString())%>
    <%
        String ext1 = org.apache.commons.io.FilenameUtils.getExtension("/path/to/file/foo.txt");
    %>
    <%=ext1 %>
    <% */%>
    -->
</html>
