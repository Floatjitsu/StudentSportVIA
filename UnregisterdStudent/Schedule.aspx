<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="Schedule.aspx.cs" Inherits="Pages_Schedule" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div id="schedule">
        <h3 style="margin-bottom:10px">Sport Schedule</h3>
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="7" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" RepeatDirection="Horizontal">           
            <ItemTemplate>
                <div id="scheduleItem">
                    <asp:Label ID="weekdayName" runat="server" CssClass="scheduleWeekday"/>
                    <asp:Label ID="weekdayLabel" runat="server" Text='<%# Eval("weekday") %>' CssClass="scheduleWeekday"/>    
                    <hr/>           
                    <asp:DataList ID="DataList2" runat="server" RepeatColumns="1" OnItemDataBound="DataList2_ItemDataBound">
                        <ItemTemplate>
                            <div id="nestedDataList" runat="server" > 
                                <asp:Label ID="sportNameLabel" runat="server" Text='<%# Eval("sportName") %>'/> <br />
                                <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>'/> <br />
                                <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'/> <br />
                                <asp:Label ID="cancelledLabel" runat="server" Text='<%# Eval("isCancelled") %>' Visible="false" />
                            </div>
                            <hr />
                        </ItemTemplate>
                    </asp:DataList> 
                </div>               
            </ItemTemplate>            
        </asp:DataList>
        <!-- DataSource for the Main DataList. We have to group by weekday otherwise we would have the number of days we have courses on this day (I.e. 2 courses on Monday, 29.04.2019 would give us this day two times)  -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SET DATEFIRST 1
SELECT CONVERT(VARCHAR(10), [weekday], 104) as weekday FROM [schedule] WHERE weekday &gt;= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate())) and
weekday&lt; dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate())) GROUP BY weekday">
        </asp:SqlDataSource>
    </div> 
</asp:Content>

