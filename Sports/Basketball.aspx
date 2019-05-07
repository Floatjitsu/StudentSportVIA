<%@ Page Title="" Language="C#" MasterPageFile="~/NestedSport.master" AutoEventWireup="true" CodeFile="Basketball.aspx.cs" Inherits="Sports_Basketball" %>


<%-- Virtual path for using property of the NestedSport master page--%>
<%@ MasterType VirtualPath="~/NestedSport.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SportASPXHead" runat="server">
</asp:Content>


<%-- Sport Title--%>
<asp:Content ID="ContentTitle" ContentPlaceHolderID="ContentPlaceHolderTitle" runat="server">
    Basketball
</asp:Content>

<%-- Subscribe Button--%>
<asp:Content ID="Content10" ContentPlaceHolderID="subscribeButtonPlaceHolder" runat="server">
    <asp:Button ID="SubscribeButton" runat="server" Text="+ Subscribe to this sport" CssClass="subscribeButton" OnClick="subscribeSport" />
    <asp:Button ID="UnsubscribeButton" runat="server" Text="- Unsubscribe to this sport" CssClass="subscribeButton" OnClick="unsubscribeSport" />
     <asp:Button ID="JoinTheSystemButton" runat="server" Text="$ Pay to be able to subscribe $" CssClass="payButton"/>
</asp:Content>

<%-- Name of the teacher--%>
<asp:Content ID="Content9" ContentPlaceHolderID="TeacherNameContentPlaceHolder" runat="server">
   Willie Marcel
</asp:Content>

<%-- Image of the teacher--%>
<asp:Content ID="Content6" ContentPlaceHolderID="TeacherImageContentPlaceHolder" runat="server">
    <img src="../Images/basketballTeacher.jpg" alt="SportTeacher" class="ImageTeacherSport"/>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="text-align:justify; font-size:15px;">
       Played by two teams of usually five players each on a rectangular court having
       a raised basket or goal at each end, points being scored by tossing the ball through the opponent's basket.
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Here the latest news from the sport Teacher-->
    <!-- Creating the connection to the database!-->
    <asp:SqlDataSource ID="LatestNewsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT news as news FROM [news] WHERE sportname='Basketball'">
    </asp:SqlDataSource>
    <!--Showing data from the database -->
    <asp:DataList ID="LatestNewsDataList" runat="server" RepeatColumns="0" DataSourceID="LatestNewsSqlDataSource" RepeatDirection="Vertical">
     <ItemTemplate>
            <div id="LatestNewsDbsDiv">
                <asp:Label ID="Label1" runat="server" Text=" - "/>
                <asp:Label runat="server" ID="username" Text='<%# Eval("news") %>'/>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
   <asp:Label ID="sportName" runat="server" Text="Basketball" Visible="false" />
   <!-- Sport Schedule here -->
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
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
    <img src="../Images/Basketball1.jpg" alt="SportTeacher" class="sportPicture"/>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Picture2ContentPlaceHolder" runat="server">
    <img src="../Images/Basketball2.jpg" alt="SportTeacher" class="sportPicture"/>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
   
    <br />
    <br />
    ContentPlaceHolder4 here!
</asp:Content>

<asp:Content ID="chat" ContentPlaceHolderID="ChatPlaceHolder" runat="server">
    <!-- DataSource for the Chat. -->

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT Id as id,username as username, message as message FROM [chatmessage] WHERE sportname='Basketball' ORDER BY id" />
        
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