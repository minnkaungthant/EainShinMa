<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MealDetails.aspx.cs" Inherits="EainShinMaWebsite.MealDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .meal-card {
            max-width: 900px;
            margin: 50px auto;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            transition: transform 0.3s;
        }
        .meal-card:hover {
            transform: translateY(-5px);
        }
        .meal-image {
            height: 400px;
            /*object-fit: cover;*/
        }
    </style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
            <asp:Panel ID="pnlMeal" runat="server" Visible="false">
                <div class="card meal-card">
                     <asp:Image ID="Image2" runat="server" CssClass="card-img-top meal-image"
                        ImageUrl='<%# ResolveUrl("~/images/") + Eval("Photo") %>' alt="Meal Image"
                       style="height:150px; object-fit:cover;" />

                    <div class="card-body">
                        <h2 id="lblMealName" runat="server" class="card-title"></h2>
                        <h5>Ingredients:</h5>
                        <p id="lblIngredient" runat="server" class="card-text"></p>
                        <h5>Description:</h5>
                        <p id="lblDescription" runat="server" class="card-text"></p>
                        <a href="MealCards.aspx" class="btn btn-success mt-3">Back to Meals</a>
                    </div>
                </div>
            </asp:Panel>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-5" Font-Size="Large"></asp:Label>
        </div>


</asp:Content>
