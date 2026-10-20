<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHealthyFood.aspx.cs" Inherits="EainShinMaWebsite.AdminHealthyFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

      <style type="text/css">
          .m-2 {}
      </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
            <div class="card shadow p-4" style="max-width:600px; margin:auto; border-radius:15px;">
                <h3 class="mb-4 text-center text-danger">ကျန်းမာစေသောအစားအစာများ</h3>

                <!-- Food Name -->
                <div class="mb-3">
                    <label for="txtFoodName" class="form-label">အစားအစာအမည်</label>
                    <asp:TextBox ID="txtFoodName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <!-- Food Photo -->
                <div class="mb-3">
                    <label for="fuPhoto" class="form-label">အစားအစာဓါတ်ပုံ</label>
                    <asp:FileUpload ID="fuPhoto" runat="server" CssClass="form-control" />
                      <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="fuPhoto" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="အစားအစာဓါတ်ပုံထည့်ပါ။"></asp:RequiredFieldValidator>
                </div>

                <!-- Body Part -->
                <div class="mb-3">
                    <label for="txtBodyPart" class="form-label">ခန္ဓာကိုယ်အစိတ်အပိုင်း</label>
                    <asp:TextBox ID="txtBodyPart" runat="server" CssClass="form-control"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBodyPart" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ခန္ဓာကိုယ်အစိတ်အပိုင်းအမည်ထည့်ပါ။"></asp:RequiredFieldValidator>
                       </div>

                <!-- Body Part Photo -->
                <div class="mb-3">
                    <label for="fuBodyPartPhoto" class="form-label">ခန္ဓာကိုယ်အစိတ်အပိုင်းပုံ</label>
                    <asp:FileUpload ID="fuBodyPartPhoto" runat="server" CssClass="form-control" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fuBodyPartPhoto" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ခန္ဓာကိုယ်အစိတ်အပိုင်းပုံထည့်ပါ"></asp:RequiredFieldValidator>
                </div>

                <!-- Description -->
                <div class="mb-3">
                    <label for="txtDescription" class="form-label">အကြောင်းအရာ</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescription" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="အကြောင်းအရာထည့်ပါ။"></asp:RequiredFieldValidator>
                
                </div>

                <!-- Save Button -->
                <asp:Button ID="btnSave" runat="server" Text="သိမ်းရန်" CssClass="btn btn-danger w-100 m-2" OnClick="btnSave_Click1" ValidationGroup="InsertGroup" Width="70px" />
                        <asp:Button ID="btnShow" runat="server" Text="ကြည့်ရန်" CssClass="btn btn-outline-danger w-100 m-2" OnClick="btnShow_Click" CausesValidation="false"  Width="70px" />
           


                <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-3 d-block text-center" CausesValidation="false"></asp:Label>
            </div>
        </div>


</asp:Content>
