<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="EditManufacturer.aspx.cs" Inherits="B2C_EC.Website.Admincp.EditManufacturer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="updateManufacturer">
        <h2>Update Manufacturer Page</h2>
        <div class="clear" style="padding:15px">
            <asp:Label ID="lbMessage" runat="server"></asp:Label>
            <table>
                <tr>
                    <td style="width:150px">
                        <label for="name">
                            Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="createmanufacturer"></asp:RequiredFieldValidator>
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Website
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWebsite" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="(*)" ControlToValidate="txtWebsite" Display="Dynamic" ForeColor="Red" ValidationGroup="createmanufacturer" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        Street1:</td>
                    <td><asp:TextBox ID="txtStreet1" runat="server" CssClass="TextBox" MaxLength="50" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtStreet1" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="createmanufacturer"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity" ErrorMessage="(*)" ForeColor="Red" Display="Dynamic" ValidationGroup="createmanufacturer"></asp:RequiredFieldValidator>
                    </td>
                    </tr>                        
                    <tr>
                    <td>
                        State:</td>
                    <td><asp:TextBox ID="txtState" runat="server" CssClass="TextBox" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtState" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="createmanufacturer"></asp:RequiredFieldValidator>
                    </td>
                    </tr>                       
                    <tr>
                    <td>
                        Country:</td>
                    <td><asp:TextBox ID="txtCountry" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCountry" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="createmanufacturer"></asp:RequiredFieldValidator>                
                    </td>
                    </tr>
                    <tr>
                    <td>
                        Zip Code:</td>
                    <td>
                        <asp:TextBox ID="txtZipCode" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtZipCode" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="createmanufacturer"></asp:RequiredFieldValidator>                
                    </td>
                    </tr>
                <tr>
                    <td>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Note
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNote" CssClass="TextBox" runat="server" Height="80px" TextMode="MultiLine"></asp:TextBox>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Active
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" runat="server"></asp:CheckBox>                        
                    </td>
                </tr>
            </table>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Update" OnClick="btnSave_Click" ValidationGroup="createmanufacturer" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-Manafacturer.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
