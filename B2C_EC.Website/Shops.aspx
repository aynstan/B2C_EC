<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="Shops.aspx.cs" Inherits="B2C_EC.Website.Shops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <table class="auto-style1">
        <tr>
            <td style="width:50%; text-align:center;">
                <table cellpadding="0" cellspacing="0" style="border: 1px solid #e5e5e5; font-size: 13px; margin: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);margin-right:2%;border-radius: 5px;" width="98%";>
                    <tbody style="border: 0px; font-size: 13px; margin: 0px; padding: 0px;">
                        <tr style="border: none; font-size: 13px; margin: 0px; padding: 0px 0px 10px;">
                            <td style="border: none; font-size: 13px; margin: 0px; padding: 0px; font-weight: normal; vertical-align: top; text-align: left; font-family: Arial, Helvetica, sans-serif; font-style: normal;" width="24%"><a href="#" style="border: 0px; font-size: 13px; margin: 0px; padding: 0px; cursor: pointer; color: rgb(33, 33, 33); text-decoration: none; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;">
                                <br class="Apple-interchange-newline" />
                                <img alt="" border="0" src="Resources/ImagesDesign/noimageshop.jpg" style="border: none; font-size: 0px; margin: 0px; padding: 0px; color: transparent; vertical-align: middle; max-width: 100%;width:98%; box-shadow: none; border-top-left-radius: 0px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px;" /></a><span style="border: 0px; font-size: 11.5px; margin: 0px; padding: 0px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;"><br />
                                <span style="font-size: 11.5px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;"><b style="font-size: 12px; font-weight: bold; color: rgb(255, 0, 0);">Shop name</b></span><br />
                                Address: Address shop<br />
                                Tel : xxx-xxxx</span></td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td style="width:50%; text-align:center;">
                <table cellpadding="0" cellspacing="0" style="border: 1px solid #e5e5e5; font-size: 13px; margin: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);margin-right:2%;border-radius: 5px;" width="98%">
                    <tbody style="border: 0px; font-size: 13px; margin: 0px; padding: 0px;">
                        <tr style="border: none; font-size: 13px; margin: 0px; padding: 0px 0px 10px;">
                            <td style="border: none; font-size: 13px; margin: 0px; padding: 0px; font-weight: normal; vertical-align: top; text-align: left; font-family: Arial, Helvetica, sans-serif; font-style: normal;" width="24%"><a href="#" style="border: 0px; font-size: 13px; margin: 0px; padding: 0px; cursor: pointer; color: rgb(33, 33, 33); text-decoration: none; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;">
                                <br class="Apple-interchange-newline" />
                                <img alt="" border="0" src="Resources/ImagesDesign/noimageshop.jpg" style="border: none; font-size: 0px; margin: 0px; padding: 0px; color: transparent; vertical-align: middle; max-width: 100%;width:98%; box-shadow: none; border-top-left-radius: 0px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px;" /></a><span style="border: 0px; font-size: 11.5px; margin: 0px; padding: 0px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;"><br />
                                <span style="font-size: 11.5px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;"><b style="font-size: 12px; font-weight: bold; color: rgb(255, 0, 0);">Shop name</b></span><br />
                                Address: Address shop<br />
                                Tel : xxx-xxxx</span></td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width:50%; text-align:center;">
                <table cellpadding="0" cellspacing="0" style="border: 1px solid #e5e5e5; font-size: 13px; margin: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);margin-right:2%;margin-top:2%;border-radius: 5px;" width="98%">
                    <tbody style="border: 0px; font-size: 13px; margin: 0px; padding: 0px;">
                        <tr style="border: none; font-size: 13px; margin: 0px; padding: 0px 0px 10px;">
                            <td style="border: none; font-size: 13px; margin: 0px; padding: 0px; font-weight: normal; vertical-align: top; text-align: left; font-family: Arial, Helvetica, sans-serif; font-style: normal;" width="24%"><a href="#" style="border: 0px; font-size: 13px; margin: 0px; padding: 0px; cursor: pointer; color: rgb(33, 33, 33); text-decoration: none; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;">
                                <br class="Apple-interchange-newline" />
                                <img alt="" border="0" src="Resources/ImagesDesign/noimageshop.jpg" style="border: none; font-size: 0px; margin: 0px; padding: 0px; color: transparent; vertical-align: middle; max-width: 100%;width:98%; box-shadow: none; border-top-left-radius: 0px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px;" /></a><span style="border: 0px; font-size: 11.5px; margin: 0px; padding: 0px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;"><br />
                                <span style="font-size: 11.5px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;"><b style="font-size: 12px; font-weight: bold; color: rgb(255, 0, 0);">Shop name</b></span><br />
                                Address: Address shop<br />
                                Tel : xxx-xxxx</span></td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td style="width:50%; text-align:center;">
                <table cellpadding="0" cellspacing="0" style="border: 1px solid #e5e5e5; font-size: 13px; margin: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);margin-right:2%;margin-top:2%;border-radius: 5px;" width="98%">
                    <tbody style="border: 0px; font-size: 13px; margin: 0px; padding: 0px;">
                        <tr style="border: none; font-size: 13px; margin: 0px; padding: 0px 0px 10px;">
                            <td style="border: none; font-size: 13px; margin: 0px; padding: 0px; font-weight: normal; vertical-align: top; text-align: left; font-family: Arial, Helvetica, sans-serif; font-style: normal;" width="24%"><a href="#" style="border: 0px; font-size: 13px; margin: 0px; padding: 0px; cursor: pointer; color: rgb(33, 33, 33); text-decoration: none; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;">
                                <br class="Apple-interchange-newline" />
                                <img alt="" border="0" src="Resources/ImagesDesign/noimageshop.jpg" style="border: none; font-size: 0px; margin: 0px; padding: 0px; color: transparent; vertical-align: middle; max-width: 100%;width:98%; box-shadow: none; border-top-left-radius: 0px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px;" /></a><span style="border: 0px; font-size: 11.5px; margin: 0px; padding: 0px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;"><br />
                                <span style="font-size: 11.5px; font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal;"><b style="font-size: 12px; font-weight: bold; color: rgb(255, 0, 0);">Shop name</b></span><br />
                                Address: Address shop<br />
                                Tel : xxx-xxxx</span></td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
