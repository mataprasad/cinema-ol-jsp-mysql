<%@tag import="java.util.*,com.app.bean.json.*,com.app.bean.vm.*,com.app.util.*,com.google.gson.Gson" 
       description="" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
    VMBookTicket obj = (VMBookTicket) request.getAttribute(Constant.TempDataKeys.TICKET_DATA);
    List<SelectListItem> rows = null;
    if (obj != null) {
        rows = obj.getSheats();
    }
    if (rows == null) {
        rows = new ArrayList<SelectListItem>();
    }
    for (SelectListItem row : rows) {
%>

<tr>
    <td class="style2"  style="background-color: #CCCCCC">&nbsp;</td>
    <td class="style3"  align="center"  style="background-color: #CCCCCC">
        <%=row.getText()%> </td>
    <td align="left"  style="background-color: #CCCCCC">
        <%=row.getValue()%> </td>
    <td style="background-color: #CCCCCC">&nbsp;</td>
</tr>

<%}%>
