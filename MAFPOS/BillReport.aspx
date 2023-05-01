<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BillReport.aspx.cs" Inherits="POS.BillReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <%-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <script src="Jquery/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
            $("#datepicker1").datepicker();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="container">
        <div class="row-fluid">
            <div class="span6" style="display: none">
                <td valign="top" width="500">
                    <h3>Show sells report</h3>
                    <div id="othleft-sidebar">
                        <br />
                        <table border="0.5" width="100%">
                            <tr>
                                <td width="35%">If change order number then please select order number</td>
                                <td>
                                    <asp:DropDownList ID="ddlOrderlist" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlOrderlist_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="Order No"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOrderNo" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: center;">
                            <asp:Button ID="btnShowReport" runat="server" Text="Show report" BackColor="#7e9d31" ForeColor="White" OnClick="btnShowReport_Click" OnClientClick="document.forms[0].target = '_blank';" />
                        </div>
                        <asp:Label ID="lblShowReportMsg" runat="server" Text=""></asp:Label>
                    </div>
                </td>
            </div>

            <div class="span6">
                <td valign="top" width="500">
                    <h3>All Customers report</h3>
                    <div id="othleft-sidebar">
                        <br />
                        <table border="0.5" width="100%">
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Start Date"></asp:Label>
                                </td>
                                <td>
                                    <input type="text" id="datepicker" name="startDate" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="End Date"></asp:Label>
                                </td>
                                <td>
                                    <input type="text" id="datepicker1" name="endDate" />
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: center;">
                            <asp:Button ID="btnAllCustomersReport" runat="server" Text="Show report" BackColor="#7e9d31" ForeColor="White" OnClientClick="document.forms[0].target = '_blank';" OnClick="btnAllCustomersReport_Click" />
                        </div>
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </div>
                </td>
            </div>

            <div class="span6">
                <td valign="top" width="500">
                    <h3>Customer wise reports</h3>
                    <div id="othleft-sidebar">
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlCompanyName" EventName="SelectedIndexChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <table border="0.5" width="100%">
                                    <tr>
                                        <td>Please select your customer name :</td>
                                        <td>
                                            <asp:DropDownList ID="ddlCompanyName" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div style="text-align: center;">
                            <asp:Button ID="btnShowCustomerInfo" runat="server" Text="Show customer report" BackColor="#7e9d31" ForeColor="White" OnClientClick="document.forms[0].target = '_blank';" OnClick="btnShowCustomerInfo_Click" />
                        </div>
                        <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
                    </div>
                </td>
            </div>
        </div>
    </div>
</asp:Content>
