<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:_layout>
<jsp:attribute name="head">
<link href="<c:url value="/resources/jquery-ui.css"/>" rel="stylesheet" />
    <script src="<c:url value="/Scripts/jquery-ui-1.8.20.js"/>"></script> 
    <script>
        function fn_OnRdbRunningClick() {
        	window.location.href = $("#hdnNextUrl").val();
        }
        $(document).ready(function () {
            $(function () {
                $("#accordion").accordion({
                    collapsible: true
                });
                $("#radio").buttonset();
            });
        });
    </script>
    <style type="text/css">
        .style2 {
            width: 100%;
        }
    </style>
    <style type="text/css">
        .style1 {
            width: 100%;
            border-bottom-color: Black;
            border-bottom-style: solid;
            border-bottom-width: 1px;
            border-collapse: collapse;
        }

        .style2 {
            width: 180px;
        }
    </style>

</jsp:attribute>
<jsp:body>

<div style="height: 35px; padding: 0px; margin: 0px; width: 100%; margin-bottom: 15px; display: block; line-height: 35px; vertical-align: middle; text-align: left; color: #FFFFFF; font-size: 15pt; font-weight: bold">
    <div id="radio">
    <input id="hdnNextUrl" type="hidden" value="<c:url value="/public?do=movie"/>">
        <input type="radio" id="radio1" name="radio" onclick="fn_OnRdbRunningClick();" /><label for="radio1">RUNNING MOVIES</label>
        <input type="radio" id="radio2" name="radio" checked="checked" /><label for="radio2">UPCOMMING MOVIES</label>
    </div>
</div>
<div id="accordion">
    <t:_movieDetail></t:_movieDetail>
</div>
</jsp:body>
</t:_layout>


