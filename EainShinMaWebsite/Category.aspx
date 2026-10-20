<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="EainShinMaWebsite.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card shadow-lg p-4 rounded-4" style="max-width: 700px; width: 100%;">
                <h3 class="text-center mb-5 text-primary">   အမျိုးအစားများထည့်ရန်</h3>

                <!-- Email -->
                <div class="mb-3">

                    <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="အမျိုးအစားများ"></asp:TextBox>
                 
                   
                </div>

       
                <!-- Submit -->
                <div>
               
                        <asp:Button ID="btnSubmit" runat="server" Text="ထည့်ရန်"  CssClass="btn btn-primary  shadow-sm" OnClick="btnSubmit_Click" />
      
                    </div>
                       <div style="margin-top:5px;">
            <asp:GridView ID="GridView1" CssClass="table table-striped table-hover"  runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryID" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
            

        <asp:TemplateField HeaderText="နပါတ်">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="CategoryName" HeaderText="အမျိုးအစားများ" />
                                   <asp:CommandField ShowEditButton="True" HeaderText="Operations" ButtonType="Button">
                        <ControlStyle BackColor="#33CC33" ForeColor="White" CssClass="btn btn-success shadow-sm" Width="70px"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="Operations" ButtonType="Button">
                        <ControlStyle BackColor="Red" ForeColor="White" CssClass="btn btn-danger shadow-sm"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
                </div>
            
                </div>

 
        </div>


      <!-- Bootstrap JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
         <%--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" rel="stylesheet" />--%>
</asp:Content>
