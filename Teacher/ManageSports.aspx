<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ManageSports.aspx.cs" Inherits="Pages_ManageSports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../styles/managesport.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">   

    <div id="manageSportContainer">
        <h2>Manage Sports</h2>
        <br />
    <div id="chooseSport">
        <asp:Label ID="Label1" runat="server" Text="Choose the sport you want to manage : " />
        <asp:DropDownList  runat="server" ID="dropDownSportName"  AutoPostBack="true"/>
    </div>
    <div id="sendNewsDiv">
        <br />
        <asp:Label ID="sendNewsLabel" Text="Send informations to your students here : " runat="server" />
        <asp:TextBox ID="sendNewsTextBox" runat="server"/>
        <asp:Button ID="sendNews" runat="server" Text="Send" OnClick="sendNews_Click"/> 
        <br />
    </div>

    <div id="teacherSchedule">
        <br />
        <h2>Your next lessons</h2>
        <br />
        <asp:DataList ID="nextLessonsDataList" runat="server" RepeatColumns="2" OnItemDataBound="DataList2_ItemDataBound">
            <ItemTemplate>
                <div id="scheduleItem">
                    <label>Lesson number : </label>
                    <asp:Label ID="lessonID" runat="server" CssClass="scheduleWeekday" Text='<%# Eval("id") %>' />
                    <hr />
                    <asp:Label ID="weekdayName" runat="server" CssClass="scheduleWeekday"/>
                    <asp:Label ID="weekdayLabel" runat="server" Text='<%# Eval("weekday") %>' CssClass="scheduleWeekday"/>    
                    <hr/>
                    <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>'/> <br />
                    <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'/> <br />
                    <asp:Label ID="cancelledLabel" runat="server" Text='<%# Eval("isCancelled") %>' Visible="false" />
                 </div>
            </ItemTemplate>
        </asp:DataList>
        <br />
    </div>

    <div id="cancelCourse">
        <label>Choose the number of the lesson you want to cancel</label>
        <asp:DropDownList  runat="server" ID="dropDownLessonNumber"/>
        <asp:Button ID="cancelCourseButton" runat="server" Text="Cancel" OnClick="cancelCourse_Click"/>
    </div>

        </div>
</asp:Content>