<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UnhealthyFood.aspx.cs" Inherits="EainShinMaWebsite.UnhealthyFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<%--    <style>
.food-img {
    width: 70px;
    height: 70px;
    border-radius: 8px;
    object-fit: cover;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    transition: transform 0.3s;
}
.food-img:hover {
    transform: scale(1.1);
}
</style>--%>
    <style>
.food-img {
    width: 70px;
    height: 70px;
    border-radius: 8px;
    object-fit: cover;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    transition: transform 0.3s;
}
.food-img:hover {
    transform: scale(1.1);
}

/* Prevent GridView row height from changing */
table.table td {
    vertical-align: middle;
    max-height: 80px;
    overflow: hidden;
}
</style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <h3 class="mb-4 text-center text-danger ms-5 mt-4"><b>ဆိုးကျိုးဖြစ်စေသောအစားအစာများ</b></h3>



        <!-- Add New -->
        <div class="card shadow-sm p-3 mb-4">
            <div class="mb-2">
                <asp:Label ID="Label1" runat="server" Text="အစားအစာအမည်"></asp:Label>
                <asp:TextBox ID="txtFoodName" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtFoodName" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="အစားအစာအမည်ထည့်ပါ။"></asp:RequiredFieldValidator>
            </div>
              <div class="mb-2">
                <asp:Label ID="Label4" runat="server" Text="ဓာတ်ပုံ"></asp:Label><br />
                <asp:FileUpload ID="fuPhoto" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fuPhoto" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ဓာတ်ပုံထည့်ပါ။"></asp:RequiredFieldValidator>
            </div>


            <div class="mb-2">
                <asp:Label ID="Label2" runat="server" Text="ရောဂါ"></asp:Label>
                <asp:TextBox ID="txtDisease" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDisease" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ရောဂါအမည်ထည့်ပါ။"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-2">
                <asp:Label ID="Label3" runat="server" Text="ဖော်ပြချက်"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" CssClass="text-danger"    ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ဖော်ပြချက်ထည့်ပါ။"></asp:RequiredFieldValidator>
            </div>
          
            <asp:Button ID="btnSave" runat="server" Text="ထည့်ရန်" CssClass="btn btn-outline-danger mt-2 mb-3" OnClick="btnSave_Click" ValidationGroup="InsertGroup"/>
              <asp:Button ID="Button1" runat="server" Text="ကြည့်ရန်"  CssClass="btn btn-outline-danger  shadow-sm" OnClick="btnShow_Click" CausesValidation="false" />

        </div>
      <!-- List -->
      <%--  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-hover"
            DataKeyNames="FoodID" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
            OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="FoodID" HeaderText="နံပါတ်" ReadOnly="True" />
                <asp:BoundField DataField="FoodName" HeaderText="အစားအစာ" />

   

             <asp:TemplateField HeaderText="ပုံ">
    <ItemTemplate>
        <img style="width:70px;height:50px;" src='<%# ResolveUrl("~/images/") + Eval("Photo") %>' />
    </ItemTemplate>
    <EditItemTemplate>
        <asp:FileUpload ID="fuEditPhoto" runat="server" />
        <br />
        <img style="width:70px;height:50px;" src='<%# ResolveUrl("~/images/") + Eval("Photo") %>' />
    </EditItemTemplate>
</asp:TemplateField>



                <asp:BoundField DataField="Disease" HeaderText="ရောဂါ" />
                <asp:BoundField DataField="Description" HeaderText="ဖော်ပြချက်" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
             </asp:GridView>--%>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    CssClass="table table-bordered table-striped table-hover"
    DataKeyNames="FoodID"
    OnRowEditing="GridView1_RowEditing"
    OnRowUpdating="GridView1_RowUpdating"
    OnRowCancelingEdit="GridView1_RowCancelingEdit"
    OnRowDeleting="GridView1_RowDeleting"
    Width="100%" 
    GridLines="None">
    
    <Columns>
<%--        <asp:BoundField DataField="FoodID" HeaderText="နံပါတ်" ReadOnly="True" ItemStyle-Width="50px" />--%>
                         <asp:TemplateField HeaderText="နံပါတ်">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
        </asp:TemplateField>
        
<%--        <asp:TemplateField HeaderText="အစားအစာ" ItemStyle-Width="150px">
            <ItemTemplate>
                <%# Eval("FoodName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtFoodNameEdit" runat="server" Text='<%# Bind("FoodName") %>' CssClass="form-control" Width="140px" />
            </EditItemTemplate>
        </asp:TemplateField>--%>

        <asp:TemplateField HeaderText="အစားအစာ">
    <ItemTemplate>
        <%# Eval("FoodName") %>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtFoodNameEdit" runat="server" Text='<%# Bind("FoodName") %>' CssClass="form-control" />
    </EditItemTemplate>
</asp:TemplateField>




        <asp:TemplateField HeaderText="ပုံ" ItemStyle-Width="80px">
            <ItemTemplate>
                <img class="food-img" src='<%# ResolveUrl("~/images/") + Eval("Photo") %>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:FileUpload ID="fuEditPhoto" runat="server" CssClass="form-control" />
                <br />
                <img class="food-img" src='<%# ResolveUrl("~/images/") + Eval("Photo") %>' />
            </EditItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="ရောဂါ" ItemStyle-Width="150px">
            <ItemTemplate>
                <%# Eval("Disease") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDiseaseEdit" runat="server" Text='<%# Bind("Disease") %>' CssClass="form-control" Width="140px" />
            </EditItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="ဖော်ပြချက်" ItemStyle-Width="250px">
            <ItemTemplate>
                <%# Eval("Description") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDescriptionEdit" runat="server" Text='<%# Bind("Description") %>' CssClass="form-control" TextMode="MultiLine" Rows="2" Width="240px" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>






</asp:Content>
