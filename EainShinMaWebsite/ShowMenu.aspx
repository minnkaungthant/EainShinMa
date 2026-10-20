<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ShowMenu.aspx.cs" Inherits="EainShinMaWebsite.ShowMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

     <style type="text/css">
         .mt-2 {}


         .gridview td, .gridview th {
    padding: 2px;
    text-align: left;
    vertical-align: top;
    word-wrap: break-word;
    flex-align:center;

}
         .gridview th {
              position: sticky;
    top: 0;
    /*background: #f8f9fa;*/
    z-index: 10;
    padding: 5px;
    border-bottom: 1px solid #dee2e6;
         }
         .layout {
    display: flex;
    min-height: 100vh;
}

/* Sidebar */
.sidebar {
    width: 220px;
    background: #343a40;
    color: white;
    padding: 15px;
}

/* Main Content beside sidebar */
.main-content {
/*margin-top: 10px;*/     
  /* push GridView below sidebar */
    /*padding: 20px;
    background: #f8f9fa; 
  max-height: 90vh;*/

   width: 100%;
  height: 600px; /* example */
  
  scrollbar-width: thin;           /* Firefox */
  scrollbar-color: #888 #f1f1f1;

    /*overflow-x: auto;*/   

}

/*column ထဲမှာစာရှည်သွားလို့*/
.desc-scroll {
    max-height: 100px;        /* cell height */
    overflow-y: auto;         /* vertical scroll only */
    padding: 5px;
    border: 1px solid #dee2e6;
    background: #fff;

    /* scrollbar subtle / thin */
    scrollbar-width: thin;           /* Firefox */
    scrollbar-color: #aaa #f8f9fa;  /* thumb color / track color */
}

/* Webkit browsers (Chrome, Edge, Safari) */
.desc-scroll::-webkit-scrollbar {
    width: 1px;                     /* thin scrollbar */
}

.desc-scroll::-webkit-scrollbar-track {
    background: #f8f9fa;            /* track color */

}


     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="main-content">
    <div class="container">
<%--        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card shadow-lg p-4 rounded-4" style="max-width: 1500px; width: 100%;">--%>
                <h5 class="text-center mb-2 text-primary">   ဟင်းချက်နည်းများကြည့်ရန်</h5>           

                <div class="mb-3">                    
<div id="gridWrapper" style="height:600px; overflow:auto;">

                   <asp:GridView ID="GridView1" CssClass="table table-striped table-hover"     runat="server" AutoGenerateColumns="False" DataKeyNames="MealID" OnRowEditing="GridView1_RowEditing"
    OnRowCancelingEdit="GridView1_RowCancelingEdit"
    OnRowUpdating="GridView1_RowUpdating"  OnRowDeleting="GridView1_RowDeleting">
                  
                        <Columns>
                                    <asp:TemplateField HeaderText="နံပါတ်">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
        </asp:TemplateField>


 <asp:TemplateField HeaderText="ဟင်းအမည်">
            <ItemTemplate>
                <%# Eval("MealName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtMealName" runat="server" Text='<%# Eval("MealName") %>' width="100px"/>
            </EditItemTemplate>
        </asp:TemplateField>

  <asp:TemplateField HeaderText="Photo">
            <ItemTemplate>

                <asp:Image ID="imgPhoto" runat="server"  ImageUrl='<%# "~/images/" + Eval("Photo") %>' Width="110px" Height="80px" />
           
            </ItemTemplate>
            <EditItemTemplate>
                <asp:FileUpload ID="fuPhoto" runat="server" ImageUrl='<%#"~/images/" + Eval("Photo") %>'  Width="110px"/>
            </EditItemTemplate>
        </asp:TemplateField>


         
        <asp:TemplateField HeaderText="ပါဝင်ပစ္စည်း">
            <ItemTemplate>
                    <div class="desc-scroll">
                <%# Eval("Ingredient") %>
                                </div>

            </ItemTemplate>
            <EditItemTemplate>
                  <div class="desc-scroll">
                <asp:TextBox ID="txtIngredient" runat="server" Text='<%# Eval("Ingredient") %>' />
                      </div>
            </EditItemTemplate>
        </asp:TemplateField>


      <asp:TemplateField HeaderText="ဟင်းချက်နည်းအဆင့်ဆင့်">
       
            <ItemTemplate>
                        <div class="desc-scroll">
                <%# Eval("Description") %>
                            </div>
            </ItemTemplate>
            <EditItemTemplate>
              
                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Eval("Description") %>' />
                       </div>
            </EditItemTemplate>
        </asp:TemplateField>



           
    <asp:CommandField ShowEditButton="True" HeaderText="Operations" ButtonType="Button">
                        <ControlStyle BackColor="#33CC33" ForeColor="White" CssClass="btn btn-success shadow-sm editButtonClass" Width="70px"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="Operations" ButtonType="Button">
                        <ControlStyle BackColor="Red" ForeColor="White" CssClass="btn btn-danger shadow-sm"></ControlStyle>
                    </asp:CommandField>
      <%--  <asp:CommandField ShowEditButton="true" ButtonType="Button" />
        <asp:CommandField ButtonType="Button"   ShowDeleteButton="true" />--%>
    </Columns>
</asp:GridView>
                    </div>
        </div>
         </div>
             </div>




    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // GridView ထဲမှာ Edit button နဲ့ click event bind လုပ်ခြင်း
        $("#<%= GridView1.ClientID %> .editButtonClass").click(function () {
            // scroll ကို GridView wrapper ထဲ scrollTop = scrollHeight
            var wrapper = $("#gridWrapper");
            wrapper.animate({ scrollTop: wrapper[0].scrollHeight }, 500); // 0.5 second smooth scroll
        });
    });
</script>
</asp:Content>
