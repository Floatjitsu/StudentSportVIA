﻿<%@ Page Title="" Language="C#" MasterPageFile="~/NestedSport.master" AutoEventWireup="true" CodeFile="Rugby.aspx.cs" Inherits="Sports_Rugby" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SportASPXHead" runat="server">
</asp:Content>

<%-- Sport Title--%>
<asp:Content ID="ContentTitle" ContentPlaceHolderID="ContentPlaceHolderTitle" runat="server">
    Rugby
</asp:Content>

<%-- Name of the teacher--%>
<asp:Content ID="Content9" ContentPlaceHolderID="TeacherNameContentPlaceHolder" runat="server">
   Ralph Arnold
</asp:Content>

<%-- Image of the teacher--%>
<asp:Content ID="Content6" ContentPlaceHolderID="TeacherImageContentPlaceHolder" runat="server">
    <img src="../Images/rugbyCoach.jpg" alt="SportTeacher" class="ImageTeacherSport"/>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="text-align:justify">
        Two teams try to score points by carrying an oval ball across a
        particular line or kicking it over and between an H-shaped set of posts.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <br />
    ContentPlaceHolder2 here!
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:Label ID="sportName" runat="server" Text="Rugby" Visible="false" />
   <!-- Sport Schedule here -->
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <div id="scheduleItem">
                <asp:Label ID="weekdayName" runat="server" CssClass="scheduleWeekday"/>
                <asp:Label ID="weekdayLabel" runat="server" Text='<%# Eval("weekday") %>' CssClass="scheduleWeekday"/>    
                <hr/>
                <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>'/> <br />
                <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'/> <br />
                <asp:Label ID="cancelledLabel" runat="server" Text='<%# Eval("isCancelled") %>' Visible="false" />
             </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SET DATEFIRST 1 SELECT CONVERT(VARCHAR(10), [weekday], 104) as weekday, [time], [place], [isCancelled] FROM [schedule] WHERE ([sportName] = @sportName) AND weekday &gt;= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate())) and
        weekday&lt; dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate()))">
        <SelectParameters>
            <asp:ControlParameter ControlID="sportName" Name="sportName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Picture1ContentPlaceHolder" runat="server">
    <img src="../Images/rugby1.jpg" alt="SportTeacher" class="sportPicture"/>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Picture2ContentPlaceHolder" runat="server">
    <img src="../Images/rugby2.jpg" alt="SportTeacher" class="sportPicture"/>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
   
    <br />
    <br />
    ContentPlaceHolder4 here!
</asp:Content>