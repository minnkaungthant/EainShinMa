<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateMenu.aspx.cs" Inherits="EainShinMaWebsite.UpdateMenu" %>
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
              <asp:Label ID="Label2" runat="server" Text="Category ID" ></asp:Label>
            </td>
            <td style="height: 31px">       <asp:TextBox ID="txtCategoryID" runat="server" CssClass="form-control" OnTextChanged="txtCategoryID_TextChanged"></asp:TextBox></td>
               <td style="height: 31px">     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCategoryID" ErrorMessage="Category ID is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>    
        </tr>    
        <tr style="height: 50px;">
            <td style="height: 31px;">
              <asp:Label ID="lblCategory" runat="server" Text="အမျိုးအစားများ" ></asp:Label>
            </td>
            <td style="height: 31px">       <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control"></asp:TextBox></td>
               <td style="height: 31px">     &nbsp;</td>    
        </tr>    
       
        <tr>
          
           <td class="auto-style3">
               <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" CssClass="btn btn-danger" />
            </td>  
        </tr>      
          <tr>
                    <asp:GridView ID="GridView1" runat="server" Width="384px" AutoGenerateColumns="False">
          <Columns>
                            <asp:BoundField DataField="CategoryID" HeaderText="Category ID" ReadOnly="True" />
                            <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                        </Columns>
                    </asp:GridView>
              
            </tr> 


    </table>
      <!-- Bootstrap JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


</asp:Content>
