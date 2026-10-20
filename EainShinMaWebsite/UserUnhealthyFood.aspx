<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserUnhealthyFood.aspx.cs" Inherits="EainShinMaWebsite.UserUnhealthyFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--   <style>
        .food-card {
            border: none;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: linear-gradient(135deg, #f1fff1, #e8f5e9);
        }

        .food-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 24px rgba(46, 125, 50, 0.2);
        }

        .food-card-img {
            height: 220px;
            width: 100%;
            object-fit: cover;
            border-bottom: 2px solid #e0f2f1;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-weight: 700;
            font-size: 1.35rem;
            color: #1b5e20;
            margin-bottom: 10px;
        }

        .card-subtitle {
            font-size: 0.95rem;
            color: #388e3c;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 0.95rem;
            color: #444;
            line-height: 1.6;
        }

        .btn-overlay {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(46, 125, 50, 0.9);
            color: #fff;
            padding: 6px 14px;
            border-radius: 50px;
            font-size: 0.85rem;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn-overlay:hover {
            background: #2e7d32;
            transform: scale(1.05);
        }
    </style>--%>
    <style>
        .food-card {
            border: none;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: linear-gradient(135deg, #fff5f5, #ffeaea);
        }

        .food-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 24px rgba(211, 47, 47, 0.25);
        }

        .food-card-img {
            height: 220px;
            width: 100%;
            object-fit: cover;
            border-bottom: 2px solid #ffebee;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-weight: 700;
            font-size: 1.35rem;
            color: #b71c1c;
            margin-bottom: 10px;
        }

        .card-subtitle {
            font-size: 0.95rem;
            color: #e53935;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 0.95rem;
            color: #444;
            line-height: 1.6;
        }

        .btn-overlay {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(211, 47, 47, 0.9);
            color: #fff;
            padding: 6px 14px;
            border-radius: 50px;
            font-size: 0.85rem;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn-overlay:hover {
            background: #b71c1c;
            transform: scale(1.05);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row row-cols-1 row-cols-md-3 g-4 m-5">
        <asp:Repeater ID="rptUnhealthyFood" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card h-100 food-card position-relative">
                        <img src='<%# ResolveUrl("~/images/") + Eval("Photo") %>' class="food-card-img" alt="Food Image">
                        <a href="UserUnhealthyFoodDetail.aspx?FoodID=<%# Eval("FoodID") %>" class="btn btn-overlay">View</a>
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("FoodName") %></h5>
                            <p class="card-subtitle"><strong>ရောဂါ:</strong> <%# Eval("Disease") %></p>
                    <%--        <p class="card-text"><%# Eval("Description") %></p>--%>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
