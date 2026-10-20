<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="EainShinMaWebsite.User1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="home.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <!-- Hero Section -->
    <section id="hero">
        <h2>မိသားစုထမင်း</h2>
        <p>Find your new furry friend today!</p>
      
    </section>

    <!-- Main Action Cards Section -->
    <section id="main-cards">
        <asp:Literal ID="MainCardsContainer" runat="server">
            <!-- Content will be set dynamically from code-behind -->
   
        </asp:Literal>
    </section>

</asp:Content>
