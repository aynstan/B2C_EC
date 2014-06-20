<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="B2C_EC.Website.Admincp.CreateUser" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.4.1.min.js"></script>
   <%-- <script type="text/javascript">
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
    </script>--%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="adduser">
        <h2>Add New User Page</h2>
        <div class="clear" style="padding:15px">
            <asp:Label ID="lbMessage" runat="server"></asp:Label>
            <table>
                <tr>
                    <td style="width:150px">
                        <label for="name">
                            First Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtFirstName" ValidationGroup="adduser"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Last Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtLastName" ValidationGroup="adduser"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            User Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="adduser"></asp:RequiredFieldValidator>
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
                        <asp:TextBox ID="txtPassword" CssClass="TextBox" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="adduser"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Confirm Password
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirm" CssClass="TextBox" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtConfirm" ValidationGroup="adduser"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirm" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="adduser"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Phone
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtPhone" ValidationGroup="adduser"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Email
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="(*)" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="adduser"></asp:RegularExpressionValidator>
                        <label id="Label1"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Street1:</td>
                    <td><asp:TextBox ID="txtStreet1" runat="server" CssClass="TextBox" MaxLength="50" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtStreet1" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="adduser"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                    <tr>
                    <td>
                        Street2:</td>
                    <td><asp:TextBox ID="txtStreet2" runat="server" CssClass="TextBox" MaxLength="50" />
                    </td>
                    </tr>
                    <tr>
                    <td>
                        City:</td>
                    <td><asp:TextBox ID="txtCity" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity" ErrorMessage="(*)" ForeColor="Red" Display="Dynamic" ValidationGroup="adduser"></asp:RequiredFieldValidator>
                    </td>
                    </tr>                        
                    <tr>
                    <td>
                        State:</td>
                    <td><asp:TextBox ID="txtState" runat="server" CssClass="TextBox" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtState" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="adduser"></asp:RequiredFieldValidator>
                    </td>
                    </tr>                       
                    <tr>
                    <td>
                        Country:</td>
                    <td><asp:TextBox ID="txtCountry" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCountry" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="adduser"></asp:RequiredFieldValidator>                
                    </td>
                    </tr>
                    <tr>
                    <td>
                        Zip Code:</td>
                    <td>
                        <asp:TextBox ID="txtZipCode" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtZipCode" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="adduser"></asp:RequiredFieldValidator>                
                    </td>
                    </tr>
                </table>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="adduser" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-User.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
