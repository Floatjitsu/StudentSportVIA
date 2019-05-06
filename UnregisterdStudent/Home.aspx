<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/home.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="container">
        <h1>Home</h1>
        <div class="row">
            
                <img src="../images/sportimg1.jpg" class="imgRow" />
            
                <a href="../UnregisterdStudent/PaymentInfo.aspx">
                    <div id="payinfo"> Payment informations</div>
                 
                </a>           
                <img src="../images/sportimg2.png"  class="imgRow" />
          
        </div>
        <div class="row" id="headNews">
            <span>Latest news</span>
        </div>
       <div class="row" id="news" style="overflow:auto">
           <%-- Split view for registered student, teacher, admin and unregistered --%>
            <asp:LoginView ID="NewsLoginView" runat="server">
                <AnonymousTemplate>
                    <div class="NewsCenter">
                        <div class="childNews">
                    <p>
                        You need to <b>pay and be subscribed</b> to be able to see the news.
                        <br />
                        Here you will be able to see all the messages sent from the teacher of the sports you are subscribed to.
                    </p>
                            </div>
                        </div>
                </AnonymousTemplate>
                <RoleGroups>
                    <asp:RoleGroup Roles="unregisteredStudent">
                        <ContentTemplate>
                         <div class="NewsCenter">
                        <div class="childNews">
                    <p><br /><br /><br />
                       
                        You need to <b>pay and be subscribed</b> to be able to see the news.
                        <br />
                        Here you will be able to see all the messages sent from the teacher of the sports you are subscribed to.
                    </p>
                            </div>
                        </div>
                        </ContentTemplate>
                    </asp:RoleGroup>

                    <asp:RoleGroup Roles="registeredStudent">
                        <ContentTemplate>
                            <%--Retrieve data from the database for showing the latest news from the sports the user is subscribed to--%>
                            <asp:DataList ID="DataListNews" runat="server" RepeatColumns="0" RepeatDirection="Vertical">
                                <ItemTemplate>
                                    <div id="chatItem">
                                        <asp:Label runat="server" CssClass="chatItem" ID="sportname" Text='<%# Eval("sportname") %>' />
                                        <asp:Label ID="Label1" runat="server" CssClass="chatItem" Text=" : " />
                                        <asp:Label runat="server" CssClass="chatItem" ID="news" Text='<%# Eval("news") %>' />
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </ContentTemplate>

                    </asp:RoleGroup>
                    <asp:RoleGroup Roles="teacher">
                        <ContentTemplate>
                            <%--Retrieve data from the database for showing the latest news from the sports the user is subscribed to--%>
                            <asp:DataList ID="DataListNews" runat="server" RepeatColumns="0" RepeatDirection="Vertical">
                                <ItemTemplate>
                                    <div id="chatItem">
                                        <asp:Label runat="server" CssClass="chatItem" ID="sportname" Text='<%# Eval("sportname") %>' />
                                        <asp:Label ID="Label1" runat="server" CssClass="chatItem" Text=" : " />
                                        <asp:Label runat="server" CssClass="chatItem" ID="news" Text='<%# Eval("news") %>' />
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </ContentTemplate>
                    </asp:RoleGroup>
                    <asp:RoleGroup Roles="admin">
                        <ContentTemplate>
                            <%--Retrieve data from the database for showing the latest news from the sports the user is subscribed to--%>
                            <asp:DataList ID="DataListNews" runat="server" RepeatColumns="0" RepeatDirection="Vertical">
                                <ItemTemplate>
                                    <div id="chatItem">
                                        <asp:Label runat="server" CssClass="chatItem" ID="sportname" Text='<%# Eval("sportname") %>' />
                                        <asp:Label ID="Label1" runat="server" CssClass="chatItem" Text=" : " />
                                        <asp:Label runat="server" CssClass="chatItem" ID="news" Text='<%# Eval("news") %>' />
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
  
        </div>
        <div class="row" id="picRow">
            <div class="leftPic" >
                <div id="headPic">
                    <span>More informations</span>
                </div>
             <div style="margin-top:20px; padding-left:15px;">
                 The VIA gym is a friendly space where you'll be able to experience a lot of differents sports. 
                <br />
                Whether you're experienced or not doesn't matter, teachers are always here to help you.
                <br />
                This place is entirely run by students, from teachers to admin.
                <br />
                Each semester, competition and dance shows are organized so that you can show the skills you picked up to the world !
                <br />
                We hope to see you soon at the gym !
            </div>
                </div>
            <div class="middlePic">
                &nbsp;
            </div>
            <div class="rightPic">
                <div id="headPic2">
                    <span>Price informations</span>
                </div>
                <div id="contentRight">
                    </br>
                <b>400 dkk</b> until the 25/02/2019 </br></br>
                <b>500 dkk</b> after the 26/02/2019

                </div>
            </div>
        </div>
    </div>
</asp:Content>