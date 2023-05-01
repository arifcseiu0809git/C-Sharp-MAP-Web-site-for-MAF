<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="POS.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="scripts/jquery-ui.js"></script>
    <link href="scripts/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            var dialogDiv = $('#dialog1');

            dialogDiv.dialog({
                autoOpen: false,
                modal: true,
                buttons: {
                    'Create': CreateProduct,
                    'Cancel': function () {
                        dialogDiv.dialog('close');
                        clearInputFields();
                    }
                }
            });

            function CreateProduct() {
                var prod = {};
                prod.NewProduct = $('#txtProducts').val();
                //emp.LastName = $('#txtLastName').val();
                //emp.Email = $('#txtEmail').val();
                //$('input:text[id$=TextBox1]').val(emp.FirstName);
                HandleIT(prod.NewProduct);
            }


            function clearInputFields() {
                $('#dialog1 input[type="text"]').val('');
            }

            $('#btnAddProduct').click(function () {
                dialogDiv.dialog("open");
            });
        });

        function HandleIT(newProduct) {
            var categoryID = document.getElementById('<%=txtCategoryID.ClientID %>').value;
            if (categoryID != "") {
                PageMethods.ProcessIT(newProduct, categoryID, onSucess, onError);
                function onSucess(result) {
                    alert(result);
                }
                function onError(result) {
                    alert('Something wrong.');
                }
            }
            else {
                alert('Please select your required Category.');
            }

        }

        function previewFile() {
            var preview = document.querySelector('#<%=ProductsImage.ClientID %>');
            var file = document.querySelector('#<%=UploadProductsImage.ClientID %>').files[0];
            var reader = new FileReader();
            reader.onloadend = function () {
                preview.src = reader.result;
            }
            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }

        //save or not alert
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to save data?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }

    </script>

    <style type="text/css">
        td a {
            padding: 10px;
        }

        .auto-style1 {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
    <div class="container">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <td valign="top">
                        <h3>List of Category</h3>
                        <div class="cont_right">
                            <asp:Label ID="lblCategoryMsg" runat="server"></asp:Label>
                            <br />
                            <asp:GridView ID="gvCategory" DataKeyNames="CategoryID" runat="server" AutoGenerateColumns="False"
                                ShowFooter="True" OnRowEditing="gvCategory_RowEditing" OnRowCommand="gvCategory_RowCommand"
                                OnRowDeleting="gvCategory_RowDeleting" OnRowUpdating="gvCategory_RowUpdating"
                                OnRowCancelingEdit="gvCategory_RowCancelingEdit">
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
                                    <asp:TemplateField HeaderText="CategoryID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCategoryID" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Category Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCategoryName" runat="server" Text='<%#Eval("CategoryName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCategoryName" runat="server" Text='<%#Eval("CategoryName") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="newCategoryName" runat="server" />
                                            <asp:RequiredFieldValidator ID="rfvMarks" runat="server" ControlToValidate="newCategoryName"
                                                Text="*Required" ForeColor="Red" ValidationGroup="vgAdd" />

                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </td>

                    <td valign="top" width="500">
                        <h3>Purchase Products Information</h3>
                        <div id="othleft-sidebar">
                            <br />
                            <table border="0.5" width="100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Purchase Order No:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPurchaseOrder" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">Select Category</td>
                                    <td>
                                        <asp:DropDownList ID="ddlCategorylist" runat="server" AutoPostBack="True" ClientIDMode="Static" OnSelectedIndexChanged="ddlCategorylist_SelectedIndexChanged" AppendDataBoundItems="True">
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                                <tr style="display: none">
                                    <td>
                                        <asp:TextBox ID="txtCategoryID" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td width="35%">
                                        <input type="button" id="btnAddProduct" value="Products *" /></td>
                                    <td>
                                        <asp:DropDownList ID="ddlProductslist" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="Label2" runat="server" Text="Product Code"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
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
                                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="Label1" runat="server" Text="Browse Product Image"></asp:Label>
                                    </td>
                                    <td style="width: 338px"><span class="required">*</span>
                                        <input id="UploadProductsImage" type="file" name="file" onchange="previewFile()" runat="server" />
                                        <asp:Image ID="ProductsImage" runat="server" Height="225px" Width="225px" />
                                    </td>
                                </tr>
                            </table>

                            <div style="text-align: center;">
                                <%-- <asp:Button ID="btnProductSubmit" runat="server" Text="Submit" BackColor="#7e9d31"      OnClick ="btnProductSubmit_Click" />--%>
                                <asp:Button ID="btnConfirm" runat="server" OnClick="OnConfirm" Text="Submit" BackColor="#7e9d31" OnClientClick="Confirm()" />
                            </div>
                            <asp:Label ID="lblProductMsg" runat="server" Text=""></asp:Label>
                            <%--<div id="subject-name-ajax-grid"></div>--%>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <%-- test--%>
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        </div>
        <div id="dialog1">
            <table>
                <tr>
                    <td>Create Product Name</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="txtProducts" /></td>
                </tr>
            </table>
        </div>
        <br />

        <div id="subject-name-ajax-grid"></div>
        <h3>List of Product Details</h3>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <asp:Label ID="lblProductListMsg" runat="server"></asp:Label>
            <tbody>
                <tr>
                    <td>
                        <div>
                            <asp:GridView ID="gvProduct" DataKeyNames="ProductDetailID" runat="server" AutoGenerateColumns="False" OnRowEditing="gvProduct_RowEditing"
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
                                    <asp:TemplateField HeaderText="Product DetailID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductDetailID" runat="server" Text='<%# Bind("ProductDetailID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Category Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCategoryName" ReadOnly="True" runat="server" Text='<%#Eval("CategoryName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCategoryName" ReadOnly="True" runat="server" Text='<%#Eval("CategoryName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Products Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtProductsName" ReadOnly="True" runat="server" Text='<%#Eval("ProductsName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductsName" ReadOnly="True" runat="server" Text='<%#Eval("ProductsName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Purchase OrderNo">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPurchaseOrderNo" runat="server" Text='<%#Eval("PurchaseOrderNo") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPurchaseOrderNo" runat="server" Text='<%#Eval("PurchaseOrderNo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Product Code">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtProductCode" runat="server" Text='<%#Eval("ProductCode") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductCode" runat="server" Text='<%#Eval("ProductCode") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Supplier Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtSupplierName" runat="server" Text='<%#Eval("SupplierName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSupplierName" runat="server" Text='<%#Eval("SupplierName") %>' />
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
                                </Columns>
                            </asp:GridView>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
    </div>
    <%-- </ContentTemplate>--%>
    <%--<Triggers>
            <asp:AsyncPostBackTrigger  EventName="Click"/>
        </Triggers>--%>
    <%-- </asp:UpdatePanel>--%>
</asp:Content>
