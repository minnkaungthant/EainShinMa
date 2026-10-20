<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserUnhealthyFoodDetail.aspx.cs" Inherits="EainShinMaWebsite.UserUnhealthyFoodDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .detail-card {
            max-width: 850px;
            margin: 30px auto;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(211, 47, 47, 0.2);
            background: linear-gradient(135deg, #fff5f5, #ffeaea);
            transition: transform 0.3s ease;
        }

        .detail-card:hover {
            transform: translateY(-5px);
        }
        .detail-img {
            width: 100%;
            height: 350px;
            object-fit: cover;
            border-bottom: 3px solid #ffebee;
        }

        .detail-body {
            padding: 25px;
        }
        .detail-title {
            font-size: 1.8rem;
            font-weight: bold;
            color: #b71c1c;
            margin-bottom: 12px;
        }

        .detail-subtitle {
            font-size: 1rem;
            color: #e53935;
            margin-bottom: 16px;
        }
          .detail-text {
            font-size: 1.05rem;
            line-height: 1.7;
            color: #444;
        }

        .back-btn {
            display: inline-block;
            margin-top: 18px;
            background: #d32f2f;
            color: #fff;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }
         .back-btn:hover {
            background: #b71c1c;
            transform: scale(1.05);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="dvFoodDetails" runat="server" AutoGenerateRows="false" CssClass="detail-card">
        <Fields>
            <asp:TemplateField>
                <ItemTemplate>
                    <img src='<%# ResolveUrl("~/images/") + Eval("Photo") %>' class="detail-img" alt="Food Image" />
                    <div class="detail-body">
                        <h2 class="detail-title"><%# Eval("FoodName") %></h2>
                        <p class="detail-subtitle"><strong>ရောဂါ:</strong> <%# Eval("Disease") %></p>
                        <p class="detail-text"><%# Eval("Description") %></p>
                        <a href="UserUnhealthyFood.aspx" class="back-btn">← Back</a>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>


</asp:Content>
