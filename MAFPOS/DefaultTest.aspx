<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DefaultTest.aspx.cs" Inherits="POS.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <%-- <script src="Scripts/jquery-2.1.4.min.js"></script> --%> 
        <script src="scripts/jquery-1.7.min.js"></script>
       <%-- <script type="text/javascript">--%>
           <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>--%>
    <script type="text/javascript">

        function GetSelectedRow(lnk) {
            var row = lnk.parentNode.parentNode;
            var rowIndex = row.rowIndex - 1;
            var customerId = row.cells[0].innerHTML; 
            var Name = row.cells[1].getElementsByTagName("input")[0].value;
            var Email = row.cells[2].getElementsByTagName("input")[0].value;
            alert("RowIndex: " + rowIndex + " CustomerId: " + customerId + " Name:" + Name+" Email:"+Email);
            return false;
        }


        //for auto sum

        //$(function () {
        //    var textBox1 = $('input:text[id$=TextBox1]').keyup(foo);
        //    var textBox2 = $('input:text[id$=TextBox2]').keyup(foo);

        //    function foo() {
        //        var value1 = textBox1.val();
        //        var value2 = textBox2.val();
        //        var sum = add(value1, value2);
        //        $('input:text[id$=TextBox3]').val(sum);
        //    }

        //    function add() {
        //        var sum = 0;
        //        for (var i = 0, j = arguments.length; i < j; i++) {
        //            if (IsNumeric(arguments[i])) {
        //                sum += parseFloat(arguments[i]);
        //            }
        //        }
        //        return sum;
        //    }
        //    function IsNumeric(input) {
        //        return (input - 0) == input && input.length > 0;
        //    }
        //});


        //for check box
        $(function () {
            var chk = $('input:checkbox').click(function (e) {
                var selectedValue = '';
                $("input[name$=chkEMP]:checked").each(function () {
                    selectedValue += $(this).next("input[name$=hdnId]").val() + "; ";
                });
                $('input:text[id$=TextBox3]').val(selectedValue);
                $('#selEMPDiv').text("Your Selected Employee : " + selectedValue)
            });
        });

    </script>



          <%--  $(function () {
                var chk = $('input:checkbox').click(function (e) {
                    var selectedValue = '';
                    $("input[name$=chkEMP]:checked").each(function () {
                        selectedValue += $(this).next("input[name$=hdnId]").val() + "; ";
                    });
                    $('#selEMPDiv').text("Your Selected Employee : " + selectedValue)
                });
            });
          </script>  --%>

        <div>  
            <table id="tblEMP" style="border: solid 2px red; width: 100%; text-align: center;">  
                <tr>  
                    <td style="height: 30px; background-color: orange; color: #0026ff;   
                        font-size: 20pt; font-weight: bold; font-family: Verdana;">  
                        Show GridView Column Value on Check Bos Selection Using jQuery
                    </td>  
                </tr>  
                <tr>  
                    <td>  
                        <asp:GridView ID="GridViewEMP" runat="server" AutoGenerateColumns="False" Width="90%"  
HorizontalAlign="Center" HeaderStyle-BackColor="Green" CellPadding="4" ForeColor="#333333" GridLines="None">  
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />  
                            <Columns>  
                                <asp:TemplateField>  
                                    <ItemTemplate>  
                                        <asp:CheckBox ID="chkEMP" runat="server" />  
                                        <asp:HiddenField ID="hdnId" runat="server" Value='  
                                            <%#Eval("Name") %>' />  
                                        </ItemTemplate>  
                                    </asp:TemplateField>  
                                    <asp:BoundField DataField="ID" HeaderText="ID"  />  
                                    <asp:BoundField DataField="Name" HeaderText="Name"  />  
                                    <asp:BoundField DataField="Email" HeaderText="Email" />  
                                    <asp:BoundField DataField="Country" HeaderText="Country" />  
                                </Columns>  
                                <EditRowStyle BackColor="#999999" />  
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />  
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>  
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />  
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />  
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />  
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />  
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />  
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />  
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />  
                            </asp:GridView>  
                     </td>  
                </tr>  
            </table>  
                <div style="height: 30px; background-color: #e5d6d6; color: green; font-size: 11pt; font-weight: bold; font-family: Verdana;">  
                    <p id="selEMPDiv"></p>  
                </div>  
        </div>  
        
    <table width="300px" border="1" style="border-collapse:collapse;background-color:#E8DCFF">
    <tr>
        <td>Butter</td>
        <td> <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Cheese</td>
        <td>
    <asp:TextBox runat="server" ID="TextBox2"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Total</td>
        <td>
    <asp:TextBox runat="server" ID="TextBox3"></asp:TextBox>
        </td>
    </tr>
    </table>


    <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns = "false" AllowPaging = "true" OnPageIndexChanging = "PageIndexChanging">
        <Columns>
        <asp:BoundField DataField = "ID" HeaderText = "ID" />
        <asp:TemplateField HeaderText = "Name">
            <ItemTemplate>
                <asp:TextBox ID="txtName" runat="server" Text = '<%# Eval("Name") %>'></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText = "Email">
            <ItemTemplate>
                <asp:TextBox ID="txtEmail" runat="server" Text = '<%# Eval("Email") %>'></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText = "Country">
            <ItemTemplate>
                <asp:TextBox ID="txtCountry" runat="server" Text = '<%# Eval("Country") %>'></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkSelect" runat="server" Text="Select" CommandName = "Select" OnClientClick = "return GetSelectedRow(this)"  />
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChange="GridView1_SelectedIndexChange" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
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
            <asp:BoundField DataField="ID" HeaderText="ID"  />  
            <asp:BoundField DataField="Name" HeaderText="Name"  />  
            <asp:BoundField DataField="Email" HeaderText="Email" />  
            <asp:BoundField DataField="Country" HeaderText="Country" />  
        </Columns>
    </asp:GridView>
    <br />
    <asp:GridView ID="GridView2" runat="server" EmptyDataText="No Records Founds" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="345px">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID"  />  
            <asp:BoundField DataField="Name" HeaderText="Name"  />  
            <asp:BoundField DataField="Email" HeaderText="Email" />  
            <asp:BoundField DataField="Country" HeaderText="Country" />  
            <asp:BoundField DataField="Sum" HeaderText="Sum" />  

        </Columns>

       </asp:GridView>
</asp:Content>
