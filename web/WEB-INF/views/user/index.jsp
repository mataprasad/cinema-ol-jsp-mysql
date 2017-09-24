<%@ page import="java.util.*,com.app.bean.json.*,com.app.util.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:_layout>
	<jsp:attribute name="head">
    <style type="text/css">
.style1 {
	width: 135px;
}

.style2 {
	width: 122px;
}
</style>
</jsp:attribute>
	<jsp:body>

<div style="padding: 0px; margin: 0px; width: 100%; height: 400px;">
	<div
				style="border-style: none none solid none; border-width: 0px 0px 1px 0px; padding: 0px; margin: 0px; width: 200px; height: 40px; float: left; border-bottom-color: #CCCCCC;"></div>
	<div
				style="padding: 0px; margin: 0px; width: 580px; height: 40px; float: left">
		<div style="float: left; height: 40px; width: 580px;">
			<a href="<c:url value="/user?do=home"/>"
						style="float: left; border-style: solid none none solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 90px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">MyAccount</a>
			<a href="<c:url value="/user?do=edit"/>"
						style="float: left; border-style: solid none solid solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 90px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">EditProfile</a>
			<a href="<c:url value="/user?do=change-pwd"/>"
						style="float: left; border-style: solid none solid solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 135px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">ChangePassword</a>
			<a href="<c:url value="/user?do=history"/>"
						style="float: left; border-style: solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 135px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">BookingHistroy</a>
			<a
						style="float: left; border-style: none none solid none; border-width: 1px; border-color: #CCCCCC; display: block; width: 125px; line-height: 39px; height: 40px; vertical-align: middle; text-align: center;"></a>
		</div>

		<div
					style="padding: 5px; margin: 40px auto 0px auto; border-style: none solid solid solid; border-width: 1px; border-color: #CCCCCC; width: 580px; height: 350px;">
			<div style="margin: 0px auto 0px auto; width: 360px;">
				<br /> <br />
				<table style="width: 357px">
					<tr>
						<td class="style2">First Name</td>
						<td>${userInfo.getUser_FName() }</td>
					</tr>
					<tr>
						<td class="style2">Last Name</td>
						<td>${userInfo.getUser_LName() }</td>
					</tr>
					<tr>
						<td class="style2">User Name</td>
						<td>${userInfo.getUser_LoginName() }</td>
					</tr>
					<tr>
						<td class="style2">Email</td>
						<td>${userInfo.getUser_Email() }</td>
					</tr>
					<tr>
						<td class="style2">Mobile No.</td>
						<td>${userInfo.getUser_MobileNo() }</td>
					</tr>
					<tr>
						<td class="style2">Address</td>
						<td>${userInfo.getUser_Add() }</td>
					</tr>
					<tr>
						<td class="style2">City</td>
						<td>${userInfo.getUser_City() }</td>
					</tr>
					<tr>
						<td class="style2">State</td>
						<td>${userInfo.getUser_State() }</td>
					</tr>
					<tr>
						<td class="style2">Security Question</td>
						<td>${userInfo.getUser_SQ() }</td>
					</tr>
					<tr>
						<td class="style2">Security Answer</td>
						<td>${userInfo.getUser_SA() }</td>
					</tr>
				</table>

			</div>
		</div>
	</div>
	<div
				style="border-style: none none solid none; border-color: #CCCCCC; padding: 0px; margin: 0px; width: 200px; height: 40px; float: left; border-bottom-width: 1px;"></div>
</div>

</jsp:body>
</t:_layout>