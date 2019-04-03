<%@ Page Title="" Language="C#" MasterPageFile="~/LoginPageMaster.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <img src="studentSport_logo.PNG" alt="Sample Photo" />
    <div id="SignUp">

    
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <ContentTemplate>
                    <table>                       
                        <tr>
                            <td align="left"> 
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="" Text="User Name:"/>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" CssClass="InputFields" />
                                <asp:RequiredFieldValidator ID="UserNameValidator" runat="server" ErrorMessage="User Name is required" ForeColor="Red" ControlToValidate="UserName" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="PasswordLabel" runat="server" Text="Password:" />
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="InputFields"/>
                                <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="Password" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="PasswordConfirmLabel" runat="server" Text="Confirm Password:" />
                            </td>
                            <td>
                                <asp:TextBox ID="PasswordConfirm" runat="server" TextMode="Password" CssClass="InputFields"/>
                                <asp:RequiredFieldValidator ID="PasswordConfirmValidator" runat="server" ErrorMessage="Password confirm is required" ForeColor="Red" ControlToValidate="PasswordConfirm" ValidationGroup="CreateUserWizard1"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="EmailLabel" runat="server" Text="E-Mail:" />
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server" CssClass="InputFields" />
                                <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="Email" ValidationGroup="CreateUserWizard1" color/>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="RoleLabel" runat="server" Text="User Role:"/>
                            </td>
                            <td>
                                <asp:DropDownList ID="RoleList" runat="server" Width="170px" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="PasswordConfirm" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <CustomNavigationTemplate>
                    <table border="0" cellspacing="5" style="width:100%;height:100%;">
                        <tr align="right">
                            <td align="right" colspan="0">
                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="SignUp" ValidationGroup="CreateUserWizard1" CssClass="LoginButton" />
                            </td>
                        </tr>
                    </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
        </div>
</asp:Content>

