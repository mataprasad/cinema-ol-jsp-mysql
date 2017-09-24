<%@tag description="Layout" pageEncoding="UTF-8"
	import="com.app.bean.json.*,java.util.*,com.app.util.*,com.app.bean.db.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
List<SelectListItem> movieList=(List<SelectListItem>)request.getAttribute(Constant.TempDataKeys.MOVIES_URLS);
if(movieList==null){
	movieList=new ArrayList<SelectListItem>();
}
%>
<c:url value="/" var="sBaseUrl" />
<%for(int i=0;i<movieList.size();i++){ %>
<li><a href="${sBaseUrl}images/movieImages/<%=movieList.get(i).getText() %>" title=""></a></li>
<%} %>

