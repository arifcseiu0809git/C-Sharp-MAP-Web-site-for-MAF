<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomersOrder.aspx.cs" Inherits="POS.CustomersOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="scripts/jquery-ui.js"></script>
    <link href="scripts/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {

            //for Layer
            $('#btnAddLayer').click(function () {
                dialogDiv.dialog("open");
            });

            function clearInputFields() {
                $('#dialog1 input[type="text"]').val('');
            }


            var dialogDiv = $('#dialog1');
            dialogDiv.dialog({
                autoOpen: false,
                modal: true,
                buttons: {
                    'Create': CreateLayer,
                    'Cancel': function () {
                        dialogDiv.dialog('close');
                        clearInputFields();
                    }
                }
            });

            function CreateLayer() {
                var Layer = {};
                Layer.NewLayer = $('#txtLayer').val();
                //emp.LastName = $('#txtLastName').val();
                //emp.Email = $('#txtEmail').val();
                //$('input:text[id$=TextBox1]').val(emp.FirstName);
                HandleLayer(Layer.NewLayer);
            }

        });

        //for city
        function HandleLayer(newLayer) {
            if (newLayer != "") {
                //alert(newLayer);
                PageMethods.ProcessLayer(newLayer, onSucess, onError);
                function onSucess(result) {
                    alert(result);
                }
                function onError(result) {
                    alert('Something wrong.');
                }
            }
            else {
                alert('Please enter your Layer.');
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

        table tr td {
            padding: 1px 1px;
        }

            table tr td input {
                border: solid 1px gray;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnCustomersOrder" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ddlCompanyName" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlLayerName" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlUnit" EventName="SelectedIndexChanged" />
        </Triggers>
        <ContentTemplate>
            <div class="container">
                <div class="row-fluid">
                    <div class="span6">
                        <h3>Customers Order Information</h3>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span9">
                        <div id="othleft-sidebar">
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblOrderNo" runat="server" Text="Order NO :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCompanyName" runat="server" Text="Company Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCompanyName" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblProductName" runat="server" Text="Product Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="txtProductName" ValidationGroup="grCustomerOrder" ForeColor="Red" errormessage="Please enter Product name!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblThickness" runat="server" Text="Thickness"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtThickness" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtThickness" ValidationGroup="grCustomerOrder" ForeColor="Red" errormessage="Please enter Thickness!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="button" id="btnAddLayer" value="Layer *" />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlLayerName" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblOrderQty" runat="server" Text="Order Qty"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOrderQty" runat="server"></asp:TextBox>                      
                                            
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlUnit" Width="70px" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True">
                                        </asp:DropDownList>
                                   <%-- </td>   
                                     <td>--%>
                                         <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtOrderQty" ValidationGroup="grCustomerOrder" ForeColor="Red" errormessage="Please enter Order Qty!" />                    
                                    </td>                                           
                                </tr>
                              
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCylinderNO" runat="server" Text="Cylinder NO"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCylinderNO" runat="server"></asp:TextBox>
                                    </td>
                                     <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtCylinderNO" ValidationGroup="grCustomerOrder" ForeColor="Red" errormessage="Please enter Cylinder NO!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblColorCombination" runat="server" Text="Color Combination"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtColorCombination" runat="server"></asp:TextBox>
                                    </td>
                                     <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="txtColorCombination" ValidationGroup="grCustomerOrder" ForeColor="Red" errormessage="Please enter Color Combination!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFactoryName" runat="server" Text="Name of the printing factory"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFactoryName" runat="server"></asp:TextBox>
                                    </td>
                                     <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator5" controltovalidate="txtFactoryName" ValidationGroup="grCustomerOrder" ForeColor="Red" errormessage="Please enter Factory Name!" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="lblFactoryRate" runat="server" Text="Factory Rate per unit"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFactoryRate" runat="server"></asp:TextBox>
                                    </td>
                                     <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator6" controltovalidate="txtFactoryRate" ValidationGroup="grCustomerOrder" ForeColor="Red" errormessage="Please enter Factory Rate!" />
                                    </td>
                                </tr>
                            </table>

                            <div style="text-align: center;">
                                <asp:Button ID="btnCustomersOrder" runat="server" Text="Submit" ValidationGroup="grCustomerOrder" BackColor="#7e9d31" OnClick="btnCustomersOrder_Click" />
                            </div>
                            <asp:Label ID="lblCustomersOrderMsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span6">
                        <h3>List of Customers order information</h3>
                        <div class="cont_right">
                            <asp:Label ID="lblCustomersOrderListMsg" runat="server" Style="text-align: left"></asp:Label>
                            <br />
                            <asp:GridView ID="gvCustomersOrderList" AutoGenerateColumns="False" OnPageIndexChanging="gvCustomersOrderList_PageIndexChanging" AllowPaging="True" PageSize="8" ForeColor="#333333" DataKeyNames="CustomersOrderID" runat="server">
                                <AlternatingRowStyle BackColor="#f5f5f5" />
                                <Columns>
                                    <%-- <asp:TemplateField>
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
                            </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="CustomersOrderID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCustomerID" runat="server" Text='<%# Bind("CustomersOrderID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Order No">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtOrderNo" runat="server" Text='<%#Eval("OrderNo") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblOrderNo" runat="server" Text='<%#Eval("OrderNo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Company Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCompanyName" Width="150px" runat="server" Text='<%#Eval("CompanyName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCompanyName" Width="150px" runat="server" Text='<%#Eval("CompanyName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Product Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtProductName" Width="80px" runat="server" Text='<%#Eval("ProductName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductName" Width="80px" runat="server" Text='<%#Eval("ProductName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Thickness">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtThickness" Width="80px" runat="server" Text='<%#Eval("Thickness") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblThickness" Width="80px" runat="server" Text='<%#Eval("Thickness") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Layer Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLayerName" Width="80px" runat="server" Text='<%#Eval("LayerName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblLayerName" Width="80px" runat="server" Text='<%#Eval("LayerName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Order Qty">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtOrderQty" Width="80px" ReadOnly="True" runat="server" Text='<%#Eval("OrderQty") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblOrderQty" Width="80px" ReadOnly="True" runat="server" Text='<%#Eval("OrderQty") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Unit Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtUnitName" ReadOnly="True" runat="server" Text='<%#Eval("UnitName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnitName" ReadOnly="True" runat="server" Text='<%#Eval("UnitName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cylinder No">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCylinderNo" Width="80px" ReadOnly="True" runat="server" Text='<%#Eval("CylinderNo") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCylinderNo" Width="80px" ReadOnly="True" runat="server" Text='<%#Eval("CylinderNo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Color Combination">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtColorCombination" Width="140px" runat="server" Text='<%#Eval("ColorCombination") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblColorCombination" Width="140px" runat="server" Text='<%#Eval("ColorCombination") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Factory Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtFactoryName" Width="80px" runat="server" Text='<%#Eval("FactoryName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblFactoryName" Width="80px" runat="server" Text='<%#Eval("FactoryName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FactoryRate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtFactoryRate" Width="90px" runat="server" Text='<%#Eval("FactoryRate") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblFactoryRate" Width="90px" runat="server" Text='<%#Eval("FactoryRate") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Entry By">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEntryBy" Width="130px" runat="server" Text='<%#Eval("EntryBy") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblEntryBy" Width="130px" runat="server" Text='<%#Eval("EntryBy") %>' />
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
                                <%--  <EditRowStyle BackColor="#7C6F57" />--%>
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

    <div id="dialog1">
        <table>
            <tr>
                <td>Create Layer Name</td>
            </tr>
            <tr>
                <td>
                    <input type="text" id="txtLayer" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
