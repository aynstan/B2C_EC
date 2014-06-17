<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="CreateCustomer.aspx.cs" Inherits="B2C_EC.Website.Admincp.CreateCustomer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="createcustomer">
        <h2>Add New Customer Page</h2>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtFirstName" ValidationGroup="createcustomer"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtLastName" ValidationGroup="createcustomer"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Username
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="createcustomer"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="createcustomer"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtConfirm" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="createcustomer" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirm" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="createcustomer"></asp:CompareValidator>
                    </td>
                </tr>                
                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:RadioButtonList ID="rdbtnGender" runat="server" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="10" CssClass="RadioButton">
                            <asp:ListItem Selected="True" Text="Male" Value="true"></asp:ListItem>
                            <asp:ListItem Text="FeMale" Value="fasle"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Phone
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" CssClass="TextBox" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Email
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="createcustomer"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Date Of Birth
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDateOfBirth" CssClass="TextBox" placeholder="mm/dd/yyyy" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txtDateOfBirth_CalendarExtender" runat="server" CssClass="orange" Enabled="True" Format="MM/dd/yyyy" TargetControlID="txtDateOfBirth">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                </table>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="createcustomer" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-Customer.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
