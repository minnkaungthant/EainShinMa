<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SelectWrongMixFood.aspx.cs" Inherits="EainShinMaWebsite.SelectWrongMixFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />


<style>
        .card {
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0,0,0,.07);
        }
        .table thead th {
            white-space: nowrap;
        }
        .food-img {
            width: 72px; height: 72px; object-fit: cover;
            border-radius: .75rem;
        }
        .pill {
            display:inline-block; padding:.25rem .5rem; border-radius:999px; 
            background:#f1f5f9; font-size:.85rem;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container py-4">
    <div class="card">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h5>တွဲဖက်မစားသင့်သောအစားအစာများ</h5>
                <div class="d-flex gap-2">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name..."></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClear" runat="server" CssClass="btn btn-outline-secondary" Text="Clear" OnClick="btnClear_Click" />
                </div>
            </div>

            <div class="table-responsive">
    

                               <asp:GridView ID="gvFoods" runat="server" CssClass="table table-striped table-bordered"
    AutoGenerateColumns="false" GridLines="None"
       OnRowDeleting="gvFoods_RowDeleting" 
                                   OnRowEditing="gvFoods_RowEditing"
OnRowUpdating="gvFoods_RowUpdating"
OnRowCancelingEdit="gvFoods_RowCancelingEdit"


    DataKeyNames="WID">

                    <Columns>
                        <asp:TemplateField HeaderText="နံပါတ်">
                            <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        </asp:TemplateField>

     <asp:TemplateField HeaderText="အစားအစာ(၁)">
    <ItemTemplate>
        <img class="food-img" src='<%# ResolveUrl("~/images/") + Eval("Photo1") %>' />
        <div class="pill"><%# Eval("Photo1Name") %></div>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:FileUpload ID="fuEditPhoto1" runat="server" CssClass="form-control" />
        <asp:TextBox ID="txtPhoto1Edit" runat="server" 
                     Text='<%# Bind("Photo1Name") %>' CssClass="form-control mt-1" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="အစားအစာ(၂)">
    <ItemTemplate>
        <img class="food-img" src='<%# ResolveUrl("~/images/") + Eval("Photo2") %>' />
        <div class="pill"><%# Eval("Photo2Name") %></div>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:FileUpload ID="fuEditPhoto2" runat="server" CssClass="form-control" />
        <asp:TextBox ID="txtPhoto2Edit" runat="server" 
                     Text='<%# Bind("Photo2Name") %>' CssClass="form-control mt-1" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="ဖြစ်တတ်သောရောဂါ">
    <ItemTemplate>
        <img class="food-img" src='<%# ResolveUrl("~/images/") + Eval("Photo3") %>' />
        <div class="pill"><%# Eval("Photo3Name") %></div>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:FileUpload ID="fuEditPhoto3" runat="server" CssClass="form-control" />
        <asp:TextBox ID="txtPhoto3Edit" runat="server" 
                     Text='<%# Bind("Photo3Name") %>' CssClass="form-control mt-1" />
    </EditItemTemplate>
</asp:TemplateField>


                          <asp:CommandField  ShowDeleteButton="True" HeaderText="Operations"  ShowEditButton="True"/>

        <%--                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Operations" />--%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
