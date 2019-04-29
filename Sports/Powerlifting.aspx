
<%@ Page Title="" Language="C#" MasterPageFile="~/NestedSport.master" AutoEventWireup="true" CodeBehind="Powerlifting.aspx.cs" Inherits="WEEAssignment.Sports.Powerlifting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SportASPXHead" runat="server">
</asp:Content>

<%-- Sport Title--%>
<asp:Content ID="ContentTitle" ContentPlaceHolderID="ContentPlaceHolderTitle" runat="server">
    <asp:Label ID="sportName" runat="server" Text="Powerlifting" />
</asp:Content>

<%-- Name of the teacher--%>
<asp:Content ID="Content9" ContentPlaceHolderID="TeacherNameContentPlaceHolder" runat="server">
    Michel Dupont
</asp:Content>

<%-- Image of the teacher--%>
<asp:Content ID="Content6" ContentPlaceHolderID="TeacherImageContentPlaceHolder" runat="server">
    <img src="../Images/PowerliftingTeacher.jpg" alt="SportTeacher" class="ImageTeacherSport"/>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="text-align:justify; font-size:12px;">Powerlifting is a strength sport that consists of three attempts at maximal weight on three lifts: squat, bench press, and deadlift. As in the sport of Olympic weightlifting, it involves the athlete attempting a maximal weight single lift of a barbell loaded with weight plates.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <br />
    ContentPlaceHolder2 here!
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
   
    <br />
    <br />
    ContentPlaceHolder3 here!
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Picture1ContentPlaceHolder" runat="server">
    <img src="../Images/Powerlifting1.jpg" alt="SportTeacher" class="sportPicture"/>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Picture2ContentPlaceHolder" runat="server">
    <img src="../Images/Powerlifting2.jpg" alt="SportTeacher" class="sportPicture"/>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
   
    <br />
    <br />
    ContentPlaceHolder4 here!
</asp:Content>