<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RoomBooking.aspx.cs"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/booking.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
        
    <h1>Book a room</h1>
    
    <div class="bookingContainer">
        
            
            <div class="content1">
                <label>Name :</label> <asp:TextBox ID="TextBox1" placeholder="Name" runat="server"></asp:TextBox><br />
                <label>Description :</label> <asp:TextBox ID="TextBox2" placeholder="Description" runat="server"></asp:TextBox>
            </div>

        <div class="contentRoom">
            <label>Choose a room :</label><br />
            <div class="GymRadio">
                <div class="RoomGym">
                    Gym
                </div>
            
                <input name="roomID" type="radio" checked="checked"/>
                <span class="checkmark"></span>
            </div>

            <div class="LeftRadio">
                <div class="RoomLeft">
                    Left Hall
                </div>
                <input name="roomID" type="radio"/>
            </div>
            
            <div class="RightRadio">    
                <div class="RoomRight">
                    Right Hall
                </div>
                <input name="roomID" type="radio"/>
            </div>
        </div>

        <div class="content2">
            
            Choose a date: <br />
            <label>Date :</label> <br />
            <div>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox3" FirstDayOfWeek="Monday" Format="dd/MM/yyyy"></asp:CalendarExtender>
            </div>
            <label>Start Time :</label> 
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Text="16:00" Value="hour1"></asp:ListItem>
                <asp:ListItem Text="17:00" Value="hour2"></asp:ListItem>
                <asp:ListItem Text="18:00" Value="hour3"></asp:ListItem>
                <asp:ListItem Text="19:00" Value="hour4"></asp:ListItem>
                <asp:ListItem Text="20:00" Value="hour6"></asp:ListItem>
                <asp:ListItem Text="21:00" Value="hour7"></asp:ListItem>
            </asp:DropDownList><br />
            <label>End Time :</label>
            <asp:DropDownList ID="DropDownList2" runat="server">
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
        

        <button class="confirmButton">Confirm Booking</button>



    </div>
</asp:Content>
