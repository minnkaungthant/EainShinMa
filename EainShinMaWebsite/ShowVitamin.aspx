<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ShowVitamin.aspx.cs" Inherits="EainShinMaWebsite.ShowVitamin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* GridView buttons အတွက် CSS */
.grid-btn {
    background-color: #dc3545 !important; /* Bootstrap red */
    color: white !important;
    border: none;
    padding: 5px 10px;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
}

.grid-btn:hover {
    background-color: #c82333 !important; /* darker red */
}



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"
    AutoGenerateColumns="false" GridLines="None"
    OnRowEditing="GridView1_RowEditing"
    OnRowCancelingEdit="GridView1_RowCancelingEdit"
    OnRowUpdating="GridView1_RowUpdating"
    OnRowDeleting="GridView1_RowDeleting"
    DataKeyNames="VitaminID">

    <Columns>
        <asp:TemplateField HeaderText="နံပါတ်">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="VitaminID" HeaderText="ID" Visible="false" />
        <asp:BoundField DataField="VitaminName" HeaderText="Vitamin အမည်" ReadOnly="true" />

        <asp:TemplateField HeaderText="အဓိကရရှိနိုင်သော အစားအစာ">
            <ItemTemplate>
                <%# Eval("FoodSources") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtFoodSources" runat="server" Text='<%# Bind("FoodSources") %>' CssClass="form-control" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="သန်မာစေသော ခန္ဓာကိုယ်အစိတ်အပိုင်း">
            <ItemTemplate>
                <%# Eval("Strengthens") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtStrengthens" runat="server" Text='<%# Bind("Strengthens") %>' CssClass="form-control" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="ဗီတာမင်ချို့မှုကြောင့်ဖြစ်ပွားနိုင်သော ရောဂါ">
            <ItemTemplate>
                <%# Eval("Prevents") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtPrevents" runat="server" Text='<%# Bind("Prevents") %>' CssClass="form-control" />
            </EditItemTemplate>
        </asp:TemplateField>

    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Operations"
    ButtonType="Button"
    EditText="Edit" UpdateText="Update" CancelText="Cancel" DeleteText="Delete" ControlStyle-CssClass="grid-btn" />

    </Columns>
</asp:GridView>

</asp:Content>
