<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Pages_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">

    <div id="UserListDiv">
        Here the user list:

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="viaId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
                <asp:BoundField DataField="viaId" HeaderText="viaId" ReadOnly="True" SortExpression="viaId" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [firstName], [surname], [viaId] FROM [users] WHERE ([paid] = @paid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="paid" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div id="SetRoleDiv">
        <table>
            <tr>
       <td> <asp:Label ID="Label1" runat="server" Text="Label">VIA_ID: </asp:Label> </td>
        <td> <asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox> </td>
              <!-- Only numbers are allowed -->
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBoxID" FilterType="Numbers" />
                                
                </tr>
        <!--Adding a dropdown list to select the created user's role-->
                   <tr>
                       <td>
                                 <asp:Label ID="RoleLabel" runat="server" AssociatedControlID="RoleList">User Role:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="RoleList" runat="server" Width="173px"></asp:DropDownList>
                            </td>
                        </tr>

            <tr>
                <td></td>
                <td>  <asp:Button ID="Button1" runat="server" Text="Update info" /></td>
              </tr>
            </table>
    </div>

</asp:Content>

