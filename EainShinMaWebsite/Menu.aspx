<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="EainShinMaWebsite.Menu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
     <style type="text/css">
         .mt-2 {}
     </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card shadow-lg p-4 rounded-4" style="max-width: 500px; width: 100%;">
                <h5 class="text-center mb-2 text-danger">   ဟင်းချက်နည်းများထည့်ရန်</h5>
              <%--     <div class="mb-3">  
                                <asp:DropDownList ID="ddlMenu" runat="server" Height="40px" Width="414px"  CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName">            
                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [CategoryName] FROM [MenuCategory]"></asp:SqlDataSource>
                </div>--%>


                <div class="mb-3">                 <asp:TextBox ID="txtMenuName" runat="server" Width="409px" CssClass="form-control" placeholder="ဟင်းအမည်"></asp:TextBox>       
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtMenuName" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ဟင်းအမည်ထည့်ပါ။"></asp:RequiredFieldValidator>
                </div>          
                <div>               <asp:FileUpload ID="FileUpload1" runat="server" Width="414px" CssClass="form-control" />               
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ပုံထည့်ပါ။"></asp:RequiredFieldValidator>
                </div>                 
       <div>          <asp:TextBox ID="txtIngredient" runat="server" Width="413px" Height="45px" CssClass="form-control mt-2" placeholder="ပါဝင်ပစ္စည်း"></asp:TextBox>  
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtIngredient" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ပါဝင်ပစ္စည်းထည့်ပါ။"></asp:RequiredFieldValidator>
       </div>                     
   <div>                  <asp:TextBox ID="txtDescription" runat="server" Height="115px" Width="411px" CssClass="form-control mt-3" placeholder="ချက်နည်းအဆင့်ဆင့်"></asp:TextBox>      
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescription" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ချက်နည်းအဆင့်ဆင့်ထည့်ပါ။"></asp:RequiredFieldValidator>
   </div>
 <div class="pt-2" style="text-align:center">
                        <asp:Button ID="btnSave" runat="server" Text="ထည့်ရန်"  CssClass="btn btn-danger  shadow-sm" OnClick="btnSave_Click"   ValidationGroup="InsertGroup"/>
                                  <asp:Button ID="Button1" runat="server" Text="ကြည့်ရန်"  CssClass="btn btn-danger  shadow-sm" OnClick="btnShow_Click" CausesValidation="false" />
        </div>
            </div>

      <!-- Bootstrap JS Bundle CDN -->
</asp:Content>
