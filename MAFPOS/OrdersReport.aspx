<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersReport.aspx.cs" Inherits="POS.UI.OrdersReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnShowReport" runat="server" Text="Show Report" OnClick="btnShowReport_Click" OnClientClick="document.forms[0].target = '_blank';" />
</asp:Content>
