<%@ page import="java.util.*,com.app.bean.json.*,com.app.util.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:_layout>
<jsp:attribute name="head">
<style type="text/css">
        .style2 {
            width: 429px;
        }

        .style3 {
            width: 157px;
        }

        .style4 {
        }

        .style5 {
            width: 171px;
        }

    </style>
    <script type="text/javascript">
        function fn_ValidateForm() {
            if ($("#txtCurrentPass").val() =="") {
                alert("Entered current password.");
                return false;
            }
            if ($("#txtNewPass").val() == "") {
                alert("Entered new password.");
                return false;
            }
            if ($("#txtNewRePass").val() == "") {
                alert("Entered re-type new password.");
                return false;
            }
            if ($("#txtNewRePass").val() != $("#txtNewPass").val()) {
                alert("Entered new password and re-entered password are not same.");
                return false;
            }
            return true;
        }
    </script>

</jsp:attribute>

<jsp:body>


<form action="<c:url value="/user?do=change-pwd"/>" method="post" onsubmit="return fn_ValidateForm();">
    <div style="padding: 0px; margin: 0px; width: 100%; height: 400px;">
        <div style="border-style: none none solid none; border-width: 0px 0px 1px 0px; padding: 0px; margin: 0px; width: 200px; height: 40px; float: left; border-bottom-color: #CCCCCC;"></div>
        <div style="padding: 0px; margin: 0px; width: 580px; height: 40px; float: left">
            <div style="float: left; height: 40px; width: 580px;">
                <a href="<c:url value="/user?do=home"/>"  
                style="float: left; border-style: solid none solid solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 90px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">MyAccount</a>
                <a href="<c:url value="/user?do=edit"/>" 
                style="float: left; border-style: solid none solid solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 90px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">EditProfile</a>
                <a href="<c:url value="/user?do=change-pwd"/>"
                style="float: left; border-style: solid none none solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 135px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">ChangePassword</a>
                <a href="<c:url value="/user?do=history"/>"
                style="float: left; border-style: solid; border-width: 1px; border-color: #CCCCCC; display: block; width: 135px; line-height: 40px; height: 39px; vertical-align: middle; text-align: center;">BookingHistroy</a>
                <a
                    style="float: left; border-style: none none solid none; border-width: 1px; border-color: #CCCCCC; display: block; width: 125px; line-height: 39px; height: 40px; vertical-align: middle; text-align: center;"></a>
            </div>

            <div style="padding: 5px; margin: 40px 0px 0px 0px; border-style: none solid solid solid; border-width: 1px; border-color: #CCCCCC; width: 580px; height: 350px;"
                align="center">

                <table class="style2" style="margin: 70px 0px 0px 0px">
                    <tr>
                        <td align="left" class="style5">Current Password</td>
                        <td align="left" class="style3">
                            <input type="password" id="txtCurrentPass" name="txtCurrentPass" style="border-color: #993333; border-style: Solid; border-width: 1px; width: 150px;" />
                        </td>
                        <td align="left"></td>
                    </tr>
                    <tr>
                        <td align="left" class="style5">New Password</td>
                        <td align="left" class="style3">
                            <input type="password" id="txtNewPass" style="border-color: #993333; border-style: Solid; border-width: 1px; width: 150px;" />
                        </td>
                        <td align="left"></td>
                    </tr>
                    <tr>
                        <td align="left" class="style5">Re-type New Passwrd</td>
                        <td align="left" class="style3">
                            <input type="password" id="txtNewRePass" name="txtNewRePass" style="border-color: #993333; border-style: Solid; border-width: 1px; width: 150px;" />
                        </td>
                        <td align="left"></td>
                    </tr>
                    <tr>
                        <td align="left" class="style5">&nbsp;</td>
                        <td align="left" class="style3">

                            <input type="image" onclick="return fn_ValidateForm();" style="height:30px; width:150px;" src="<c:url value="/images/appImages/btnChangePass.png"/>" />
                        </td>
                        <td align="left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" class="style5">&nbsp;</td>
                        <td align="left" class="style3">&nbsp;</td>
                        <td align="left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" class="style4" colspan="3">
                        <c:if test="${ msg!=null && msg!='' }">
                        <div style="display: block; height: 30px; border: 1px solid #993333; background-color: #FF9900; color: #000000; font-size: 12pt; font-weight: bolder; line-height: 30px; vertical-align: middle; text-align: left; padding: 5px">
                                    ${msg }
                                </div>
                        </c:if>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
        <div style="border-style: none none solid none; border-color: #CCCCCC; padding: 0px; margin: 0px; width: 200px; height: 40px; float: left; border-bottom-width: 1px;">
        </div>
    </div>
</form>



</jsp:body>
</t:_layout>
