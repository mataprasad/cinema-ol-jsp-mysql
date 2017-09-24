<%@tag
	import="java.util.*,com.app.bean.json.*,com.app.bean.db.*,com.app.util.*"
	description="Login View" pageEncoding="UTF-8"%>
<%@attribute name="dropdownId" type="java.lang.String"%>
<%@attribute name="onchangeEvent" type="java.lang.String"%>
<%@attribute name="ddlValue" type="java.lang.String"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<select id="${dropdownId }" name="${dropdownId }"
	onchange="${onchangeEvent }">
	
	<c:forEach items="${stateList }" var="item">
	<c:choose>
		<c:when test="${ddlValue==item.getValue()}">
			<option value="${item.getValue() }" selected="selected">${item.getText() }</option>
		</c:when>
		<c:otherwise>
			<option value="${item.getValue() }">${item.getText() }</option>
		</c:otherwise>
	</c:choose>
	</c:forEach>
</select>