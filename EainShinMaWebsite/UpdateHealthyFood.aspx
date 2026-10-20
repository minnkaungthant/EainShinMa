<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateHealthyFood.aspx.cs" Inherits="EainShinMaWebsite.UpdateHealthyFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      <style>
        .update-card {
            max-width: 600px;
            margin: 50px auto;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            border-radius: 15px;
            background-color: #f5fff5;
        }
        .preview-img {
            max-width: 150px;
            max-height: 150px;
            border-radius: 12px;
            margin-bottom: 15px;
            object-fit: cover;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%--    <asp:TextBox ID="txtFoodName" runat="server" CssClass="form-control"></asp:TextBox>
<asp:TextBox ID="txtBodyPart" runat="server" CssClass="form-control"></asp:TextBox>
<asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
<asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="btnSave_Click" />--%>


    <div class="update-card">
            <h3 class="text-center text-danger mb-4">ကျန်းမာစေသောအစားအစာများပြင်ရန်</h3>

            <asp:Label ID="lblFoodID" runat="server" Text="" Visible="false"></asp:Label>

            <div class="mb-3">
                <asp:Label ID="lblFoodName" runat="server" Text="အစားအစာအမည်" class="text-center text-danger mb-4"></asp:Label>
                <asp:TextBox ID="txtFoodName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Label ID="lblBodyPart" runat="server" Text="ခန္ဓာကိုယ်အစိတ်အပိုင်း" class="text-center text-danger mb-4"></asp:Label>
                <asp:TextBox ID="txtBodyPart" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Label ID="lblDescription" runat="server" Text="ဖော်ပြချက်" class="text-center text-danger mb-4"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="4"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Label ID="lblPhoto" runat="server" Text="အစားအစာပုံ" class="text-center text-danger mb-4"></asp:Label><br />
                <asp:Image ID="imgPhoto" runat="server" CssClass="preview-img"/>
                <asp:FileUpload ID="fuPhoto" runat="server" CssClass="form-control mt-2" />
            </div>

            <div class="mb-3">
                <asp:Label ID="lblBodyPartPhoto" runat="server" Text="ခန္ဓာကိုယ်အစိတ်အပိုင်းပုံ" class="text-center text-danger mb-4"></asp:Label><br />

         
                <asp:Image ID="imgBodyPartPhoto" runat="server" CssClass="preview-img"/>
                <asp:FileUpload ID="fuBodyPartPhoto" runat="server" CssClass="form-control mt-2" />
            </div>

            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-danger w-100" OnClick="btnSave_Click" />
        </div>
</asp:Content>
