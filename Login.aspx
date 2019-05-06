<%@ Page Title="" Language="C#" MasterPageFile="~/LoginPageMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="loginWrapper">
    <img src="studentSport_logo.PNG" alt="Sample Photo" />
    <p>
        <asp:Label ID="WelcomeLabel" runat="server" Text="Welcome, Please login to your account"/>
    </p>
    
    <asp:Login ID="Login1" runat="server" CssClass="Login" OnLoggedIn="LoginButton_Click">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">                           
                            <tr>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" placeholder="Username" CssClass="InputFields"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" placeholder="Password" TextMode="Password" CssClass="InputFields"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td algin="left">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" CssClass="LoginButton"/>
                                    <asp:Button ID="SignUpButton" runat="server" Text="Sign up" CssClass="SignUpButton" OnClick="SignUpButton_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
    <h3>To log as an admin : 285256 // Luca12</h3>
    <h3>To log as a teacher : 234234 // password</h3>
    <h3>To log as a registered student : 0123456 // 0123456 </h3>
    <h3>To log as an unregistered student : create a new account</h3>
   </div>
</asp:Content>

