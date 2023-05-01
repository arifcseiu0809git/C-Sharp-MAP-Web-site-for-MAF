<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categorie.aspx.cs" Inherits="POS.Categorie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <td valign="top">
                        <div class="cont_right">                          
                            <table width="60%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>Select and Show Category wise Product</td>
                                    <td>
                                        <asp:DropDownList ID="ddlCategoryWiselist" runat="server" AutoPostBack="True" ClientIDMode="Static" OnSelectedIndexChanged="ddlCategoryWiselist_SelectedIndexChanged" AppendDataBoundItems="True">
                                          <asp:ListItem Text="Select Category" Value="" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>    
                        <div>
                             <asp:Label ID="lblCategoryProductListMsg" runat="server"></asp:Label>   
                        </div>   
                        <br /><br />                               
                        <div class="cont_right">
                            <asp:GridView ID="gvCategoryProduct" runat="server"></asp:GridView>
                            <br />
                        </div>
                    </td>
               </tr>
            </tbody>
        </table>
     </div>
</asp:Content>
