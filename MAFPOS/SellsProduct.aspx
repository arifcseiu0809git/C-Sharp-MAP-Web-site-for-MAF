<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SellsProduct.aspx.cs" Inherits="POS.SellsProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: sans-serif;
        }

        #summation {
            font-size: 18px;
            font-weight: bold;
            color: #174C68;
        }

        .txt {
            background-color: #FEFFB0;
            font-weight: bold;
            text-align: right;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="scripts/jquery-ui.js"></script>
    <link href="scripts/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            //iterate through each textboxes and add keyup
            //handler to trigger sum event
            $(".txt").each(function () {
                $(this).keyup(function () {
                    calculateSum();
                });
            });
        });

        function calculateSum() {
            var sum = 0;
            var percentageValue1 = 0;
            var percentageValue2 = 0;
            var purchasePrice = document.getElementById('<%=txtPrice.ClientID %>').value;
            //alert(purchasePrice);
            //iterate through each textboxes and add the values
            $(".txt").each(function () {
                //add only if the value is number
                if (!isNaN(this.value) && this.value.length != 0) {
                    //sum += parseFloat(this.value);
                    percentageValue1 = parseFloat(this.value);
                    //alert(percentageValue1);
                    percentageValue2 = (percentageValue1 /100)* purchasePrice;
                    //alert(percentageValue2);
                    sum = parseFloat(purchasePrice) + parseFloat(percentageValue2);
                    //alert('result = ' + sum);
                    $('input:text[id$=txtProfitPercentage]').val(percentageValue1);
                    $('input:text[id$=txtSellPrice]').val(sum);                   
                    $('input:text[id$=txtSellsPrice]').val(sum);   
                }
            });
            //.toFixed() method will roundoff the final sum to 2 decimal places
            $("#sum").html(sum.toFixed(2));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <td valign="top" width="500">
                        <h3>Product Store for Sells</h3>
                        <div id="othleft-sidebar">
                            <br />
                            <table border="0.5" width="100%">
                                <tr>
                                    <td width="35%">Select Category Name</td>
                                    <td>
                                        <asp:DropDownList ID="ddlCategorylist" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlCategorylist_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">Select Product Name</td>
                                    <td>
                                        <asp:DropDownList ID="ddlProductlist" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlProductlist_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">Select Product Code</td>
                                    <td>
                                        <asp:DropDownList ID="ddlProductCode" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlProductCode_SelectedIndexChanged" >
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                 <tr>
                                    <td width="35%">Select Purchase Order ID</td>
                                    <td>
                                        <asp:DropDownList ID="ddlPOID" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlPOID_SelectedIndexChanged" >
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td width="35%">
                                        <asp:Label ID="Label2" runat="server" Text="Product Code"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="lblSupplierName" runat="server" Text="Supplier Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSupplierName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDescription" TextMode="multiline" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="lblQuantity" runat="server" Text="Purchase Quantity"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="Label2" runat="server" Text="Already receive Quantity"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAlreadyReceiveQty" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                 <tr>
                                    <td width="35%">
                                        <asp:Label ID="Label5" runat="server" Text="Present Required Quantity"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRequiredQuantity" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="lblPrice" runat="server" Text="Purchase Price"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%">
                                        <asp:Label ID="Label1" runat="server" Text="Sells Price will be"></asp:Label>
                                    </td>
                                    <td>
                                       <%-- <asp:TextBox ID="txtPercentage" Width="30%" runat="server"></asp:TextBox>--%>
                                         <input class="txt" type="text" name="txt" />
                                        &nbsp;% profit of purchase price.

                                    </td>
                                     <td style="display:none">
                                        <asp:TextBox ID="txtProfitPercentage" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="Label3" runat="server" Text="Net Sells Price"></asp:Label>
                                    </td>
                                    <td style="display:none">
                                        <asp:TextBox ID="txtSellsPrice" runat="server" ></asp:TextBox>
                                        &nbsp;Tk.
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSellPrice" ReadOnly="true" runat="server" ></asp:TextBox>
                                        &nbsp;Tk.

                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="Label4" runat="server" Text="Vat and Tax"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVatAndTax" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                              
                                <%-- <tr>
                                            <td width="35%">
                                                <asp:Label ID="Label1" runat="server" Text="Browse Product Image"></asp:Label>
                                            </td>
                                            <td style="width: 338px"><span class="required">*</span>
                                                <input id="UploadProductsImage" type="file" name="file" onchange="previewFile()" runat="server" />
                                                <asp:Image ID="ProductsImage" runat="server" Height="225px" Width="225px" />
                                            </td>
                                        </tr>--%>
                            </table>

                            <div style="text-align: center;">
                                <asp:Button ID="btnSellsProductSubmit" runat="server" Text="Submit" BackColor="#7e9d31" OnClick="btnSellsProductSubmit_Click" />
                            </div>
                            <asp:Label ID="lblSellsProductMsg" runat="server" Text=""></asp:Label>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <div id="subject-name-ajax-grid"></div>
        <h3>List of Products</h3>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <asp:Label ID="lblSellsProductListMsg" runat="server"></asp:Label>
            <tbody>
                <tr>
                    <td>
                        <div>
                            <asp:GridView ID="gvSellsProduct" runat="server"></asp:GridView>
                            <%--<asp:GridView ID="gvSellsProduct" DataKeyNames="ProductID" runat="server" AutoGenerateColumns="False" OnRowEditing="gvProduct_RowEditing" OnRowCommand="gvProduct_RowCommand"
                                OnRowDeleting="gvProduct_RowDeleting" OnRowUpdating="gvProduct_RowUpdating"
                                OnRowCancelingEdit="gvProduct_RowCancelingEdit">
                                <HeaderStyle BackColor="#9a9a9a" ForeColor="White" Font-Bold="true" Height="30" />
                                <AlternatingRowStyle BackColor="#f5f5f5" />
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lbtnUpdate" runat="server" CommandName="Update" Text="Update" />
                                            <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" Text="Edit" />
                                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" Text="Delete"
                                                OnClientClick="return confirm('Are you sure you want to delete this record?')"
                                                CausesValidation="false" />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="lbtnAdd" runat="server" CommandName="Add" Text="Add New" ValidationGroup="vgAdd" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Product ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductID" runat="server" Text='<%# Bind("ProductID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Product Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtProductName" runat="server" Text='<%#Eval("ProductName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("ProductName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category ID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCategoryID" ReadOnly="True" runat="server" Text='<%#Eval("CategoryID") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCategoryID" ReadOnly="True" runat="server" Text='<%#Eval("CategoryID") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Stock Quantity">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtStockQuantity" runat="server" Text='<%#Eval("StockQuantity") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblStockQuantity" runat="server" Text='<%#Eval("StockQuantity") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Price">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPrice" runat="server" Text='<%#Eval("Price") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDescription" runat="server" Text='<%#Eval("Description") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("Description") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>--%>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
    </div>
</asp:Content>
