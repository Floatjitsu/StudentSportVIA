<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="RoomBooking.aspx.cs" Inherits="Pages_RoomBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/booking.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="roomBooking">
        <h3 style="margin-bottom:10px"> Book a Room </h3>     
        <div class="bookingContainer">                
            <div class="content1">
                <asp:Label ID="Label1" Text="Name: " runat="server" />
                <asp:TextBox ID="TextBoxName" placeholder="Name" runat="server" />
                <asp:RequiredFieldValidator ID="nameValidator" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Please type in your name" ForeColor="Red"/>
                <br />
                <asp:Label ID="Label2" Text="Description: " runat="server" /> 
                <asp:TextBox ID="TextBoxDescription" placeholder="Description" runat="server" />
                <asp:RequiredFieldValidator ID="descriptionValidator" runat="server" ControlToValidate="TextBoxDescription" ErrorMessage="Please type in a description" ForeColor="Red"/>
            </div>
            <div class="contentRoom">
                <label>Choose a room :</label> <br />
                <div class="GymRadio">

                    <div class="RoomGym">
                        Gym
                    </div>
                    <asp:RadioButton ID="gymRadioButton" runat="server" GroupName="roomSelection" Checked="true" />
                    <span class="checkmark"></span>
                </div>

                <div class="LeftRadio">
                    <div class="RoomLeft">
                        Left Hall
                    </div>
                    <asp:RadioButton ID="leftHallRadioButton" runat="server" GroupName="roomSelection" />
                </div>
            
                <div class="RightRadio">    
                    <div class="RoomRight">
                        Right Hall
                    </div>
                    <asp:RadioButton ID="rightHallRadioButton" runat="server" GroupName="roomSelection" />
                </div>
            </div>

            <div class="content2">            
                Choose a date: <br />
                <asp:Label ID="Label3" Text="Date: " runat="server" />                
                <br />
                <div>
                    <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBoxDate" FirstDayOfWeek="Monday" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="dateValidator" runat="server" ControlToValidate="TextBoxDate" ErrorMessage="Please pick a date" ForeColor="Red"/>
                </div>
                <label>Start Time :</label> 
                <asp:DropDownList ID="DropDownListStartTime" runat="server">
                    <asp:ListItem Text="16:00" Value="hour1"></asp:ListItem>
                    <asp:ListItem Text="17:00" Value="hour2"></asp:ListItem>
                    <asp:ListItem Text="18:00" Value="hour3"></asp:ListItem>
                    <asp:ListItem Text="19:00" Value="hour4"></asp:ListItem>
                    <asp:ListItem Text="20:00" Value="hour6"></asp:ListItem>
                    <asp:ListItem Text="21:00" Value="hour7"></asp:ListItem>
                </asp:DropDownList><br />
                <label>End Time :</label>
                <asp:DropDownList ID="DropDownListEndTime" runat="server">
                    <asp:ListItem Text="17:00" Value="hour2"></asp:ListItem>
                    <asp:ListItem Text="18:00" Value="hour3"></asp:ListItem>
                    <asp:ListItem Text="19:00" Value="hour4"></asp:ListItem>
                    <asp:ListItem Text="20:00" Value="hour5"></asp:ListItem>
                    <asp:ListItem Text="21:00" Value="hour6"></asp:ListItem>
                    <asp:ListItem Text="22:00" Value="hour7"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <h2> Schedule preview</h2>
            </div>       
            <asp:Button ID="ConfirmButton" runat="server" Text="Confirm Booking" CssClass="confirmButton" OnClick="ConfirmButton_Click"/>
        </div>
        <asp:Label ID="successLabel" runat="server" ForeColor="Green" Text="Booking Successful!" Visible="false" />     
    </div>    
</asp:Content>

