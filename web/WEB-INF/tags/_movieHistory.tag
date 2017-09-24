<%@tag
	import="java.util.*,com.app.bean.json.*,com.app.bean.db.*,com.app.bean.vm.*,com.app.util.*"
	description="Login View" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table cellspacing="0" cellpadding="3" rules="all" border="1"
	style="width: 100%; background-color: White; border-color: #000000; border-width: 1px; border-style: solid; font-size: Small; border-collapse: collapse;">
	<tr style="color: White; background-color: #006699; font-weight: bold;">
		<th scope="col">Booking Date</th>
		<th scope="col">Show Date</th>
		<th scope="col">Show Time</th>
		<th scope="col">Movie Name</th>
		<th scope="col">OL Ticket Number</th>
		<th scope="col">View Detail</th>

	</tr>
	<c:forEach items="${ticketList }" var="item">
		<tr style="color: #000066;">
			<td>${item.getBooking_Date() }</td>
			<td>${item.getShow_Date()}</td>
			<td>${item.getShow_Time()}</td>
			<td style="width: 150px;">${item.getMovie_Name()}</td>
			<td style="width: 50px;">${item.getTicket_No()}</td>
			<td><a
				href='javascript:mypopup("<c:url value="/user?do=booking-detail&id="/>${item.getTicket_Id()}","400","450");'
				style="color: #0000CC; text-decoration: underline;">View</a></td>
		</tr>
	</c:forEach>
</table>
