<%@tag
    import="java.util.*,com.app.bean.json.*,com.app.bean.db.*,com.app.util.*"
    description="Login View" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <div style="width: 500px; height: 100px; float: right;">
        <div id="LoginRegister" class="menu_"
             style="height: 50%; display: block; vertical-align: top; text-align: right; line-height: 100%;">
            <%
                Object oUserInfo = request.getSession().getAttribute(Constant.SessionKeys.USER_INFO);
                Object oIsAdmin = request.getSession().getAttribute(Constant.SessionKeys.IS_ADMIN);
                boolean isAdmin = false;
                if (oIsAdmin != null) {
                    isAdmin = (boolean) oIsAdmin;
                }
                if (oUserInfo != null) {
                    UserInfo dt = (UserInfo) oUserInfo;
                    String name = dt.getUser_FName() + " " + dt.getUser_LName();
                    if (name.length() > 20) {
                        name = name.substring(0, 20).toUpperCase();
                    }
            %>

            <a href="<c:url value="/public?do=log-out"/>">Log Out</a> <a class="xx"
                                                                         style="width: 300px; background-color: #ffffff;" href="<c:url value="/user?do=home"/>" title="Click to go your Account Home !">Welcome <%=name%></a>
            <%
            } else {
            %>
            <a href="<c:url value="/public?do=login"/>">Login</a> <a href="<c:url value="/public?do=register"/>">Register</a>
            <%} %>

        </div>
        <div class="menu_"
             style="height: 50%; display: block; vertical-align: top; text-align: right; line-height: 100%;">
            <% if (!isAdmin) {%>
            <a href="<c:url value="/public?do=contact"/>" >ContactUs</a><a href="<c:url value="/public?do=about"/>">AboutUs</a><a
                href="<c:url value="/public?do=movie"/>">Movies</a><a
                href="<c:url value="/public"/>">Home</a>
            <%} else { %>
            <a href="<c:url value="/admin?do=add-movie"/>" style="width: 150px;">AddMovies</a>
            <a href="<c:url value="/admin?do=remove-movie"/>" style="width: 150px;">RemoveMovies</a>
            <a href="<c:url value="/admin?do=manage-show"/>" style="width: 150px;">ManageShows</a>
            <% }%>
            <br /> <br />
            <div style="text-align: center;">Your IP is: <%=request.getRemoteAddr()%></div>
        </div>
    </div>
