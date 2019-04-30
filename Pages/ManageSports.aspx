<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ManageSports.aspx.cs" Inherits="Pages_ManageSports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">   
    <asp:DropDownList  runat="server" ID="dropDownSportName"/>
    <asp:TextBox ID="sendNewsTextBox" runat="server" />
    <asp:Button ID="sendNews" runat="server" Text="Send" OnClick="sendNews_Click"/> 
</asp:Content>