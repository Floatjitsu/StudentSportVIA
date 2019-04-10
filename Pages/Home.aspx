<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/home.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="container">
        <h1>Home</h1>
        <div class="row">
            
                <img src="../images/spongebob.jpg" class="imgRow" />
            
                <a href="PaymentInfo.aspx">
                    <img src="../images/spongebob.jpg"  class="imgRow" id="middleImg"/>
                </a>           
                <img src="../images/spongebob.jpg"  class="imgRow" />
          
        </div>
        <div class="row" id="headNews">
            <span>Latest news</span>
        </div>
        <div class="row" id="news">
            DO STUFF WITH DATABASE HERE
        </div>
        <div class="row" id="picRow">
            <div class="leftPic">
                <div id="headPic">
                    <span>Pictures</span>
                </div>
                <img src="../images/spongebob.jpg" width="75%" height="215px"/>
            </div>
            <div class="middlePic">
                &nbsp;
            </div>
            <div class="rightPic">
                DO STUFF HERE
            </div>
        </div>
    </div>
</asp:Content>
