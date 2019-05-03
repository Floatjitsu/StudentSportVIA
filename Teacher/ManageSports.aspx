<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ManageSports.aspx.cs" Inherits="Pages_ManageSports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">   
    <asp:DropDownList  runat="server" ID="dropDownSportName"  AutoPostBack="true"/>

    <div id="sendNewsDiv">
        <asp:TextBox ID="sendNewsTextBox" runat="server"/>
        <asp:Button ID="sendNews" runat="server" Text="Send" OnClick="sendNews_Click"/> 
    </div>

    <div id="teacherSchedule">
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
    </div>

    <div id="cancelCourse">
        <label>Choose the number of the lesson you want to cancel</label>
        <asp:DropDownList  runat="server" ID="dropDownLessonNumber"/>
        <asp:Button ID="cancelCourseButton" runat="server" Text="Cancel" OnClick="cancelCourse_Click"/>
    </div>
</asp:Content>