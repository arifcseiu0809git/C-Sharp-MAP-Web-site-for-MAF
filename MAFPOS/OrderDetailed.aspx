<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetailed.aspx.cs" Inherits="POS.OrderDetailed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="scripts/jquery-ui.css" rel="stylesheet" />
    <script src="angular.min.js"></script>
    <script>
        function sum() {
            var FinishedProductQty = document.getElementById('txtFinishedProductQty').value;
            var FactoryRate = document.getElementById('txtFactoryRate').value;
            var MAFRate = document.getElementById('txtMAFRate').value;
            //alert(FinishedProductQty + ' ' + FactoryRate + ' ' + MAFRate + ' ');
            //var FactoryPayableAmount = parseInt(FinishedProductQty) * parseInt(FactoryRate);
            var FactoryPayableAmount = parseFloat(FinishedProductQty) * parseFloat(FactoryRate);
            //var MAFAmount = parseInt(FinishedProductQty) * parseInt(MAFRate);
            var MAFAmount = parseFloat(FinishedProductQty) * parseFloat(MAFRate);
            if (!isNaN(FactoryPayableAmount)) {
                document.getElementById('txtFactoryPayableAmount').value = FactoryPayableAmount;
            }
            if (!isNaN(MAFAmount)) {
                document.getElementById('txtMAFAmount').value = MAFAmount;
            }
        }
    </script>
    <style>
        table tr td {
            padding: 1px 1px;
        }

            table tr td input {
                border: solid 1px gray;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnOrderDetailed" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ddlOrderNo" EventName="SelectedIndexChanged" />
            <%-- <asp:AsyncPostBackTrigger ControlID="ddlCountry" EventName="SelectedIndexChanged" />--%>
        </Triggers>
        <ContentTemplate>
            <div class="container">
                <div class="row-fluid">
                    <div class="span6">
                        <h3>Order Detailed Information</h3>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span9">
                        <div id="othleft-sidebar">
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblOrderNo" runat="server" Text="Order Number"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlOrderNo" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlOrderNo_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblOrderQty" runat="server" Text="Order Qty"></asp:Label>
                                    </td>
                                    <td>
                                        <input type="number" runat="server" id="txOrderQty" min="0" />
                                    </td>
                                    <td>&nbsp
                                        <asp:Label ID="lblUnit" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFinishedProductQty" runat="server" Text="Finished Product Qty"></asp:Label>
                                    </td>
                                    <td>
                                        <%--<input type="number" runat="server" id="txFinishedProductQty" onkeyup="sum();" min="0" placeholder="Enter Finished required Qty" />--%>
                                        <input type="text" id="txtFinishedProductQty" name="txtFinishedProductQty" onkeyup="sum();" />
                                    </td>
                                    <td>&nbsp
                                        <asp:Label ID="lblUnit2" runat="server"></asp:Label>
                                    </td>
                                    <%-- <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtFinishedProductQty" ForeColor="Red" errormessage="Please enter Finished Product Qty!" />
                                    </td>--%>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="lblFactoryRate" runat="server" Text="Factory Rate per unit"></asp:Label>
                                    </td>
                                    <td>
                                        <%--<input type="number" runat="server" id="txFactoryRate" min="0" onkeyup="sum();"  placeholder="0..." />--%>
                                        <input type="text" id="txtFactoryRate" name="txtFactoryRate" value="<% =this.InputValue %>" onkeyup="sum();" /> 
                                    </td>
                                    <td>&nbsp TK</td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="lblFactoryPayableAmount" runat="server" Text="Printing factory total payable"></asp:Label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtFactoryPayableAmount" name="txtFactoryPayableAmount" />
                                    </td>
                                    <td>&nbsp TK</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMAFRate" runat="server" Text="MAF Rate"></asp:Label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtMAFRate" name="txtMAFRate" onkeyup="sum()" />
                                    </td>
                                    <td>&nbsp TK</td>
                                   <%-- <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtMAFRate" ValidationGroup="grOrderDetailed" ForeColor="Red" errormessage="Please enter MAF Rate!" />
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMAFAmount" runat="server" Text="Total Amount of MAF"></asp:Label>
                                    </td>
                                    <td>
                                        <%--<asp:TextBox ID="txtMAFAmount" runat="server"></asp:TextBox>--%>
                                        <input type="text" id="txtMAFAmount" name="txtMAFAmount" />
                                    </td>
                                    <td>&nbsp TK</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Received Amount from Customers"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtReceivedAmount" runat="server"></asp:TextBox>
                                    </td>
                                    <td>&nbsp TK</td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtReceivedAmount" ValidationGroup="grOrderDetailed" ForeColor="Red" errormessage="Please enter Received Amount!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Bill Status"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBillStatus" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ValidationGroup="grOrderDetailed" controltovalidate="txtBillStatus" ForeColor="Red" errormessage="Please enter Bill Status!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Remarks"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </td>
                                   <%-- <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtMAFRate" ForeColor="Red" errormessage="Please enter MAF Rate!" />
                                    </td>--%>
                                </tr>
                            </table>

                            <div style="text-align: center;">
                                <asp:Button ID="btnOrderDetailed" runat="server" ValidationGroup="grOrderDetailed" Text="Submit" BackColor="#7e9d31" OnClick="btnOrderDetailed_Click" />
                            </div>
                            <asp:Label ID="lblOrderDetailedMsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span6">
                        <h3>List of order detailed information</h3>
                        <div class="cont_right">
                            <asp:Label ID="lblOrderDetailedListMsg" runat="server" Style="text-align: left"></asp:Label>
                            <br />
                            <asp:GridView ID="gvOrderDetailedList" AutoGenerateColumns="False" OnPageIndexChanging="gvOrderDetailedList_PageIndexChanging" AllowPaging="True" PageSize="10" ForeColor="#333333" DataKeyNames="OrderDetailedID" runat="server" OnRowEditing="gvOrderDetailedList_RowEditing" OnRowCancelingEdit="gvOrderDetailedList_RowCancelingEdit" OnRowUpdating="gvOrderDetailedList_RowUpdating">
                                <AlternatingRowStyle BackColor="#f5f5f5" />
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lbtnUpdate" runat="server" CommandName="Update" Text="Update" />
                                            <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" Text="Edit" />
                                           <%-- <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" Text="Delete"
                                                OnClientClick="return confirm('Are you sure you want to delete this record?')"
                                                CausesValidation="false" />--%>
                                        </ItemTemplate>
                                       <%-- <FooterTemplate>
                                            <asp:LinkButton ID="lbtnAdd" runat="server" CommandName="Add" Text="Add New" ValidationGroup="vgAdd" />
                                        </FooterTemplate>--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="OrderDetailedID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOrderDetailedID" runat="server" Text='<%# Bind("OrderDetailedID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Order No">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtOrderNo" Width="70px" runat="server" Text='<%#Eval("OrderNo") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblOrderNo" Width="70px" runat="server" Text='<%#Eval("OrderNo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Order Qty">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtOrderQty" Width="70px" ReadOnly="True" runat="server" Text='<%#Eval("OrderQty") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblOrderQty" Width="70px" ReadOnly="True" runat="server" Text='<%#Eval("OrderQty") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Finished Product Qty">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtFinishedProductQty" Width="100px" ReadOnly="True" runat="server" Text='<%#Eval("FinishedProductQty") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblFinishedProductQty" Width="100px" ReadOnly="True" runat="server" Text='<%#Eval("FinishedProductQty") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Factory Rate (TK)">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtFactoryRate" Width="90px" runat="server" Text='<%#Eval("FactoryRate") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblFactoryRate" Width="90px" runat="server" Text='<%#Eval("FactoryRate") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fact. Payable Amount (TK)">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtFactoryPayableAmount" Width="120px" runat="server" Text='<%#Eval("FactoryPayableAmount") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblFactoryPayableAmount" Width="120px" runat="server" Text='<%#Eval("FactoryPayableAmount") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MAF Rate (TK)">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMAFRate" Width="80px" runat="server" Text='<%#Eval("MAFRate") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMAFRate" Width="80px" runat="server" Text='<%#Eval("MAFRate") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MAF Amount (TK)">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMAFAmount" Width="100px" runat="server" Text='<%#Eval("MAFAmount") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMAFAmount" Width="100px" runat="server" Text='<%#Eval("MAFAmount") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Received Amount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtReceivedAmount" runat="server" Text='<%#Eval("ReceivedAmount") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblReceivedAmount" runat="server" Text='<%#Eval("ReceivedAmount") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="Bill Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtBillStatus" runat="server" Text='<%#Eval("BillStatus") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBillStatus" runat="server" Text='<%#Eval("BillStatus") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtRemarks" Width="140px" runat="server" Text='<%#Eval("Remarks") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemarks" Width="140px" runat="server" Text='<%#Eval("Remarks") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="Entry By">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEntryBy" Width="120px" runat="server" Text='<%#Eval("EntryBy") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblEntryBy" Width="120px" runat="server" Text='<%#Eval("EntryBy") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Entry Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEntryDate" Width="140px" runat="server" Text='<%#Eval("EntryDate") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblEntryDate" Width="140px" runat="server" Text='<%#Eval("EntryDate") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <HeaderStyle BackColor="#7E9D31" ForeColor="White" Font-Bold="true" Height="25" />
                                <FooterStyle BackColor="#7E9D31" ForeColor="White" Height="25" />
                                <PagerSettings FirstPageText="First" LastPageText="Last" PageButtonCount="8" />
                                <PagerStyle BackColor="#999966" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" ForeColor="#000000" />
                                <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
