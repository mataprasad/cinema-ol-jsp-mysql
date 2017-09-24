<%@tag
	import="java.util.*,com.app.bean.json.*,com.app.bean.db.*,com.app.util.*"
	description="Movie Detail" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	List<MovieInfo> movieList = (List<MovieInfo>) request.getAttribute(Constant.TempDataKeys.MOVIE_LIST);
	if (movieList == null) {
		movieList = new ArrayList<MovieInfo>();
	}
%>
<%
	for (int i = 0; i < movieList.size(); i++) {
%>
<h3>
	<a href="#"><%=movieList.get(i).getMovie_Title() %></a><c:url value="/" var="sBaseUrl"/>
</h3>
<div>
	<div style="padding: 5px; margin: 0px auto 0px auto; width: 100%;">

		<div
			style="padding: 0px; margin: 5px auto 5px auto; border: 1px solid #000000; width: 600px; height: 300px;">
			<img src="${sBaseUrl}images/movieImages/<%=movieList.get(i).getMovie_ImageURL() %>" style="height: 300px; width: 600px;"
				alt="" />
		</div>
		<div
			style="padding: 0px; margin: 0px auto 0px auto; width: 100%; height: 218px;">
			<div style="height: 20px;"></div>
			<table border="1" class="style1">
				<tr>
					<td class="style2"><span
						style="height: 30px; display: block; line-height: 30px; vertical-align: middle; text-align: left; color: #000000; font-weight: bold; font-size: 15pt; padding: 0px 0px 0px 10px; margin: 0px">DIRECTOR
							: </span></td>
					<td align="left"><%=movieList.get(i).getMovie_Director() %></td>
				</tr>
				<tr>
					<td class="style2"
						style="border-color: black; border-style: none; border-width: 1px;">
						<span
						style="height: 30px; display: block; line-height: 30px; vertical-align: middle; text-align: left; color: #000000; font-weight: bold; font-size: 15pt; padding: 0px 0px 0px 10px; margin: 0px">CASTS
							: </span>
					</td>
					<td rowspan="4">
						<div align="left" style="height: 85px"><%=movieList.get(i).getMovie_Casts() %></div>
					</td>
				</tr>
				<tr>
					<td class="style2"
						style="border-color: black; border-style: none; border-width: 1px;">&nbsp;</td>
				</tr>
				<tr>
					<td class="style2"
						style="border-color: black; border-style: none; border-width: 1px;">&nbsp;</td>
				</tr>
				<tr>
					<td class="style2"
						style="border-color: black; border-style: none; border-width: 1px;">&nbsp;</td>
				</tr>
				<tr>
					<td class="style2"><span
						style="height: 30px; display: block; line-height: 30px; vertical-align: middle; text-align: left; color: #000000; font-weight: bold; font-size: 15pt; padding: 0px 0px 0px 10px; margin: 0px">RELEASE
							DATE : </span></td>
					<td align="left"><%=movieList.get(i).getMovie_ReleaseDate() %></td>
				</tr>
				<tr>
					<td class="style2"><span
						style="height: 30px; display: block; line-height: 30px; vertical-align: middle; text-align: left; color: #000000; font-weight: bold; font-size: 15pt; padding: 0px 0px 0px 10px; margin: 0px">LANGUAGE
							: </span></td>
					<td align="left"><%=movieList.get(i).getMovie_Language() %></td>
				</tr>
			</table>
		</div>
	</div>
</div>
<%
	}
%>