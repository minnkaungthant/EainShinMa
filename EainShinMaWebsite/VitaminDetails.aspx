<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="VitaminDetails.aspx.cs" Inherits="EainShinMaWebsite.VitaminDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* Card styling */
        .food-card {
            border-radius: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%;
        }

        .food-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        /* Image styling */
        .food-card .card-img-top {
            width: 100%;
            height: 180px;          /* Fixed card image height */
            object-fit: contain;     /* Image fully visible */
            object-position: center;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            background-color: #f8f9fa; /* light gray background for empty space */
        }

        .card-text {
            font-weight: 600;
            font-size: 16px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container mt-4">
            <div class="row">
                <asp:Repeater ID="rptFoods" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                            <div class="card h-100 shadow-sm food-card">
                                <img src='<%# ResolveUrl("~/images/" + Eval("Photo").ToString()) %>' 
                                     class="card-img-top" />
                                <div class="card-body text-center">
                                    <p class="card-text"><%# Eval("FoodName") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
</asp:Content>
