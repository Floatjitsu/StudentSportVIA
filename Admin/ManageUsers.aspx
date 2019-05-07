<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Pages_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../styles/manage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
   <div id="ManageContainer">
        <h2>Manage Users</h2>
            <div id="UserListDiv">
        
            <h4> Unregistered Users </h4>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="viaId" DataSourceID="SqlDataSource1" CellPadding="6" CssClass="mygrdContent" HeaderStyle-CssClass="header">
            <Columns>
                <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                <asp:BoundField DataField="surname" HeaderText="Surname" SortExpression="surname" />
                <asp:BoundField DataField="viaId" HeaderText="VIA ID" ReadOnly="True" SortExpression="viaId"/>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [firstName], [surname], [viaId] FROM [users] WHERE ([paid] = @paid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="paid" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
                <br />
                <h5> Register User </h5>

        <table>
            <tr>
                <td> <asp:Label ID="Label1" runat="server" Text="VIA ID" CssClass="label" /> </td>
                <td>
                     <asp:TextBox ID="TextBoxID" runat="server" CssClass="textbox"/>
                     <asp:RequiredFieldValidator ID="ViaIdFieldValidator" ValidationGroup="Register" runat="server" ErrorMessage="VIA ID is required" ControlToValidate="TextBoxID" ForeColor="#800000" />
                </td>
                <!-- Only numbers are allowed -->
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBoxID" FilterType="Numbers" />                              
            </tr>
                <!--Adding a dropdown list to select the created user's role-->
            <tr>
                <td> <asp:Label ID="RoleLabel" runat="server" AssociatedControlID="RoleList" Text="User Role" CssClass="label"/> </td>
                <td> <asp:DropDownList ID="RoleList" runat="server" CssClass="dropdownlist" /> </td>
            </tr>
            <tr>
                <td> </td>
                <td> <asp:Button ID="ButtonRegisterUser" ValidationGroup="Register" runat="server" Text="Register User" OnClick="ButtonRegisterUser_Click" CssClass="button" /></td>
              </tr>
        </table>
    </div>

       <div id="AllUsersDiv">
        <h4> All Users </h4>
        
        <asp:GridView ID="UsersGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="viaId" DataSourceID="SqlDataSource2" CellPadding="6" CssClass="mygrdContent" HeaderStyle-CssClass="header">
            <Columns>
                <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                <asp:BoundField DataField="viaId" HeaderText="VIA ID" ReadOnly="True" SortExpression="viaId"/>
                <asp:BoundField DataField="role" HeaderText="Role" ReadOnly="true" SortExpression="role" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [firstName], [viaId], [role] FROM [users] ">
        </asp:SqlDataSource>
    </div>

    <div id="SetRoleDiv">
        <h5>Give a sport to a teacher</h5>
        <asp:Label ID="Label2" runat="server" Text="Sport" />
        <asp:DropDownList ID="dropDownSportList" runat="server" CssClass="dropdownlist" />
            <br />
        <asp:Label ID="Label3" Text="Teacher name " runat="server"/>
        <asp:TextBox ID="teacherTextBox" runat="server" />
        <asp:Button ID="giveSportToTeacher" runat="server" Text="Give sport" OnClick="giveSportToTeacher_Click" Cssclass="button"/>
    </div>

    
    <div id="DeleteUserDiv">
        <h5>Delete a User</h5>
        <table>
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="VIA ID" CssClass="label" /></td>
                <td><asp:TextBox ID="UserSelected" runat="server" CssClass="textbox"/></td>
<%--                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Delete" runat="server" ErrorMessage="VIA ID is required" ControlToValidate="UserSelected" ForeColor="#800000" />--%>
            </tr>  
            <tr>
                <td></td>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="UserSelected" FilterType="Numbers" />                              
                <td><asp:Button ID="ButtonDeleteUser" ValidationGroup="Delete" runat="server" Text="Delete User" OnClick="ButtonDeleteUser_Click" CssClass="button"/></td>
                
            </tr>
        </table>
     </div>
    </div>
</asp:Content>
