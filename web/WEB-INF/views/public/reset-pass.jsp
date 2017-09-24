<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         import="java.util.*,com.app.bean.json.*,com.app.util.*"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<t:_layout>
    <jsp:attribute name="head">
        <style type="text/css">
            .style1 {
                width: 100%;
            }

            .style2 {
                width: 400px;
            }

            .style4 {
                width: 218px;
            }
        </style>
        <script type="text/javascript">
            function fn_ValidateForm() {
                var step = $("#Step").val();
                if (step == 1) {
                    if ($("#txtUserName").val() == "") {
                        alert("Enter user name.");
                        return false;
                    }
                }
                if (step == 2) {
                    if ($("#txtSA").val() == "") {
                        alert("Enter security answer.");
                        return false;
                    }
                }
                if (step == 3) {
                    if ($("#txtNewPass").val() == "") {
                        alert("Enter password.");
                        return false;
                    }
                    if ($("#txtRePass").val() == "") {
                        alert("Enter re-type password.");
                        return false;
                    }
                    if ($("#txtRePass").val() != $("#txtNewPass").val()) {
                        alert("Entered password and re-type password does not matched.");
                        return false;
                    }
                }
                return true;
            }
        </script>

    </jsp:attribute>
    <jsp:body>

        <form action="<c:url value="/public?do=reset-pass"/>" method="post"
              onsubmit="return fn_ValidateForm();">
            <div
                style="padding: 10px; margin: 0px auto 0px auto; width: 800px; text-align: center;">
                <div
                    style="border: 1px solid #333333; padding: 0px; margin: 0px auto 0px auto; width: 600px; height: 300px;">
                    <div
                        style="border-style: none none solid none; border-width: 1px; border-color: #333333; height: 30px; background-color: #6600CC;">
                        <a
                            style="font-size: 15pt; color: White; display: block; vertical-align: middle; line-height: 30px; text-align: justify; margin-left: 7px;">RESET
                            YOUR PASSWORD HERE</a>
                    </div>
                    <div>


                        <c:if test="${step == '1'}">
                            <div align="center">
                                <table class="style2">
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right">Enter Your User Name</td>
                                        <td align="left">
                                            <input name="txtUserName" id="txtUserName" type="text"
                                                   style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td align="left"><input type="image" name="btnNext"
                                                                style="height: 30px; width: 100px;"
                                                                src="<c:url value="/images/appImages/btnNext.png"/>" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3"></td>
                                    </tr>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${step == '2'}">
                            <div align="center">
                                <table class="style2">
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right">Your security question :</td>
                                        <td align="left">
                                            <input type="text" readonly="readonly" value="${sq}"
                                                   style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right">Enter Your Answer :</td>
                                        <td align="left">
                                            <input name="sa" id="txtSA" type="text" value=""
                                                   style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td align="left"><input type="image" name="btnNext1"
                                                                style="height: 30px; width: 100px;"
                                                                src="<c:url value="/images/appImages/btnNext.png"/>" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"></td>
                                    </tr>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${step == '3'}">
                            <div align="center">
                                <table class="style2">
                                    <tr>
                                        <td class="style4">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style4">Enter New Password :</td>
                                        <td align="left">
                                            <input name="txtNewPass" id="txtNewPass" type="password"
                                                   style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                        </td>
                                        <td align="left"></td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style4">Re-Enter New Password :</td>
                                        <td align="left">
                                            <input name="txtRePass" id="txtRePass" type="password"
                                                   style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                        </td>
                                        <td align="left"></td>
                                    </tr>
                                    <tr>
                                        <td class="style4">&nbsp;</td>
                                        <td align="left"></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style4">&nbsp;</td>
                                        <td align="left"><input type="image" name="btnChange"
                                                                style="height: 30px; width: 130px;"
                                                                src="<c:url value="/images/appImages/btnChangePass.png"/>" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style3" colspan="3"></td>
                                    </tr>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${msg!=null && msg != ''}">
                            <div
                                style="border: 1px solid #993333; text-align: center; padding: 5px; height: 60px; margin: 0px auto 0px auto; width: 390px; background-color: #FF9900; text-align: left; vertical-align: middle; display: block; font-weight: bold; color: #000000;">
                                <p style="text-align: center; width: 100%;">${msg }</p>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
            <input type="hidden" name="step" id="Step" value="${step}" />
            <input type="hidden" name="hdUser" id="hdUser" value="${hdUser}" />

        </form>

    </jsp:body>
</t:_layout>
