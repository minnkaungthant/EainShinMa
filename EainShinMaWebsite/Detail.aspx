<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="EainShinMaWebsite.Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .detail-card {
    width: 300px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 2px 2px 15px #aaa;
    text-align: center;
    background-color: #fff;
}

.card-image {
    width: 100%;
    height: 200px;

    border-radius: 5px;
}

.card-title {
    font-size: 24px;
    font-weight: bold;
    margin: 10px 0;
}

.card-text {
    font-size: 16px;
    color: #555;
    margin: 5px 0;
}

    </style>

  <div class="card" style="width: 25rem; margin:20px;">
      <asp:Image ID="imgProduct" runat="server" class="card-img-top" alt="Product Image" style="height:250px; "  />
   
    <div class="card-body">

        <asp:Label ID="blName" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label>
        
    </div>
</div>

</asp:Content>
