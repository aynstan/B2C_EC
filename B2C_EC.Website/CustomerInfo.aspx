<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="B2C_EC.Website.CustomerInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <p class="checkoutTitle">Customer INFORMATION</p>
    <asp:TabContainer ID="tabContainer" runat="server" ActiveTabIndex="1" Width="96%">
        <asp:TabPanel runat="server" HeaderText="Login Information" ID="TabPaneLogin">
            <ContentTemplate>                                
                <table style="width:100%">
                    <tr>
                        <td valign="top" colspan="2">
                            <b style="font-size: 13px">Login Information</b>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" align="right">
                            Type Of Card:<span style="color:Red">*</span>
                        </td>
                        <td style="text-align: left">
                            <asp:DropDownList ID="ddlTypeCard" runat="server" CssClass="Dropdown">
                                <asp:ListItem  ></asp:ListItem>
                                <asp:ListItem Value="1">American Express</asp:ListItem>
                                <asp:ListItem Value="2" Selected="True">Visa</asp:ListItem>
                                <asp:ListItem Value="3">Master Card</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" align="right">
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="rfvdrdTypeCard" Display="Dynamic" ControlToValidate="ddlTypeCard"
                                runat="server" ForeColor="Red" Text="Please select your card" ErrorMessage="Please select your card" Font-Size="Smaller" ValidationGroup="payment"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" align="right">
                            Credit Card Number:<span style="color:Red">*</span>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCardNum" runat="server" Text="4111111111111111" CssClass="TextBox"></asp:TextBox>
                            <br />
                                <asp:RequiredFieldValidator ID="rfvtxtCardNum" Display="Dynamic" ControlToValidate="txtCardNum"
                                runat="server" ForeColor="Red" Text="Please enter your credit card number" ErrorMessage="*" Font-Size="Smaller" ValidationGroup="payment"></asp:RequiredFieldValidator>
                        </td>
                    </tr>                                    
                    <tr>
                        <td style="width: 150px;" align="right">
                            CVC Code:<span style="color:Red">*</span>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCVCCode" runat="server" Text="123" Width="60px" CssClass="TextBox"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvtxtCVCCode" Display="Dynamic" ControlToValidate="txtCVCCode"
                                runat="server" ForeColor="Red" Text="Please enter your 3-digit CVC code" ErrorMessage="*" ValidationGroup="payment" Font-Size="Smaller"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" align="right">
                            Expiration Date:<span style="color:Red">*</span>
                        </td>
                        <td style="text-align: left">
                            <asp:DropDownList ID="ddlMonth" runat="server" Width="70px" CssClass="Dropdown">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="01" Selected="True">Jan</asp:ListItem>
                                <asp:ListItem Value="02">Feb</asp:ListItem>
                                <asp:ListItem Value="03">Mar</asp:ListItem>
                                <asp:ListItem Value="04">Apr</asp:ListItem>
                                <asp:ListItem Value="05">May</asp:ListItem>
                                <asp:ListItem Value="06">Jun</asp:ListItem>
                                <asp:ListItem Value="07">Jul</asp:ListItem>
                                <asp:ListItem Value="08">Aug</asp:ListItem>
                                <asp:ListItem Value="09">Sep</asp:ListItem>
                                <asp:ListItem Value="10">Oct</asp:ListItem>
                                <asp:ListItem Value="11">Nov</asp:ListItem>
                                <asp:ListItem Value="12">Dec</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;
                            <asp:DropDownList ID="drdYear" runat="server" Width="70px" CssClass="Dropdown">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="2014">2014</asp:ListItem>
                                <asp:ListItem Value="2015">2015</asp:ListItem>
                                <asp:ListItem Value="2016" Selected="True">2016</asp:ListItem>
                                <asp:ListItem Value="2017">2017</asp:ListItem>
                                <asp:ListItem Value="2018">2018</asp:ListItem>
                                <asp:ListItem Value="2019">2019</asp:ListItem>
                                <asp:ListItem Value="2020">2020</asp:ListItem>
                                <asp:ListItem Value="2021">2021</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                                <asp:CustomValidator ID="DdlCustomValidator" runat="server" ForeColor="Red" ErrorMessage="Please select your expiration date" Display="Dynamic" ClientValidationFunction="DdlCustomValidator_ClientValidate" Font-Size="Smaller" ValidationGroup="payment" />
                        </td>
                    </tr>
                </table> 
                <div style="text-align:center;margin-top:15px"><asp:Button ID="btnLogin" runat="server" Text="Update" CssClass="Button" /></div>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" HeaderText="General Information" ID="TabPanelGeneral">
            <ContentTemplate>
                <br />
                <p>We will delivery your door and collect the money!</p>  
                <p>Please add delivery charges 10,000 VND to 30,000 VND HCM City and other areas outside of HCMC.</p>
                <br />
                <div style="text-align:center;margin-top:15px"><asp:Button ID="btnGenaral" runat="server" Text="Update" CssClass="Button"/></div>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" HeaderText="Address information" ID="TabPanelAddress">
            <ContentTemplate>
                <br />
                <p>You go to the following address to pay us:</p>
                <br />
                <p>Head office: 97 - 101 Nguyen Cong Tru Street, Nguyen Thai Binh Ward, District 1, Ho Chi Minh City, Vietnam</p> 
                <p>Office: Hall 3, Quang Trung Software City, Tan Chanh Hiep Ward, District 12, Ho Chi Minh City, Vietnam</p> 
                <br />
                <p>E-mail: 	htphongqn@htp.com.vn</p> 
                <p>Telephone: 	(84-8) 3715 8999</p> 
                <p>Fax: 	(84-8) 3715 5985</p> 
                <br />
                <div style="text-align:center;margin-top:15px"><asp:Button ID="btnAddress" runat="server" Text="Update" CssClass="Button" /></div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
