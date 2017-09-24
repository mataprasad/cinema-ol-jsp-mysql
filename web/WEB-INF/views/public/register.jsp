<%@ page language="java" contentType="text/html; charset=UTF-8"
         import="java.util.*,com.app.bean.json.*,com.app.util.*"
         pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:_layout>
    <jsp:attribute name="head">
        <style type="text/css">
            .style1 {
                width: 100%;
            }

            .style2 {
                width: 192px;
            }

            .style3 {
                width: 163px;
            }

            .style4 {
                height: 34px;
            }

            .style5 {
                width: 192px;
                height: 34px;
            }

            .style6 {
                width: 163px;
                height: 34px;
            }
        </style>

        <script type="text/javascript">
            function fn_ValidateForm() {
                if ($("#txtFName").val() == "") {
                    alert("Please enter first name.");
                    return false;
                }

                if ($("#txtUName").val() == "") {
                    alert("Please enter user name.");
                    return false;
                }

                if ($("#txtUName").val() == "") {
                    alert("Please enter user name.");
                    return false;
                }

                if ($("#txtPass").val() == "") {
                    alert("Please enter password.");
                    return false;
                }

                if ($("#txtRePass").val() == "") {
                    alert("Please enter re-type password.");
                    return false;
                }

                if ($("#txtRePass").val() != $("#txtPass").val()) {
                    alert("Enter passord and re-type password does not matched.");
                    return false;
                }

                if ($("#txtEmail").val() == "") {
                    alert("Please enter email.");
                    return false;
                }

                if ($("#txtCity").val() == "") {
                    alert("Please enter city.");
                    return false;
                }

                if ($("#ddlState").val() == "0") {
                    alert("Please select state.");
                    return false;
                }
                if ($("#txtSQ").val() == "") {
                    alert("Please enter security question.");
                    return false;
                }
                if ($("#txtSA").val() == "") {
                    alert("Please enter security answer.");
                    return false;
                }

                if ($("#txtVeriCode").val() == "") {
                    alert("Please enter verification code.");
                    return false;
                }

                return true;
            }

    function fn_RefreshCaptcha()         {
                $('#captchaImage').attr("src", '<c:url value="/public/captcha.jpg"/>?id=' + new Date().getMilliseconds());
            }
        </script>

    </jsp:attribute>

    <jsp:body>

        <form action="<c:url value="/public?do=register"/>" method="post"
              onsubmit="return fn_ValidateForm();">
            <div
                style="padding: 10px; margin: 0px auto 0px auto; width: 800px; text-align: center;">
                <div
                    style="border: 1px solid #333333; padding: 0px; margin: 0px auto 0px auto; width: 600px; height: 570px;">
                    <div
                        style="border-style: none none solid none; border-width: 1px; border-color: #333333; height: 30px; background-color: #6600CC;">
                        <a
                            style="font-size: 15pt; color: White; display: block; vertical-align: middle; line-height: 30px; text-align: justify; margin-left: 7px;">REGISTER
                            HERE</a>
                    </div>
                    <div>
                        <c:choose>
                            <c:when
                                test="${errorMsg!=null && errorMsg!=''}">
                                <p style="color: red;">${errorMsg}</p>
                            </c:when>
                        </c:choose>
                        <table class="style1">
                            <tr>
                                <td>&nbsp;</td>
                                <td class="style2">&nbsp;</td>
                                <td class="style3">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">First Name :</td>
                                <td align="left" class="style3"><input type="text"
                                                                       name="txtFName" id="txtFName" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">Last Name :</td>
                                <td align="left" class="style3"><input type="text"
                                                                       name="txtLName" id="txtLName" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">User Name :</td>
                                <td align="left" class="style3"><input type="text"
                                                                       name="txtUName" id="txtUName" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left"></td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">Password :</td>
                                <td align="left" class="style3"><input type="password"
                                                                       name="txtPass" id="txtPass" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">Re-type Password :</td>
                                <td align="left" class="style3"><input type="password"
                                                                       name="txtRePass" id="txtRePass" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">Email Id :</td>
                                <td align="left" class="style3"><input type="text"
                                                                       name="txtEmail" id="txtEmail" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">Mobile No :</td>
                                <td align="left" class="style3"><input type="text"
                                                                       name="txtMobile" id="txtMobile" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">Address Line 1 :</td>
                                <td align="left" class="style3"><input type="text"
                                                                       name="txtAdd1" id="txtAdd1" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">Address Line 2 (Optional) :</td>
                                <td align="left" class="style3"><input type="text"
                                                                       name="txtAdd2" id="txtAdd2" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">City :</td>
                                <td align="left" class="style3"><input type="text"
                                                                       name="txtCity" id="txtCity" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">State :</td>
                                <td align="left" class="style3">
                                    <t:_stateDropdown dropdownId="ddlState" onchangeEvent=" "></t:_stateDropdown>
                                    </td>
                                    <td align="left"></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td align="left" class="style2">Security Question :</td>
                                    <td align="left" class="style3"><input type="text"
                                                                           name="txtSQ" id="txtSQ" value=""
                                                                           style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                    </td>
                                    <td align="left"></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td align="left" class="style2">Security Answer :</td>
                                    <td align="left" class="style3"><input type="text"
                                                                           name="txtSA" id="txtSA" value=""
                                                                           style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                    </td>
                                    <td align="left"></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td align="left" class="style2">Verification Code :</td>
                                    <td align="left" class="style3" rowspan="2" id="tdCaptcha">
                                        <img id="captchaImage" src=""
                                             style="border-color: #993333; border-style: solid; border-width: 0px; height: 40px; width: 150px;"/>
                                        <script>
                                            fn_RefreshCaptcha();
                                        </script>
                                    </td>
                                    <td align="left" valign="middle"><a href="#"
                                                                        onclick="fn_RefreshCaptcha();" title="reload verification code."
                                                                        style="padding: 0px; margin: 0px; background-image: url('<c:url value="/resources/refresh.png"/>'); vertical-align:
                                        sub; background-repeat:no-repeat; width: 30px; height: 30px; display:block;"></a></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">&nbsp;</td>
                                <td align="left">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">Enter Verification Code :</td>
                                <td align="left" class="style3"><input type="text"
                                                                       name="txtVeriCode" id="txtVeriCode" value=""
                                                                       style="border-color: #993333; border-style: solid; border-width: 1px; width: 150px;" />
                                </td>
                                <td align="left"></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left" class="style2">&nbsp;</td>
                                <td align="left" class="style3"><input type="image"
                                                                       src="<c:url value="/images/appImages/btnRegister.png"/>" style="height: 30px; width: 100px;" />
                                </td>
                                <td align="left">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style4"></td>
                                <td align="left" class="style5"></td>
                                <td align="left" class="style6">&nbsp;</td>
                                <td align="left" class="style4"></td>
                                <td class="style4"></td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </form>

    </jsp:body>

</t:_layout>
