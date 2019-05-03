<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="WhoPaid.aspx.cs" Inherits="Pages_WhoPaid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <h4>Users who have correctly subscribed and paid</h4>
    <p>As a teacher, before starting your course, you must check if the people
        in the room are in this list.<br />
        If someone is not in the list, you need to contact the administrator.
    </p>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceWhoPaid"></asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceWhoPaid" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [firstName], [surname], [viaId] FROM [users] WHERE ([paid] = @paid)">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="paid" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

