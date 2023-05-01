<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdatePanelTest.aspx.cs" Inherits="POS.UpdatePanelTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:ScriptManager EnablePartialRendering="true"
        ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"
            UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button1"
                    EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="ddlColor"
                    EventName="SelectedIndexChanged" />
            </Triggers>
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" /><br />
                <asp:Button ID="Button1" runat="server"
                    Text="Update Both Panels" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server"
                    Text="Update This Panel" OnClick="Button2_Click" />
                <asp:CheckBox ID="cbDate" runat="server"
                    Text="Include Date" AutoPostBack="true"
                    OnCheckedChanged="cbDate_CheckedChanged" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server"
            UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="Label2" runat="server"
                    ForeColor="red" />
            </ContentTemplate>
            
        </asp:UpdatePanel>
        <asp:DropDownList ID="ddlColor" runat="server"
            AutoPostBack="true"
            OnSelectedIndexChanged="ddlColor_SelectedIndexChanged">
            <asp:ListItem Selected="true" Value="Red" />
            <asp:ListItem Value="Blue" />
            <asp:ListItem Value="Green" />
        </asp:DropDownList>
    </div>

</asp:Content>
