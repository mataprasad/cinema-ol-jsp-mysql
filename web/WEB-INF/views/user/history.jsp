<%@ page import="java.util.*,com.app.bean.json.*,com.app.util.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:_layout>
	<jsp:attribute name="head">
<link href="<c:url value="/css/simplePagination.css"/>" rel="stylesheet" />
    <script src="<c:url value="Scripts/jquery.blockUI.js"/>"></script>
    <script src="<c:url value="/Scripts/jquery.simplePagination.js"/>"></script>
    <script type="text/javascript">
					function mypopup(url, width1, height1) {
						width = window.screen.width;
						height = window.screen.height;
						mywindow = window.open(url, "CinemaOL",
								"location=0,status=1,scrollbars=1,resizable=1,menubar=0,toolbar=no,width="
										+ width + ",height=" + height);
						mywindow.moveTo(0, 0);
						mywindow.focus();
					}
				</script>
</jsp:attribute>

	<jsp:body>

<div style="padding: 0px; margin: 0px; width: 100%; height: 450px;">
    <div
				style="border-style: none none solid none; border-width: 0px 0px 1px 0px; padding: 0px; margin: 0px; width: 200px; height: 40px; float: left; border-bottom-color: #CCCCCC;"></div>
    <div
				style="padding: 0px; margin: 0px; width: 580px; height: 40px; float: left">
        <div style="float: left; height: 40px; width: 580px;">
            <a href="<c:url value="/user?do=home"/>" 
                style="float: left; border-style: solid none solid solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 90px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">MyAccount</a>
            <a href="<c:url value="/user?do=edit"/>" 
                style="float: left; border-style: solid none solid solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 90px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">EditProfile</a>
            <a href="<c:url value="/user?do=change-pwd"/>"
                style="float: left; border-style: solid none solid solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 135px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">ChangePassword</a>
            <a href="<c:url value="/user?do=history"/>"
                style="float: left; border-style: solid solid none solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 135px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">BookingHistroy</a>
            <a
						style="float: left; border-style: none none solid none; border-width: 1px; border-color: #CCCCCC; display: block; width: 125px; line-height: 39px; height: 40px; vertical-align: middle; text-align: center;"></a>
        </div>

        <div id="divWrapper"
					style="border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; border-top: 1px none #CCCCCC; border-bottom: 1px solid #CCCCCC; padding: 5px; margin: 40px 0px 0px 0px; width: 580px; height: 375px;"
					align="center">
            <br />
            <div id="resultDiv">
                <t:_movieHistory></t:_movieHistory>
                            </div>
            <div class="pagination-holder clearfix"
						style="margin-top: 5px;">
                <div id="historyPager"></div>
            </div>
        </div>

    </div>
    <div
				style="border-style: none none solid none; border-color: #CCCCCC; padding: 0px; margin: 0px; width: 200px; height: 40px; float: left; border-bottom-width: 1px;"></div>
<input type="hidden" id="hdRecordsCount" name="hdRecordsCount"
				value="100" />
<input type="hidden" id="hdHistoryAjaxUrl" name="hdHistoryAjaxUrl"
				value="<c:url value="/user?do=history-ajax"/>" />
</div>
<script>
	$('#historyPager').pagination(
			{
				items : $("#hdRecordsCount").val(),
				itemsOnPage : 10,
				cssStyle : 'compact-theme',
				displayedPages : 7,
				selectOnClick : true,
				onPageClick : function(pageNo, event) {
					$("#divWrapper").block();
					$.ajax({
						url : $("#hdHistoryAjaxUrl").val() + "&forAjax=1&page="+ pageNo,
						type : "GET",
						success : function(response) {
							$("#resultDiv").html(response);
							$("#divWrapper").unblock();
						},
						error : function(a, b, c) {
							alert("Error in AJAX call.");
						}
					});
				}
			});
</script>

</jsp:body>
</t:_layout>

