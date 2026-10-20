<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ShowAdminHealthyFood.aspx.cs" Inherits="EainShinMaWebsite.ShowAdminHealthyFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <%--<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <div class="card" style="width:22rem; display:inline-block; margin:10px; box-shadow:0 4px 8px rgba(0,0,0,0.2); border-radius:12px;">
      
            <img src='<%# "images/" + Eval("Photo") %>' class="card-img-top" style="height:180px; object-fit:cover; border-radius:12px 12px 0 0;" />
            <div class="card-body">
                <h5 class="card-title"><%# Eval("FoodName") %></h5>
                <p><b>Body Part:</b> <%# Eval("BodyPart") %></p>
                <img src='<%# "images/" + Eval("BodyPartPhoto") %>'  style="width:80px; height:80px; border-radius:50%; margin:5px;" />
                <p class="card-text"><%# Eval("Description") %></p>

                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success"
                    CommandArgument='<%# Eval("FoodID") %>' OnClick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger"
                    CommandArgument='<%# Eval("FoodID") %>' OnClick="btnDelete_Click" />
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>--%>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    DataKeyNames="FoodID" 
    CssClass="table table-bordered">
    <Columns>
                         <asp:TemplateField HeaderText="နံပါတ်">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
        </asp:TemplateField>

<%--        <asp:BoundField DataField="FoodID" HeaderText="နံပါတ်" ReadOnly="True" />--%>
        <asp:BoundField DataField="FoodName" HeaderText="အစားအစာအမည်" />

        <asp:TemplateField HeaderText="ပုံ">
                                    <ItemTemplate>
                                        <img class="food-img"  style="width:50px;height:50px;"
                                             src='<%# ResolveUrl("~/images/") + Eval("Photo") %>' alt="Photo2" />
                                    </ItemTemplate>
                                </asp:TemplateField>


        <asp:BoundField DataField="BodyPart" HeaderText="ခန္ဓာကိုယ်အစိတ်အပိုင်း" />
         <asp:TemplateField HeaderText="ပုံ">
                                    <ItemTemplate>
                                        <img class="food-img"  style="width:50px;height:50px;"
                                             src='<%# ResolveUrl("~/images/") +Eval("BodyPartPhoto") %>' alt="Photo2" />
                                    </ItemTemplate>
                                </asp:TemplateField>

        <asp:BoundField DataField="Description" HeaderText="ဖော်ပြချက်" />
        
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success"
                    CommandArgument='<%# Eval("FoodID") %>' OnClick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger"
                    CommandArgument='<%# Eval("FoodID") %>' OnClick="btnDelete_Click" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
