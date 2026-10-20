<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminVitaminDetail.aspx.cs" Inherits="EainShinMaWebsite.AdminVitaminDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .gallery-card {
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            overflow: hidden;
            text-align: center;
        }
        .gallery-img {
            width: 100%;
            height: 140px;
            object-fit: cover;
        }
        .food-name {
            padding: 6px;
            font-weight: bold;
            color: #d6336c;
        }
        .mt-2 {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container my-4">
        <h3 class="mb-4 text-danger">Add Vitamin Gallery</h3>

        <!-- Vitamin Name -->
        <div class="mb-3">
        
          <asp:DropDownList ID="ddlVitaminName" runat="server" CssClass="form-control mt-2" Height="44px" Width="810px"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="ddlVitaminName" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="Vitamin အမည်ထဲ့ပါ။"></asp:RequiredFieldValidator>
                 </div>

        <!-- Add / Update Food -->
        <div class="row g-2 mb-3">
            <div class="col-md-5">
                <asp:TextBox ID="txtFoodName" runat="server" CssClass="form-control" Placeholder="အစားအစာအမည်" />
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFoodName" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="အစားအစာအမည်ထဲ့ပါ။"></asp:RequiredFieldValidator>
                   </div>
            <div class="col-md-5">
                <asp:FileUpload ID="fuFoodImage" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-2">
                   <asp:Button ID="btnSave" runat="server" Text="ထည့်ရန်"  CssClass="btn btn-success  shadow-sm" OnClick="btnSave_Click"  ValidationGroup="InsertGroup" />
                 
            </div>
        </div>

        <!-- Foods Gallery Preview -->
        <div class="row row-cols-1 row-cols-md-3 g-4 mb-3">
            <asp:Repeater ID="rptFoods" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card gallery-card">
                            <img src='<%# Eval("FoodImage") %>' class="gallery-img" />
                            <div class="food-name"><%# Eval("FoodName") %></div>
                            <div class="d-flex">
                   
                        </div>
                    </div>
                    
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Save Vitamin -->
  
    </div>
</asp:Content>
