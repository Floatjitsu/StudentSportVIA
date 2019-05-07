<%@ Page Title="" Language="C#" MasterPageFile="~/LoginPageMaster.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <img src="studentSport_logo.PNG" alt="Sample Photo" />
    <div id="SignUp">

    <!-- RequiresEmail = false for not having an email field -->
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" RequireEmail="false">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" >
                <ContentTemplate>
                    <table>                       
                        <tr>
                            <td align="left"> 
                                <asp:Label ID="UserNameLabel" runat="server" Text="VIA ID:"/>
                            </td>
                            <td> 
                                <!-- You can't change the ID UserName because its a reference to te ASP.NET configuration toolbox -->                              
                                <asp:TextBox ID="UserName" runat="server" CssClass="InputFields" />
                                <!-- VIA ID Text Box only allows Numbers -->
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="UserName" FilterType="Numbers" />
                                <asp:RequiredFieldValidator ID="UserNameValidator" runat="server" ErrorMessage="VIA ID is required" ForeColor="Red" ControlToValidate="UserName" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="FirstNameLabel" runat="server" Text="First Name:" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="InputFields"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required" ForeColor="Red" ControlToValidate="Password" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="SurnameLabel" runat="server" Text="Surname:" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxSurname" runat="server" CssClass="InputFields"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname is required" ForeColor="Red" ControlToValidate="Password" ValidationGroup="CreateUserWizard1" />
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
                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Sign Up" ValidationGroup="CreateUserWizard1" CssClass="LoginButton" />
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

