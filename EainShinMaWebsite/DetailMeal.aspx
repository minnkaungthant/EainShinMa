<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="DetailMeal.aspx.cs" Inherits="EainShinMaWebsite.DetailMeal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .detail-card {
        border: none;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        transition: transform 0.3s ease;
    }

    .detail-card:hover {
        transform: translateY(-5px);
    }

    .detail-img {
        height: 100%;
        object-fit: cover;
    }

    .detail-body {
        background: linear-gradient(135deg, #fdfbfb, #ebedee);
    }

    .product-title {
        font-size: 2rem;
        font-weight: 700;
        color: #2c3e50;
    }

    .product-price {
        font-size: 1.3rem;
        font-weight: 600;
        color: #27ae60;
    }

    .product-description {
        color: #555;
        line-height: 1.8;
        font-size: 1rem;
    }

    .btn-custom {
        border-radius: 30px;
        padding: 10px 25px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:FormView ID="FormView1" runat="server">
             <ItemTemplate>
        <div class="container mt-5 mb-5">
    <div class="card detail-card">
        <div class="row g-0">
            <!-- ပုံဘက် -->
            <div class="col-md-5">
          
                <asp:Image ID="Image2" runat="server" CssClass="img-fluid detail-img"
                    ImageUrl='<%# ResolveUrl("~/images/") + Eval("Photo") %>' />
      
            </div>
            <!-- စာအချက်အလက်ဘက် -->
            <div class="col-md-7">
                <div class="card-body detail-body p-5">
                    <h2 class="product-title mb-3">
                          <%# Eval("MealName") %>
                    </h2>
                    <p class="product-price mb-4">
                       ပါဝင်ပစ္စည်း <%# Eval("Ingredient") %>
                    </p>
                    <p class="product-description mb-4">
                    ဟင်းချက်နည်းအဆင့်ဆင့် 
                          <!-- Bullet List -->
                               
                  <%# Eval("Description") %>


             
                    </p>
                    <a href="Meal.aspx" class="btn btn-outline-primary btn-custom">
                        ⬅ Back to List
                    </a>
              <%--      <a href="#" class="btn btn-primary btn-custom ms-2">
                        🛒 Add to Cart
                    </a>--%>
                </div>
            </div>
        </div>
    </div>
</div>
  
    </ItemTemplate>
  </asp:FormView>

    </asp:Content>
