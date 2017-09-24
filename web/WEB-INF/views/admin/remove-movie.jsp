<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:_layout>
    <jsp:attribute name="head">
        <script type="text/javascript">
            function fn_ValidateForm() {
                if ($("input[name='selectedMovies']:checked").length < 1) {
                    alert("Select atleast one movie to remove.");
                    return false;
                }

                var selectedValue = new Array();
                $("input[name='selectedMovies']:checked").each(function (i, obj) {
                    selectedValue.push($(obj).val());
                });

                $("#hdSelectedMovie").val(JSON.stringify(selectedValue));

                return true;
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <form action="<c:url value="/admin?do=remove-movie"/>" method="post" onsubmit="return fn_ValidateForm();">
            <input type="hidden" name="hdSelectedMovie" id="hdSelectedMovie"/>
            <div style="padding: 0px; margin: 0px; border: 1px solid #3333CC">
                <div>
                    <div style="border-style: none none solid none; border-width: 1px; border-color: #333333; height: 30px; background-color: #6600CC;">
                        <a style="font-size: 15pt; color: White; display: block; vertical-align: middle; line-height: 30px; text-align: justify; margin-left: 7px;">REMOVE MOVIE HERE --</a>
                    </div>
                </div>
                <div align="center">
                    <c:if test="${msg!=null && msg!=''}">
                        <p style="color: red;">${msg}</p>
                    </c:if>
                    <table cellspacing="0" cellpadding="3" rules="all" border="1" style="width: 100%; background-color: White; border-color: #CCCCCC; border-width: 1px; border-style: None; border-collapse: collapse;">
                        <tr style="color: White; background-color: #006699; font-weight: bold;">
                            <th scope="col">Title</th>
                            <th scope="col">Status</th>
                            <th scope="col">Release Date</th>
                            <th scope="col">Select</th>
                        </tr>
                        <c:forEach var="item" items="${movieList}">
                            <tr style="color: #000066;">
                                <td>${item.getMovie_Title()}</td>
                                <td>${item.getMovieStatus_Value()}</td>
                                <td>${item.getMovie_ReleaseDate()}</td>
                                <td>
                                    <input id="selectedMovies" type="checkbox" value="${item.getMovie_Id()}" name="selectedMovies" />
                                </td>
                            </tr> 
                        </c:forEach> 
                    </table>
                    <br />
                    <input type="submit" id="btnRemove" value="Remove" />
                    <br />
                    <br />
                </div>
            </div>
        </form>
    </jsp:body>
</t:_layout>


