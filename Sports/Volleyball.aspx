<%@ Page Title="" Language="C#" MasterPageFile="~/NestedSport.master" AutoEventWireup="true" CodeFile="Volleyball.aspx.cs" Inherits="Sports_Volleyball" %>

<%-- Virtual path for using property of the NestedSport master page--%>
<%@ MasterType VirtualPath="~/NestedSport.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SportASPXHead" runat="server">
</asp:Content>

<%-- Sport Title--%>
<asp:Content ID="ContentTitle" ContentPlaceHolderID="ContentPlaceHolderTitle" runat="server">
    Volleyball
</asp:Content>

<%-- Subscribe Button--%>
<asp:Content ID="Content10" ContentPlaceHolderID="subscribeButtonPlaceHolder" runat="server">
    <asp:Button ID="SubscribeButton" runat="server" Text="+ Subscribe to this sport" CssClass="subscribeButton" OnClick="subscribeSport" />
    <asp:Button ID="UnsubscribeButton" runat="server" Text="- Unsubscribe to this sport" CssClass="subscribeButton" OnClick="unsubscribeSport" />
</asp:Content>

<%-- Name of the teacher--%>
<asp:Content ID="Content9" ContentPlaceHolderID="TeacherNameContentPlaceHolder" runat="server">
   Naomi Burke
</asp:Content>

<%-- Image of the teacher--%>
<asp:Content ID="Content6" ContentPlaceHolderID="TeacherImageContentPlaceHolder" runat="server">
    <img src="../Images/volleyballTeacher.jpg" alt="SportTeacher" class="ImageTeacherSport"/>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="text-align:justify">
        Two teams use their hands to hit a large ball backwards and forwards over a high net without
        allowing the ball to touch the ground.
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <br />
    ContentPlaceHolder2 here!
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:Label ID="sportName" runat="server" Text="Volleyball" Visible="false" />
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
    <img src="../Images/volleyball1.jpg" alt="SportTeacher" class="sportPicture"/>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Picture2ContentPlaceHolder" runat="server">
    <img src="../Images/volleyball2.jpg" alt="SportTeacher" class="sportPicture"/>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
   
    <br />
    <br />
    ContentPlaceHolder4 here!
</asp:Content>

<asp:Content ID="chat" ContentPlaceHolderID="ChatPlaceHolder" runat="server">
    <!-- DataSource for the Chat. -->

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT Id as id,username as username, message as message FROM [chatmessage] WHERE sportname='Volleyball' ORDER BY id" />
        
    <asp:DataList ID="DataListChat" runat="server" RepeatColumns="0" DataSourceID="SqlDataSource2" RepeatDirection="Vertical">
        <ItemTemplate>
            <div id="chatItem">
                <asp:Label runat="server" CssClass="chatItem" ID="username" Text='<%# Eval("username") %>'/>
                <asp:Label ID="Label1" runat="server" CssClass="chatItem" Text=" : "/>
                <asp:Label runat="server" CssClass="chatItem" ID="message" Text='<%# Eval("message") %>'/>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

<asp:Content ID="sendMessageContent" ContentPlaceHolderID="SendMessagePlaceHolder" runat="server">
    <asp:TextBox ID="currentMessage" runat="server"/>
    <asp:Button ID="sendMessage" runat="server" Text="Send" OnClick="sendMessage_Click"/> 
</asp:Content>
