<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MealDetailsUpd.aspx.cs" Inherits="EainShinMaWebsite.MealDetailsUpd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--     <div class="container">
            <asp:Panel ID="pnlMeal" runat="server" Visible="false">
                <div class="card meal-card justify-content-center" style="width:500px;margin:auto;margin-top">
                                           <asp:Image ID="imgMeal" runat="server" 
    CssClass="card-img-top meal-image" 
    style="height:200px; object-fit:cover;" />


                    <div class="card-body">
                        <h2 id="lblMealName" runat="server" class="card-title"></h2>
                        <h5>Ingredients:</h5>
                        <p id="lblIngredient" runat="server" class="card-text"></p>
                        <h5>Description:</h5>
                        <p id="lblDescription" runat="server" class="card-text"></p>
                        <a href="Meal.aspx" class="btn btn-success mt-3">Back to Meals</a>
                    </div>
                </div>
            </asp:Panel>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-5" Font-Size="Large"></asp:Label>
        </div>--%>
    <asp:Panel ID="pnlMeal" runat="server" Visible="false">
    <div class="card mx-auto shadow-lg" style="max-width: 900px; border-radius: 15px; overflow: hidden;">
        
        <!-- Meal Photo with Frame -->
        <div class="text-center mt-4">
            <asp:Image ID="imgMeal" runat="server" 
                CssClass="meal-photo img-fluid shadow" 
                style="max-height: 300px;" />
        </div>

        <div class="card-body text-center">
            <h2 id="lblMealName" runat="server" class="card-title mb-3"></h2>
            <h5 class="text-danger">ပါဝင်ပစ္စည်း</h5>
            <p id="lblIngredient" runat="server" class="card-text"></p>
            <h5 class="text-danger">ဟင်းချက်နည်းအဆင့်ဆင့်</h5>
            <p id="lblDescription" runat="server" class="card-text"></p>
            <%--         <p id="P1" runat="server" class="card-text"></p>--%>
            <a href="Meal.aspx" class="btn btn-outline-danger mt-3">Back to Meals</a>
        </div>
 
    </div>
</asp:Panel>


</asp:Content>
