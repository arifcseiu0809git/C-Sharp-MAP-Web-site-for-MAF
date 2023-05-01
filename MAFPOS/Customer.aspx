<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="POS.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="scripts/jquery-ui.js"></script>
    <link href="scripts/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {

            //for city
            debugger;
            $('#btnAddCity').click(function () {
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
                    'Create': CreateCity,
                    'Cancel': function () {
                        dialogDiv.dialog('close');
                        clearInputFields();
                    }
                }
            });

            function CreateCity() {
                var City = {};
                City.NewCity = $('#txtCity').val();
                //emp.LastName = $('#txtLastName').val();
                //emp.Email = $('#txtEmail').val();
                //$('input:text[id$=TextBox1]').val(emp.FirstName);
                HandleCity(City.NewCity);
            }

            //for country  

            $('#btnAddCountry').click(function () {
                dialogDiv2.dialog("open");
            });

            function clearInputFields() {
                $('#dialog2 input[type="text"]').val('');
            }


            var dialogDiv2 = $('#dialog2');
            dialogDiv2.dialog({
                autoOpen: false,
                modal: true,
                buttons: {
                    'Create': CreateCountry,
                    'Cancel': function () {
                        dialogDiv2.dialog('close');
                        clearInputFields();
                    }
                }
            });

            function CreateCountry() {
                var Country = {};
                Country.NewCountry = $('#txtCountry').val();
                HandleCountry(Country.NewCountry);
            }

        });

        //for city
        function HandleCity(newCity) {
            if (newCity != "") {
                PageMethods.ProcessCity(newCity, onSucess, onError);
                function onSucess(result) {
                    alert(result);
                }
                function onError(result) {
                    alert('Something wrong.');
                }
            }
            else {
                alert('Please enter your City.');
            }

        }


        //for country
        function HandleCountry(newCountry) {
            if (newCountry != "") {
                //alert('ys ' + newCountry);
                PageMethods.ProcessCountry(newCountry, onSucess, onError);
                function onSucess(result) {
                    alert(result);
                }
                function onError(result) {
                    alert('Something wrong.');
                }
            }
            else {
                alert('Please enter your Country.');
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
            <asp:AsyncPostBackTrigger ControlID="btnCustomerSubmit" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ddlCity" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlCountry" EventName="SelectedIndexChanged" />
        </Triggers>
        <ContentTemplate>
            <div class="container">
                <div class="row-fluid">
                    <div class="span6">
                        <h3>Customer Informations</h3>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span8">
                        <div id="othleft-sidebar">
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCompanyName" runat="server" Text="Company Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="txtCompanyName" validationgroup="grCustomer" ForeColor="Red" errormessage="Please enter company name!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtAddress" validationgroup="grCustomer" ForeColor="Red" errormessage="Please enter Address name!" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="button" id="btnAddCity" value="City *" />
                                    </td>

                                    <td>
                                        <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True"  ValidationGroup="CreateRolls" >
                                        </asp:DropDownList>                                       
                                    </td>
                                    <td>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlCity" InitialValue="-Select-" ForeColor="Red"
                                          ValidationGroup ="grCustomer" runat="server" ErrorMessage="Please select city"></asp:RequiredFieldValidator>
                                    </td>                                 
                                </tr>
                                <tr>
                                    <td>
                                        <input type="button" id="btnAddCountry" value="Country *" /></td>
                                    <td>
                                        <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True">
                                        </asp:DropDownList>
                                    </td>
                                     <td>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ddlCountry" InitialValue="Select City Name" ForeColor="Red"
                                          ValidationGroup ="grCustomer" runat="server" ErrorMessage="Please select Country"></asp:RequiredFieldValidator>
                                    </td>  
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblContactPerson" runat="server" Text="Contact person name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtContactPerson" runat="server"></asp:TextBox>
                                    </td>
                                     <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator8" controltovalidate="txtContactPerson" validationgroup="grCustomer" ForeColor="Red" errormessage="Please enter Contact Person name!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMobileNo" runat="server" Text="Mobile No"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
                                    </td>
                                      <td>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="txtMobileNo" validationgroup="grCustomer" ForeColor="Red" errormessage="Please enter Mobile No!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:requiredfieldvalidator id="RequiredFieldValidator3" controltovalidate="txtEmail"  validationgroup="grCustomer" ForeColor="Red"
                                          errormessage="Please Enter Email." runat="Server">
                                        </asp:requiredfieldvalidator>
                                    </td>
                                  
                                </tr>
                            </table>

                            <div style="text-align: center;">
                                <asp:Button ID="btnCustomerSubmit" runat="server" Text="Submit" ValidationGroup="grCustomer" BackColor="#7e9d31" OnClick="btnCustomerSubmit_Click" />
                            </div>
                            <asp:Label ID="lblCustomerMsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span6">
                        <h3>List of Customers</h3>
                        <div class="cont_right">
                            <asp:Label ID="lblCustomerListMsg" runat="server" Style="text-align: left"></asp:Label>
                            <br />
                            <asp:GridView ID="gvCustomersList" AutoGenerateColumns="False" OnPageIndexChanging="gvCustomersList_PageIndexChanging" AllowPaging="True" PageSize="8" ForeColor="#333333" DataKeyNames="CustomerID" runat="server" OnRowEditing="gvCustomersList_RowEditing"
                                OnRowDeleting="gvCustomersList_RowDeleting" OnRowUpdating="gvCustomersList_RowUpdating"
                                OnRowCancelingEdit="gvCustomersList_RowCancelingEdit">
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
                                    <asp:TemplateField HeaderText="CustomerID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCustomerID" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
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
                                    <asp:TemplateField HeaderText="Address">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtAddress" Width="150px" runat="server" Text='<%#Eval("Address") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblAddress" Width="150px" runat="server" Text='<%#Eval("Address") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCityName" Width="80px" ReadOnly="True" runat="server" Text='<%#Eval("CityName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCityName" Width="80px" ReadOnly="True" runat="server" Text='<%#Eval("CityName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Country Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCountryName" Width="80px" ReadOnly="True" runat="server" Text='<%#Eval("CountryName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCountryName" Width="80px" ReadOnly="True" runat="server" Text='<%#Eval("CountryName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cont. Person Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtContactPersonName" Width="140px" runat="server" Text='<%#Eval("ContactPersonName") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblContactPersonName" Width="140px" runat="server" Text='<%#Eval("ContactPersonName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile No">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMobileNo" Width="100px" runat="server" Text='<%#Eval("MobileNo") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMobileNo" Width="100px" runat="server" Text='<%#Eval("MobileNo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmail" runat="server" Text='<%#Eval("Email") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>' />
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

    <div id="dialog1">
        <table>
            <tr>
                <td>Create City Name</td>
            </tr>
            <tr>
                <td>
                    <input type="text" id="txtCity" />
                </td>
            </tr>
        </table>
    </div>

    <div id="dialog2">
        <table>
            <tr>
                <td>Create Country Name</td>
            </tr>
            <tr>
                <td>
                    <input type="text" id="txtCountry" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
