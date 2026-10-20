<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MenuCategory.aspx.cs" Inherits="EainShinMaWebsite.MenuCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
     
    <style>
        /*For Dropdown list*/
        h1 {
            color: green;
        }

     
        .auto-style3 {
            width: 173px;
            height: 110px;
        }
        
    </style>
        <table style="width: 70%; margin-left:50px; height: 100px;">
             <tr style="height: 50px;">
            <td style="height: 31px; width: 60px">
              <asp:Label ID="Label1" runat="server" Text="ဟင်းပွဲများ" ></asp:Label>
            </td>
                 </tr>
        <tr style="height: 50px;">
            <td style="height: 31px;">
              <asp:Label ID="lblCategory" runat="server" Text="အမျိုးအစားများ" ></asp:Label>
            </td>
            <td style="height: 31px">       <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control"></asp:TextBox></td>
        
        </tr>    
       
        <tr>
            <td class="auto-style3">
             <asp:Button ID="Button1" runat="server" Text="ထည့်ရန်"  OnClick="btnSave_Click"  CssClass="btn btn-primary"/>
            </td>  
           <td class="auto-style3">
             <asp:Button ID="btnUpdate" runat="server" Text="ပြင်ရန်"  OnClick="btnUpdate_Click"  CssClass="btn btn-primary"/>
            </td>  
                    <td class="auto-style3">
                        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="ဖျက်ရန်" CssClass="btn btn-primary" />
            </td>  
        </tr>      
          <tr>
                    <asp:GridView ID="GridView1" runat="server" Width="384px" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated" CssClass="table table-striped table-hover">
                        <Columns>
                            <asp:BoundField DataField="CategoryID" HeaderText="နံပါတ်" ReadOnly="True" />
                            <asp:BoundField DataField="CategoryName" HeaderText="အမျိုးအစားများ" />
                         <%--   <asp:CommandField ButtonType="Button" ShowEditButton="True" />--%>
                        </Columns>
                    </asp:GridView>
              
            </tr> 


    </table>
      <!-- Bootstrap JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <%--   <asp:CommandField ButtonType="Button" ShowEditButton="True" />--%>

</asp:Content>


