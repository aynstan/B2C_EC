<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="B2C_EC.Website.Payment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" lang="javascript">
        function DdlCustomValidator_ClientValidate(source, args) {
            if (document.getElementById("<%= ddlMonth.ClientID %>").value == "0" || document.getElementById("<%= drdYear.ClientID %>").value == "0") {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
        function Validate() {           
            var isValid = false;
                isValid = Page_ClientValidate('payment');
                if(isValid){
                    isValid = Page_ClientValidate('recipient');
            }
            return isValid;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <div id ="viewcart">
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width:300px">                    
                    <p class="checkoutTitle">RECIPIENT INFORMATION</p>
                    <table style="width:100%">
                        <tr>
                            <td>Full Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtFullName"
                                                runat="server" ForeColor="Red" Text="*" ErrorMessage="*" ValidationGroup="recipient"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtFullName" runat="server" CssClass="TextBox" MaxLength="250"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Phone<asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="txtPhone"
                                                runat="server" ForeColor="Red" Text="*" ErrorMessage="*" ValidationGroup="recipient"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox" MaxLength="50"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Email<asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ControlToValidate="txtEmail"
                                                runat="server" ForeColor="Red" Text="*" ErrorMessage="*" ValidationGroup="recipient"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ControlToValidate="txtEmail"
                                                runat="server" ForeColor="Red" Text="*" ErrorMessage="*" ValidationGroup="recipient" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" MaxLength="250"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Street<asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ControlToValidate="txtStreet"
                                                runat="server" ForeColor="Red" Text="*" ErrorMessage="*" ValidationGroup="recipient"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtStreet" runat="server" CssClass="TextBox" MaxLength="200"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>City<asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ControlToValidate="txtCity"
                                                runat="server" ForeColor="Red" Text="*" ErrorMessage="*" ValidationGroup="recipient"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtCity" runat="server" CssClass="TextBox" MaxLength="100"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>State<asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" ControlToValidate="txtState"
                                                runat="server" ForeColor="Red" Text="*" ErrorMessage="*" ValidationGroup="recipient"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtState" runat="server" CssClass="TextBox" MaxLength="100"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Country<asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ControlToValidate="txtCountry"
                                                runat="server" ForeColor="Red" Text="*" ErrorMessage="*" ValidationGroup="recipient"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtCountry" runat="server" CssClass="TextBox" MaxLength="100"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>ZipCode<asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ControlToValidate="txtZipCode"
                                                runat="server" ForeColor="Red" Text="*" ErrorMessage="*" ValidationGroup="recipient"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtZipCode" runat="server" CssClass="TextBox" MaxLength="50"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Notes</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtNotes" runat="server" CssClass="TextBox" Height="80px" Rows="3" TextMode="MultiLine" MaxLength="350"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
                <td>                    
                    <p class="checkoutTitle">PAYMENT INFORMATION</p>
                    <asp:TabContainer ID="tabContainer" runat="server" ActiveTabIndex="2" Width="96%">
                        <asp:TabPanel runat="server" HeaderText="Online Payment" ID="TabPaneOnlinePayment">
                            <ContentTemplate>                                
                                <table style="width:100%">
                                    <tr>
                                        <td valign="top" colspan="2">
                                            <b style="font-size: 13px">Payment Types Accepted</b>
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
                                <div style="text-align:center;margin-top:15px"><asp:Button ID="btnOrderPaymentOnline" runat="server" Text="Order Now" CssClass="Button" OnClick="btnOrder_Click" OnClientClick="return Validate();" /></div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel runat="server" HeaderText="Delivery" ID="TabPanelDelivery">
                            <ContentTemplate>
                                <br />
                                <p>We will delivery your door and collect the money!</p>  
                                <p>Please add delivery charges 10,000 VND to 30,000 VND HCM City and other areas outside of HCMC.</p>
                                <br />
                                <div style="text-align:center;margin-top:15px"><asp:Button ID="btnOrderDelivery" runat="server" Text="Order Now" CssClass="Button" OnClick="btnOrder_Click" ValidationGroup="recipient"/></div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel runat="server" HeaderText="Office" ID="TabPanelOffice">
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
                                <div style="text-align:center;margin-top:15px"><asp:Button ID="btnOrderOffice" runat="server" Text="Order Now" CssClass="Button" OnClick="btnOrder_Click" ValidationGroup="recipient" /></div>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>                    
                </td>
            </tr>
            <tr>
                <td style="height:15px"></td>
            </tr>
            <tr>
                <td align="center" colspan="2" valign="top" style="padding:15px;border:1px dotted">
                    <asp:GridView ID="grvViewCart" runat="server" AutoGenerateColumns="False" CellPadding="5" ShowHeaderWhenEmpty="True"
                        ShowFooter="false" Width="100%" >
                        <Columns>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <a href="#" class="name"><%# Eval("ProductName") %></a>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" >
                            <ItemStyle HorizontalAlign="Center" Width="100px" CssClass="textbox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Price" DataFormatString="${0:#,###.##}" HeaderText="Price"
                                HtmlEncode="False" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Center" Width="150px" ForeColor="#B12704" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="Thanh_tien" DataFormatString="{0:#,##0}" HeaderText=""
                                HtmlEncode="False" ReadOnly="True" />--%>                            
                        </Columns>
                        <EmptyDataTemplate>
                            Your shopping cart is empty
                        </EmptyDataTemplate>
                        <HeaderStyle CssClass="grvHeader" />
                        <AlternatingRowStyle BackColor="WhiteSmoke" />
                        <SelectedRowStyle BackColor="ActiveBorder" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="height:15px"></td>
            </tr>
            <tr>
                <td align="right" colspan="2" style="height: 43px;color:#333;font-weight:bold" valign="top">
                    Subtotal (<asp:Label ID="lbTotalQuantity" runat="server" Text="5"></asp:Label> &nbsp;items): <asp:Label ID="lbTotalPrice" runat="server" Text="$2,162.63" ForeColor="#B12704"></asp:Label>
                </td>
            </tr>
        </table>    
    </div>
</asp:Content>
