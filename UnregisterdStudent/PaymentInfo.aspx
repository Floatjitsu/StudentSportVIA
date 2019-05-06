<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="PaymentInfo.aspx.cs" Inherits="PaymentInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="../styles/home.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div class="bg-pi">
        
            <a href="Home.aspx" title="back"> <img class="back-button" src="../images/left-arrow.png"/> </a>

        <div class="pi-title">
            <div class="bg-title">
                <h2 class="bg-title-color">Payment Informations</h2>
            </div>
        </div>
        <div class="pi-text">      
            If you want to join the amazing VIA gym, you have to pay first. To do so, you will need two things which you can do in any order :
            <br />
            You have to create an account on this website, using your VIA ID and choose a password. At this point you will be able to see the schedule and which sports are available on campus.
            <br />
            You have to pay the subscription fee, which can only be done at the gym. Just find a teacher, give them the money either with cash or MobilePay, as well as your VIA ID. 
            <br />
            After this you will be registered on the website as a subscribed member of the gym, and have access to every functionnality of the website as the chat and the possibility to book part of the gyms when they are free.
        </div>

    </div>
</asp:Content>

