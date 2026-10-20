<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="WrongMixFoods.aspx.cs" Inherits="EainShinMaWebsite.WrongMixFoods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
         <style type="text/css">
             .mt-2 {}
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container d-flex justify-content-center  vh-70 mt-4">
            <div class="card shadow-lg p-4 rounded-4" style="max-width: 800px; width: 100%;">
                <h3 class="text-center mb-2 text-danger"> တွဲဖက်မစားသင့်သောအစားအစာများ</h3>

    <div class="container mt-1">
  <div class="row">   

    <div class="col-md-12 col-sm-12 justify-content-center ms-5">
        <div >
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="InsertGroup"  ControlToValidate="FileUpload1" ErrorMessage="ဖော်ပြလိုသောအစားအစာပုံ(၁)ကိုဖြည့်ပါ။" Font-Names="Pyidaungsu" Font-Size="Small" ForeColor="#CC3300"></asp:RequiredFieldValidator>
          <asp:FileUpload ID="FileUpload1" runat="server" Width="600px" CssClass="form-control" placeholder="   အစားအစာ(၁) "/>             



  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="InsertGroup"     ControlToValidate="txtPhoto1" ErrorMessage="အစားအစာပုံ(၁)အမည်ကိုဖြည့်ပါ။" Font-Names="Pyidaungsu" Font-Size="Small" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                 <asp:TextBox ID="txtPhoto1" runat="server" Height="30px"  Width="598px" CssClass="form-control mt-2" placeholder="အစားအစာပုံ(၁)အမည်ကိုဖြည့်ပါ"></asp:TextBox>    
      
            
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ValidationGroup="InsertGroup" ControlToValidate="FileUpload2" ErrorMessage="ဖော်ပြလိုသောအစားအစာပုံ(၂)ကိုဖြည့်ပါ။" Font-Names="Pyidaungsu" Font-Size="Small" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            <asp:FileUpload ID="FileUpload2" runat="server" Width="600px" CssClass="form-control" />
       
            
            
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="InsertGroup" ControlToValidate="txtPhoto2" ErrorMessage="အစားအစာပုံ(၂)အမည်ကိုဖြည့်ပါ။" Font-Names="Pyidaungsu" Font-Size="Small" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                 <asp:TextBox ID="txtPhoto2" runat="server" Height="30px"  Width="598px" CssClass="form-control mt-2" placeholder="အစားအစာပုံ(၂)အမည်ကိုဖြည့်ပါ"></asp:TextBox>         
      
            
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="InsertGroup" ControlToValidate="FileUpload3" ErrorMessage="ဖြစ်တတ်သောရောဂါကိုပြရန်ပုံထည့်ပါ။" Font-Names="Pyidaungsu" Font-Size="Small" ForeColor="#CC3300"></asp:RequiredFieldValidator>
          <asp:FileUpload ID="FileUpload3" runat="server" Width="600px" CssClass="form-control mt-2" placeholder="ဖြစ်တတ်သောရောဂါ" />            
        
            
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="InsertGroup" ControlToValidate="txtPhoto3" ErrorMessage="ဖော်ပြလိုသောရောဂါအမည်ကိုဖြည့်ပါ။" Font-Names="Pyidaungsu" Font-Size="Small" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                 <asp:TextBox ID="txtPhoto3" runat="server" Height="30px" Width="598px" CssClass="form-control mt-2" placeholder="ဖြစ်တတ်သောရောဂါ"></asp:TextBox>
            
        </div>

          <!-- Submit -->

                <div class="mt-3">     
                     
                    <asp:Button ID="btnSubmit" runat="server" Text="ထည့်ရန်" CssClass="btn btn-danger" OnClick="btnSubmit_Click1" ValidationGroup="InsertGroup"/>
                    <asp:Button ID="btnShow" runat="server" Text="ကြည့်ရန်" CssClass="btn btn-danger" PostBackUrl="~/ShowWrongFood.aspx" CausesValidation="false"/>

                    <%--   <asp:Button ID="btnShow" runat="server" Text="ကြည့်ရန်" CssClass="btn btn-danger" OnClick="btnShow_Click" CausesValidation="false"/>--%>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
                       <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/SelectWrongMixFood.aspx">Back</asp:LinkButton>
      
                    </div>

      </div>

            
  </div>
</div>
         
                </div>
        </div>


      <!-- Bootstrap JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
         <%--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" rel="stylesheet" />--%>
    

</asp:Content>
