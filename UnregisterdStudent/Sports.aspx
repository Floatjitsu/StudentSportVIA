<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="Sports.aspx.cs" Inherits="Sports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/sports-list.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
  
    <div id ="container">
        <h1 class="listHead">Sports</h1>
        
        <a class="sportContainer" href="../Sports/Football.aspx">
                <p class="sportName">Football</p>
                <div class="square" style="background-color:mediumblue">&nbsp;</div>
        </a>
        
        <a class="sportContainer" href="../Sports/Basketball.aspx">
                <p class="sportName">Basketball</p>
                <div class="square" style="background-color:red">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Badminton.aspx">
                <p class="sportName">Badminton</p>
                <div class="square" style="background-color:pink">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Volleyball.aspx">
                <p class="sportName">Volleyball</p>
                <div class="square" style="background-color:green">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Kickboxing.aspx">
                <p class="sportName">Kickboxing</p>
                <div class="square" style="background-color:yellow">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Rugby.aspx">
                <p class="sportName">Rugby</p>
                <div class="square" style="background-color:brown">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/LatinDance.aspx">
                <p class="sportName">Latin dance</p>
                <div class="square" style="background-color:blueviolet">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/ABS.aspx">
                <p class="sportName">ABS</p>
                <div class="square" style="background-color:lightsalmon">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Stretching.aspx">
                <p class="sportName">Stretching</p>
                <div class="square" style="background-color:darkcyan">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Booty.aspx">
                <p class="sportName">Booty</p>
                <div class="square" style="background-color:crimson">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Dodgeball.aspx">
                <p class="sportName">Dodgeball</p>
                <div class="square" style="background-color:silver">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Cardio.aspx">
                <p class="sportName">Cardio</p>
                <div class="square" style="background-color:mediumpurple">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/DanceHall.aspx">
                <p class="sportName">Dance Hall</p>
                <div class="square" style="background-color:springgreen">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Tabata.aspx">
                <p class="sportName">Tabata</p>
                <div class="square" style="background-color:powderblue">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/X-Fit.aspx">
                <p class="sportName">X-Fit</p>
                <div class="square" style="background-color:darkorange">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Calisthenics.aspx">
                <p class="sportName">Calisthenics</p>
                <div class="square" style="background-color:olive">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Fitness.aspx">
                <p class="sportName">Fitness</p>
                <div class="square" style="background-color:deeppink">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Climbing.aspx">
                <p class="sportName">Climbing</p>
                <div class="square" style="background-color:darkgoldenrod">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Powerlifting.aspx"">
                <p class="sportName">Powerlifting</p>
                <div class="square" style="background-color:darkturquoise">&nbsp;</div>
        </a>

        <a class="sportContainer" href="../Sports/Weightlifting.aspx">
                <p class="sportName">Weightlifting</p>
                <div class="square" style="background-color:limegreen">&nbsp;</div>
        </a>
    </div>

</asp:Content>
