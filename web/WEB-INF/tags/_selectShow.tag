<%@tag import="com.google.gson.Gson"%>
<%@tag import="java.util.*,com.app.bean.json.*,com.app.util.*" description="Select Show" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
List<SelectListItem> runningMovies=(List<SelectListItem>) request.getAttribute(Constant.TempDataKeys.RUNNING_MOVIES);

Gson g=new Gson();
if(runningMovies==null){
	runningMovies=new ArrayList<SelectListItem>();
}
%>

<form action="<c:url value="/user?do=tix-make-show-selection"/>" method="post" onsubmit="return fn_ValidateForm();">
    <div align="center" style="width: 250px">
        <br />
        <table class="style1">
            <tr>
                <td align="left">Select a Movie --</td>
            </tr>
            <tr>
                <td align="left">
                    <select id="ddlShowMovie" name="ddlShowMovie" onchange="fn_OnMovieChange();">
                   	<% for(com.app.bean.json.SelectListItem item :runningMovies ){ %>
						<option value="<%=item.getValue()%>"><%=item.getText()%></option>
					<%} %>
					</select>
                </td>
            </tr>
            <tr>
                <td align="left">Select a ShowDate --</td>
            </tr>
            <tr>
                <td align="left">
                    <select id="ddlShowDate" name="ddlShowDate" onchange="fn_OnDateChange();"><option value="0">--SELECT--</option>
</select>
                </td>
            </tr>
            <tr>
                <td align="left">Select a ShowTime --</td>
            </tr>
            <tr>
                <td align="left">
                    <select id="ddlShowTime" name="ddlShowTime"><option value="0">--SELECT--</option>
</select>
                </td>
            </tr>
        </table>
        <br />
        <div style="float: right">
            <input type="image" src="<c:url value="/images/appImages/go.png"/>" id="btnGo" title="GO" alt=""  style=" width:40px; height:40px;" />
        </div>
    </div>
</form>
<script type="text/javascript">
var showSelectionAjaxBaseUrl="<c:url value="/api?do="/>";
</script>
<script type="text/javascript">

    function fn_ValidateForm() {
        if ($("#ddlShowMovie").val() == "0") {
            alert("Please select a movie.");
            return false;
        }
        if ($("#ddlShowDate").val() == "0") {
            alert("Please select a date.");
            return false;
        }
        if ($("#ddlShowTime").val() == "0") {
            alert("Please select a time.");
            return false;
        }

        return true;
    }

    function fn_OnMovieChange() {
        $("#ddlShowDate").empty();
        $("#ddlShowDate").html("<option value='0'>Loading...</option>");
        $.ajax({
            url: showSelectionAjaxBaseUrl+"fill-date-list",
            data: "{'pMovieTitle':'" + $("#ddlShowMovie").val() + "'}",
            type: "POST",
            dataType: "json",
            contentType: "application/json",
            success: function (response) {
                $("#ddlShowDate").empty();
                $.each(response, function (i, obj) {
                    $("#ddlShowDate").append("<option value='" + obj.value + "'>" + obj.text + "</option>");
                });
            },
            error: function () { alert("Error in application."); }
        });
    }

    function fn_OnDateChange() {
        $("#ddlShowTime").empty();
        $("#ddlShowTime").html("<option value='0'>Loading...</option>");
        $.ajax({
            url: showSelectionAjaxBaseUrl+"fill-time-list",
            data: "{'pMovieTitle':'" + $("#ddlShowMovie").val() + "','pMovieDate':'" + $("#ddlShowDate").val() + "'}",
            type: "POST",
            dataType: "json",
            contentType: "application/json",
            success: function (response) {
                $("#ddlShowTime").empty();
                $.each(response, function (i, obj) {
                    $("#ddlShowTime").append("<option value='" + obj.value + "'>" + obj.text + "</option>");
                });
            },
            error: function () { alert("Error in application."); }
        });
    }

</script>
