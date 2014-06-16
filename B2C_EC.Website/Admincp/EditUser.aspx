<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" ViewStateMode="Enabled" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="B2C_EC.Website.Admincp.EditUser" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript">
        var $j = jQuery.noConflict();
        $j(document).ready(function () {
            $j("#<%=txtUserName.ClientID %>").blur(function () {
                $j.ajax({
                    type: "POST",
                    url: "UserDetails.aspx/KiemTraTenDangNhap",
                    data: "{'TenDangNhap':'" + $j("#<%=txtUserName.ClientID %>").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (message) {
                        if (message.d == false) {
                            $j("#checkReturn").css({
                                "color": "red",
                                "font-weight": "bold",
                                "font-size": "small",
                                "padding-left": "5px"
                            });
                            $j("#checkReturn").text("Username is already exists in system");
                            // Ẩn Nút Submit nếu UserName không hợp lệ
                            $j("#btnSave").hide();
                        }
                        else {
                            $j("#checkReturn").css({
                                "color": "green",
                                "font-weight": "bold",
                                "font-size": "small",
                                "padding-left": "5px"
                            });
                            $j("#btnSave").show();
                            $j("#checkReturn").text("")
                        }
                    },
                    error: function (errormessage) {
                        //Hiển thị lỗi nếu xảy ra
                        $j("#checkReturn").text(errormessage.responseText);
                    }
                });
            });

            $j("#<%=txtEmail.ClientID %>").blur(function () {
                $j.ajax({
                    type: "POST",
                    url: "UserDetails.aspx/KiemTraEmail",
                    data: "{'Email':'" + $j("#<%=txtEmail.ClientID %>").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (message) {
                        if (message.d == false) {
                            $j("#checkReturnEmail").css({
                                "color": "red",
                                "font-weight": "bold",
                                "font-size": "small",
                                "padding-left": "5px"
                            });
                            $j("#checkReturnEmail").text("Email is already exists in system");
                            // Ẩn Nút Submit nếu UserName không hợp lệ
                            $j("#btnSave").hide();
                        }
                        else {
                            $j("#checkReturn").css({
                                "color": "green",
                                "font-weight": "bold",
                                "font-size": "small",
                                "padding-left": "5px"
                            });
                            $j("#btnSave").show();
                            $j("#checkReturnEmail").text("")
                        }
                    },
                    error: function (errormessage) {
                        //Hiển thị lỗi nếu xảy ra
                        //$j("#checkReturnEmail").text(errormessage.responseText);
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full_w">
        <div class="h_title">Details User</div>
        <div class="clear">
            <asp:Literal ID="ltrError" Visible="false" runat="server"></asp:Literal>
            <table>
                <tr>
                    <td style="width:20%;">
                        <label for="name">
                            ID
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtID" CssClass="text err" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            First Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Last Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            User Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" CssClass="text err" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                        <label id="checkReturn"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Password
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" CssClass="text err" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Confirm Password
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirm" CssClass="text err" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirm" ErrorMessage="Password is not match!" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Street 1
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStreet1" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Street 2
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStreet2" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            City
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            State
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtState" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Country
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCountry" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            ZipCode
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtZipCode" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Phone
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Email
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is not correct format!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br /><label id="checkReturnEmail"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Is Active
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" runat="server" Text="Active" />
                    </td>
                </tr>
                </table>
            <div class="entry">

                <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>

            </div>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Save" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-User.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
