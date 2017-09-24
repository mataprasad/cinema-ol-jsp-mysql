<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:_layout>
    <jsp:attribute name="head">
        <style type="text/css">
            @media print {
                #LoginRegister a {
                    display: none;
                    visibility: hidden;
                }

                #btnPrint {
                    display: none;
                    visibility: hidden;
                }

                #lblTicketNo {
                    color: black;
                }
            }

            .style1 {
                width: 100%;
                border-collapse: separate;
                padding-left: 10px;
            }

            .style2 {
                width: 128px;
            }



            .style4 {
                width: 128px;
                height: 21px;
            }

            .style5 {
                height: 21px;
            }

            #content_ {
                padding: 5px;
                margin: 5px auto 0px auto;
                width: 980px;
                background-color: #FFFFFF;
                border: 1px solid #808080;
                height: 400px;
            }
        </style>
        <script type="text/javascript">

            function mypopup(url) {
                width = window.screen.width;
                height = window.screen.height;
                mywindow = window.open(url, "CinemaOL", "location=0,status=1,scrollbars=1,resizable=1,menubar=0,toolbar=no,width=" + width + ",height=" + height);
                mywindow.moveTo(0, 0);
                mywindow.focus();
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div id="content_">
            <div
                style="border: 1px solid #333333; padding: 0px; margin: 10px auto 0px auto; width: 600px; height: 380px;">
                <div
                    style="border-style: none none solid none; border-width: 1px; border-color: #333333; height: 30px; background-color: #6600CC;">
                    <a
                        style="font-size: 15pt; color: White; display: block; vertical-align: middle; line-height: 30px; text-align: justify; margin-left: 7px;">TICKET
                        DETAIL, FOR TICKET NO. : <span id="lblTicketNo">${ticketData.getTicket_No()}</span>
                    </a>&nbsp;
                    <table class="style1">
                        <tr>
                            <td class="style2" style="background-color: #FF9900">Online
                                Ticket No. :</td>
                            <td class="style3" style="background-color: #FF9900"><span
                                    id="lblOlTktNo" style="color: White; font-weight: bold;">${ticketData.getTicket_No()}</span>
                            </td>
                            <td style="background-color: #FF9900">Booking Date :</td>
                            <td style="background-color: #FF9900"><span id="lblBookingDate"
                                                                        style="color: White; font-weight: bold;">${ticketData.getBooking_Date()}</span></td>
                        </tr>
                        <tr>
                            <td class="style2" style="background-color: #FF9900">Show Date :</td>
                            <td class="style3" style="background-color: #FF9900"><span
                                    id="lblShowDate" style="color: White; font-weight: bold;">${ticketData.getShow_Date()}</span>
                            </td>
                            <td style="background-color: #FF9900">Show Time :</td>
                            <td style="background-color: #FF9900"><span id="lblShowTime"
                                                                        style="color: White; font-weight: bold;">${ticketData.getShow_Time()}</span></td>
                        </tr>
                        <tr>
                            <td class="style2" style="background-color: #FF9900">Movie Title
                                :</td>
                            <td class="style3" colspan="3" style="background-color: #FF9900">
                                <span id="lblMovieTitle"
                                      style="color: White; font-weight: bold;">${ticketData.getMovie_Name()}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" style="background-color: #FF9900">Total Sheats
                                :</td>
                            <td class="style3" style="background-color: #FF9900"><span
                                    id="lblTotalSheats" style="color: White; font-weight: bold;">${ticketData.getSheats().size()}</span>
                            </td>

                            <td style="background-color: #FF9900">Total Cost :</td>
                            <td style="background-color: #FF9900"><span id="lblTotalCost"
                                                                        style="color: White; font-weight: bold;"> ${ticketData.getTotalCost()}</span></td>
                        </tr>
                        <tr>
                            <td class="style2">&nbsp;</td>
                            <td class="style3">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">Sheat&#39;s Details : --</td>
                            <td class="style5"></td>
                            <td class="style5"></td>
                            <td class="style5"></td>
                        </tr>
                        <t:_bookingDetail></t:_bookingDetail>
                            <tr>
                                <td class="style2">&nbsp;</td>
                                <td class="style3" align="center">&nbsp;</td>
                                <td align="center">&nbsp;</td>
                                <td align="right"><a id="btnPrint"
                                                     href='javascript:mypopup("<c:url value="/user?do=booking-detail&print=1&id="/>${ticketData.getTicket_Id()}");'
                                    style="display: block; width: 100px; height: 25px; line-height: 25px; vertical-align: middle; text-align: center; background-color: #6600CC; color: #FFFFFF; font-weight: bold;">PRINT</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </jsp:body>
</t:_layout>
