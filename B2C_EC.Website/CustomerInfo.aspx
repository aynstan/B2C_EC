<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="B2C_EC.Website.CustomerInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <div id="customer">
    <p class="checkoutTitle">Customer INFORMATION</p>
    <asp:TabContainer ID="tabContainer" runat="server" ActiveTabIndex="0" Width="96%">        
        <asp:TabPanel runat="server" HeaderText="General Information" ID="TabPanelGeneral">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td valign="top" colspan="2">
                            <b style="font-size: 13px">General Information</b>
                        </td>
                    </tr>
                    <tr>
                    <td style="width: 150px;" align="right" valign="top" class="body">
                        First Name:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox" MaxLength="50" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="General"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                    <td align="right" valign="top" class="body" >
                        Last Name:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox" MaxLength="50" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="General"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    <tr>
                    <td align="right" valign="top" class="body">
                        Email:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="(*)" ForeColor="Red" Display="Dynamic" ValidationGroup="General"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="General"></asp:RegularExpressionValidator>
                    </td>
                    </tr>                        
                    <tr>
                    <td align="right" valign="top" class="body">
                        Phone:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="General"></asp:RequiredFieldValidator>
                    </td>
                    </tr>                       
                    <tr>
                    <td align="right" valign="top" class="body">
                        Date Of Birth:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="TextBox" placeholder="mm/dd/yyyy" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="General"></asp:RequiredFieldValidator>
                        <asp:CalendarExtender ID="txtDateOfBirth_CalendarExtender" runat="server" CssClass="orange" Enabled="True" Format="MM/dd/yyyy" TargetControlID="txtDateOfBirth">
                        </asp:CalendarExtender>                
                    </td>
                    </tr>
                    <tr>
                    <td align="right" valign="top" class="body">
                        Gender:</td>
                    <td align="left" valign="top">
                        <asp:RadioButtonList ID="rdbtnGender" runat="server" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="10" CssClass="RadioButton">
                            <asp:ListItem Selected="True" Text="Male" Value="true"></asp:ListItem>
                            <asp:ListItem Text="FeMale" Value="fasle"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    </tr>
                    </tr>
                    <td align="right" class="body" valign="top">Date Created:</td>
                    <td align="left" valign="top">
                        <asp:Label ID="lbDateCreated" runat="server"></asp:Label>
                    </td>
                    <tr>
                    <td></td>
                    <td><asp:Button ID="btnGenaral" runat="server" class="Button" Text="Update" ValidationGroup="General" OnClick="btnGenaral_Click" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="lbMessageGenaral" runat="server" Font-Bold="True" ForeColor="#0000CC"></asp:Label></td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" HeaderText="Login Information" ID="TabPaneLogin">
            <ContentTemplate>                                
                <table style="width:100%">
                    <tr>
                        <td valign="top" colspan="3">
                            <b style="font-size: 13px">Login Information</b>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" align="right">
                            Username:
                        </td>
                        <td style="text-align: left;width: 200px;">
                            <asp:Label ID="lbUsername" runat="server"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" align="right">
                            Password: 
                        </td>
                        <td align="left">
                            <asp:Label ID="lbPassword" runat="server" Text="********"></asp:Label>
                        </td>
                        <td><a id="spanChangePassword" runat="server" href="javascript:void(0)">Change Password</a> </td>
                    </tr>
                </table>
                <asp:ModalPopupExtender ID="ModalPopupChangePassword" runat="server" X="250"
                    CancelControlID="btnCloseChangePassword" PopupDragHandleControlID="pnChangePasswordDrag"
                    PopupControlID="pnChangePassword"
                    TargetControlID="spanChangePassword" DynamicServicePath="" Enabled="True">
                </asp:ModalPopupExtender>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" HeaderText="Address information" ID="TabPanelAddress">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td valign="top" colspan="2">
                            <b style="font-size: 13px">Address Information</b>
                        </td>
                    </tr>
                    <tr>
                    <td style="width: 150px;" align="right" valign="top" class="body">
                        Street1:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtStreet1" runat="server" CssClass="TextBox" MaxLength="50" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtStreet1" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="Address"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                    <td align="right" valign="top" class="body" >
                        Street2:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtStreet2" runat="server" CssClass="TextBox" MaxLength="50" />
                    </td>
                    </tr>
                    <tr>
                    <td align="right" valign="top" class="body">
                        City:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtCity" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity" ErrorMessage="(*)" ForeColor="Red" Display="Dynamic" ValidationGroup="Address"></asp:RequiredFieldValidator>
                    </td>
                    </tr>                        
                    <tr>
                    <td align="right" valign="top" class="body">
                        State:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtState" runat="server" CssClass="TextBox" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtState" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="Address"></asp:RequiredFieldValidator>
                    </td>
                    </tr>                       
                    <tr>
                    <td align="right" valign="top" class="body">
                        Country:</td>
                    <td align="left" valign="top"><asp:TextBox ID="txtCountry" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCountry" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="Address"></asp:RequiredFieldValidator>                
                    </td>
                    </tr>
                    <tr>
                    <td align="right" valign="top" class="body">
                        Zip Code:</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtZipCode" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtZipCode" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="Address"></asp:RequiredFieldValidator>                
                    </td>
                    </tr>
                    <tr>
                    <td></td>
                    <td><asp:Button ID="btnAddress" runat="server" class="Button" Text="Update" ValidationGroup="Address" OnClick="btnAddress_Click" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="lbMessageAddress" runat="server" Font-Bold="True" ForeColor="#0000CC"></asp:Label></td>
                    </tr>
                </table>                
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    </div>
   
    <asp:Panel ID="pnChangePassword" CssClass="Popup" runat="server" Width="500px" Style="display: none;">
        <asp:Panel ID="pnChangePasswordDrag" CssClass="PopupTitle" runat="server">Change Password Form</asp:Panel>
        <div class="PopupTable">                                
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
            <table width="100%" border="0" cellpadding="2" cellspacing="5">
                <tr>
                    <td>&nbsp;</td>
                    <td><asp:Label ID="lbChangePassword" runat="server" EnableViewState="false" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td style="text-align:right;width:170px"><strong>Current Password:</strong>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCurrentPassword" CssClass="TextBox" placeholder="Input current password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCurrentPassword" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="change"></asp:RequiredFieldValidator>
                    </td>
                </tr>                            
                <tr>
                    <td style="text-align: right"><strong>New Password:</strong>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewPassword" CssClass="TextBox" placeholder="Input new password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="change"></asp:RequiredFieldValidator>
                    </td>
                </tr>                            
                <tr>
                    <td style="text-align: right"><strong>Confirm Password:</strong>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" CssClass="TextBox" placeholder="Input confirm password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="change"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="change"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">&nbsp;</td>
                    <td>      
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnOkChangePassword" runat="server" CssClass="Button" Text="Ok" ValidationGroup="change" OnClick="UpdatePassword"/>
                        <asp:Button ID="btnCloseChangePassword" runat="server" CssClass="Button" Text="Cancel" OnClick="CloseChangePasswordForm" />
                    </td>
                </tr>
            </table>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnOkChangePassword" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        </div>
    </asp:Panel>
</asp:Content>
