<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:_layout>
    <jsp:attribute name="head">
        <style type="text/css">
            .style1 {
                width: 400px;
                border-collapse: collapse;
            }

            .style2 {
                width: 153px;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <form action="<c:url value="/user?do=tix-book-tkt"/>" method="post">
            <input type="hidden" name="chkSheats" value="${ticketData.getChkSheats()}" />
            <input type="hidden" name="showId" value="${ticketData.getShow_Id()}" />
            <input type="hidden" name="totalCost" value="${ticketData.getTotalCost()}" />
            <input type="hidden" name="totalCount" value="${ticketData.getSheats().size()}" />
            <div style="border: 1px solid #333333; padding: 0px; margin: 5px auto 0px auto;">
                <div style="border-style: none none solid none; border-width: 1px; border-color: #333333; height: 30px; background-color: #6600CC;">
                    <a style="font-size: 15pt; color: White; display: block; vertical-align: middle; line-height: 30px; text-align: justify; margin-left: 7px;">CONFIRM YOUR SELECTION --</a>
                </div>
                <div align="center">

                    <table class="style1">
                        <tr>
                            <td align="left" class="style2">&nbsp;</td>
                            <td align="left">&nbsp;</td>
                            <td align="left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="style2" style="background-color: #FF9900">Movie Title :</td>
                            <td align="left" style="background-color: #FF9900; color: white; font-weight: bold;">
                                ${ticketData.getMovie_Name()}
                            </td>
                            <td align="left" style="background-color: #FF9900">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="style2" style="background-color: #FF9900">Show Date :</td>
                            <td align="left" style="background-color: #FF9900; color: white; font-weight: bold;">
                                ${ticketData.getShow_Date()}
                            </td>
                            <td align="left" style="background-color: #FF9900">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="style2" style="background-color: #FF9900">Show Time :</td>
                            <td align="left" style="background-color: #FF9900; color: white; font-weight: bold;">
                                ${ticketData.getShow_Time()}
                            </td>
                            <td align="left" style="background-color: #FF9900">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="style2" style="background-color: #FF9900">Hall No :</td>
                            <td align="left" style="background-color: #FF9900; color: white; font-weight: bold;">
                                ${ticketData.getHall_No()}
                            </td>
                            <td align="left" style="background-color: #FF9900">&nbsp;</td>
                        </tr>

                        <tr>
                            <td align="left" class="style2" style="background-color: #FF9900">Total Sheats :</td>
                            <td align="left" style="background-color: #FF9900; color: white; font-weight: bold;">
                                ${ticketData.getSheats().size()}
                            </td>
                            <td align="left" style="background-color: #FF9900">&nbsp;</td>
                        </tr>

                        <tr>
                            <td align="center" class="style2" style="background-color: #FF9900">Sheat No</td>
                            <td align="center" style="background-color: #FF9900">Cost</td>
                            <td align="center" style="background-color: #FF9900">&nbsp;</td>
                        </tr>
                        ${ticketData.getSheatsLayout()}
                        <tr>
                            <td align="left" class="style2" style="background-color: #FF9900">&nbsp;</td>
                            <td align="left" style="background-color: #FF9900">&nbsp;</td>
                            <td align="left" style="background-color: #FF9900">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="style2" style="background-color: #FF9900">&nbsp;</td>
                            <td align="left" style="background-color: #FF9900">

                                <input type="image" style="width:100px; height:30px;" src="<c:url value="images/appImages/btnConfirm.png"/>"/>
                            </td>
                            <td align="left" style="background-color: #FF9900"></td>
                        </tr>
                    </table>

                </div>
            </div>
            <br />
            <br />
        </form>
    </jsp:body>
</t:_layout>

