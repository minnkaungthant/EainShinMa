<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="WrongMixFoodUser.aspx.cs" Inherits="EainShinMaWebsite.WrongMixFoodUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
                    <div class="d-flex flex-wrap align-items-center justify-content-between gap-2 mb-3">
                        <h5 class="m-0">တွဲဖက်မစားသင့်သောအစားအစာများ</h5>
                        <div class="d-flex gap-2">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name..."></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                            <asp:Button ID="btnClear" runat="server" CssClass="btn btn-outline-secondary" Text="Clear" OnClick="btnClear_Click" />
                        </div>
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvFoods" runat="server"
                            AutoGenerateColumns="False"
                            CssClass="table table-hover align-middle"
                            HeaderStyle-CssClass="table-light"
                            AllowPaging="true" PageSize="8"
                            OnPageIndexChanging="gvFoods_PageIndexChanging">
                            <Columns>

                       
                                <asp:TemplateField HeaderText="အစားအစာ(၁)">
                                    <ItemTemplate>
                                        <img class="food-img"
                                             src='<%# ResolveUrl("~/images/") + Eval("Photo1") %>' alt="Photo1" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                 <asp:BoundField DataField="Photo1Name"/>

                 
                                <asp:TemplateField HeaderText="အစားအစာ(၂)">
                                    <ItemTemplate>
                                        <img class="food-img"
                                             src='<%# ResolveUrl("~/images/") + Eval("Photo2") %>' alt="Photo2" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Photo2Name"/>

                      
                                <asp:TemplateField HeaderText="ဖြစ်တတ်သောရောဂါ">
                                    <ItemTemplate>
                                        <img class="food-img"
                                             src='<%# ResolveUrl("~/images/") + Eval("Photo3") %>' alt="Photo3" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Photo3Name"/>

                     
                               

                            </Columns>
                            <PagerSettings Mode="NumericFirstLast" FirstPageText="« First" LastPageText="Last »" />
                            <PagerStyle CssClass="pagination justify-content-end" />
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


<%--    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>

</asp:Content>
