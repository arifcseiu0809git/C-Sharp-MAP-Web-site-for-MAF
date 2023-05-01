<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="POS.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="scripts/jquery-ui.css" rel="stylesheet" />
    <style>
        table tr td {
            padding: 1px 1px;
        }
            table tr td input {
                border: solid 1px gray;
            }
    </style>

    <script>
        $(function () {

            <%--var gridId = document.getElementById("<%=GridView1.ClientID%>");--%>
            <%--$('#' + '<%=label1.ClientID %>')--%>

            $('#<%=GridView1.ClientID%>' + ' .txtQty').blur(function () {
                var $tr = $(this).parents('tr');
                if ($tr.length > 0) {
                    if (parseInt($tr.find('.avlQty').html()) < $(this).val()) {
                        alert('Qty must not exceed available quantity.');
                        var $ctrl = $(this);
                        window.setTimeout(function () {
                            $ctrl.focus();
                        }, 50);
                        return false;
                    }
                    $tr.find('.totalPrice').html(parseFloat($tr.find('.price').html()) * parseInt($(this).val()));
                }
                CalculateGrandTotal();
            });
            //To get grand Total
            var testTot = 0.0;
            var gdtotal = 0.0;
            var discountTotal = 0.0;

            function CalculateGrandTotal() {
                var grandTotal = 0.0;
                $('#<%=GridView1.ClientID%>' + ' tr:gt(0)').each(function () {
                    grandTotal = grandTotal + parseFloat($(this).find('.totalPrice').length == 0 || !$(this).find('.totalPrice').html() ? 0 : $(this).find('.totalPrice').html());
                });
                $('#<%=GridView1.ClientID%>' + ' .grandtotal').html(grandTotal);
                $('#<%=GridView1.ClientID%>' + ' .gdtotal').html(grandTotal - discountTotal);
                testTot = grandTotal;

            }

            //Total discount calculate

            $('#<%=GridView1.ClientID%>' + ' .txtDisQty').blur(function () {
                var $tr = $(this).parents('tr');
                if ($tr.length > 0) {
                    //var t = $(this).val();                   
                }
                CalculateDiscountTotal();
            });
            function CalculateDiscountTotal() {
                var sum = 0.0;

                $('#<%=GridView1.ClientID%>' + ' tr:gt(0)').each(function () {
                    var disTotal = parseInt($(this).find('.txtDisQty').val());
                    //alert(tt);
                    if (disTotal > 0) {
                        sum = sum + disTotal;
                    }
                });
                discountTotal = sum;
                gdtotal = testTot - discountTotal;
                $('#<%=GridView1.ClientID%>' + ' .discountTotal').html(discountTotal);
                $('#<%=GridView1.ClientID%>' + ' .gdtotal').html(gdtotal);
            }
            //First Time to display all total amount and grand total
            function initGrid() {
                $('#<%=GridView1.ClientID%>' + ' tr:gt(0)').each(function () {
                    $(this).find('.totalPrice').html(parseFloat($(this).find('.price').html()) * parseInt($(this).find('.txtQty').val()));

                });
                CalculateGrandTotal();
                CalculateDiscountTotal();
            }
            //To allow numeric character only
            $('#<%=GridView1.ClientID%>' + ' .txtQty').keydown(function (event) {
                // Allow: backspace, delete, tab, escape, and enter
                if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
                    // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
                    // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
                    // let it happen, don't do anything
                    return;
                }
                else {
                    // Ensure that it is a number and stop the keypress
                    if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                        event.preventDefault();
                    }
                }
            });
            initGrid();
        })

        function GetSelectedRow(lnk) {
            var row = lnk.parentNode.parentNode;
            var rowIndex = row.rowIndex - 1;
            var CustomerID = row.cells[0].innerHTML;
            var CustomerName = row.cells[1].getElementsByTagName("input")[0].value;
            //var MobileNo = row.cells[2].getElementsByTagName("input")[0].value;

            $('input:text[id$=txtCustomerID]').val(CustomerID);
            $('input:text[id$=txtCustomerName]').val(CustomerName);
            return false;
        }
    </script>

   <%-- <style type="text/css">
        .cont_right {
            width: 428px;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row-fluid">
            <div class="span6">
                <h3>List of Customers</h3>
                <div class="cont_right">
                    <asp:Label ID="lblCustomersMsg" runat="server"></asp:Label>
                    <br />
                    <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvCustomers_PageIndexChanging" PageSize="4" CellPadding="1" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="CustomerID" HeaderText="Customer" />
                            <asp:TemplateField HeaderText="Customer Name">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCustomerName" runat="server" Height="10px" Width="140px" Text='<%# Eval("CustomerName") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile No">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtMobileNo" runat="server" Height="10px" Width="140px" Text='<%# Eval("MobileNo") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Height="10px" Width="140px" Text='<%# Eval("Email") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkSelect" runat="server" Text="Select" CommandName="Select" OnClientClick="return GetSelectedRow(this)" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#7E9D31" ForeColor="White" />
                        <HeaderStyle BackColor="#7E9D31" ForeColor="White" />
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
            <div class="pull-left span6">
                <h3>Customers Information</h3>
                <div>
                    <br /> <br />
                    <table border="0.5">
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Order NO:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Customer ID NO:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Customer Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Select Product for Order</td>
                            <td>
                                <asp:DropDownList ID="ddlCategorylist" runat="server" AutoPostBack="True" ClientIDMode="Static" OnSelectedIndexChanged="ddlCategorylist_SelectedIndexChanged" AppendDataBoundItems="True">
                                    <asp:ListItem Text="Select Category" Value="" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="pull-left span6">
                <h3>List of Products</h3>
                <div class="cont_right">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:GridView ID="gvProducs" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="404px">
                        <%-- <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />--%>
                        <HeaderStyle BackColor="#7E9D31" ForeColor="White" />
                        <FooterStyle BackColor="#FF0000" ForeColor="White" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#000000" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" OnCheckedChanged="chkSelect_CheckedChanged" AutoPostBack="true" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PurchaseOrderNo" HeaderText="Purchase OrderNo" />
                            <asp:BoundField DataField="ProductsName" HeaderText="Product Name" />
                            <asp:BoundField DataField="ProductCode" HeaderText="Product Code" />
                            <asp:BoundField DataField="StockQuantity" HeaderText="Stock Quantity" />
                            <asp:BoundField DataField="SellsPrice" HeaderText="Price" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="pull-left span6">
                <h3>Required sells product list</h3>
                <div class="cont_right">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:GridView ID="GridView1" CssClass="grid" runat="server" AutoGenerateColumns="False" ShowFooter="true" Height="100px" Width="345px">
                        <Columns>
                            <asp:BoundField DataField="PurchaseOrderNo" HeaderText="Purchase OrderNo" />
                            <asp:TemplateField Visible="false" HeaderText="Purchase Order No">
                                <ItemTemplate>
                                    <asp:Label ID="lblPurchaseOrderNo" runat="server" Text='<%# Eval("PurchaseOrderNo") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Code">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductCode" runat="server" Text='<%# Eval("ProductCode") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Available Qty" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblAvailableQty" runat="server" Text='<%# Eval("AvlQty") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblPrice" runat="server" ItemStyle-CssClass="price" Text='<%# Eval("Price") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AvlQty" HeaderText="Available Qty" ItemStyle-CssClass="avlQty" />
                            <asp:BoundField DataField="Price" DataFormatString="{0:0.00}" HeaderText="Price Amount" ItemStyle-CssClass="price" />
                            <asp:TemplateField HeaderText="Required Qty">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtReqQty" CssClass="txtQty" runat="server" Text='<%# Eval("SelQty") %>' MaxLength="5" Width="45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReqQty" Display="Dynamic" ForeColor="Red" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Net__Price_ Amount">
                                <ItemTemplate>
                                    <span class="totalPrice"></span>
                                </ItemTemplate>
                                <FooterTemplate>
                                    Total_Amount: <span class="grandtotal"></span>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Discount_Amount">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDisQty" CssClass="txtDisQty" runat="server" Text='<%# Eval("DisQty") %>' MaxLength="5" Width="45"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    Total_discount: <span class="discountTotal"></span>
                                    Grand Total: <span class="gdtotal"></span>
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Label ID="lblShowMsg" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnOrder" runat="server" OnClick="btnOrder_Click" Text="Order" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
