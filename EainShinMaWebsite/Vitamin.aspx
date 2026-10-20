<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Vitamin.aspx.cs" Inherits="EainShinMaWebsite.Vitamin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <style>
        .form-card {
            max-width: 600px;
            margin: 30px auto;
            background: #fff5f5;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(211,47,47,0.15);
        }

        .form-card h3 {
            color: #b71c1c;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #f5c2c7;
            border-radius: 8px;
        }

        .btn-submit {
            background: #d32f2f;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s ease;
        }

        .btn-submit:hover {
            background: #b71c1c;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="form-card">
           <h3>Add New Vitamin</h3>

          <div>
        <asp:Label ID="lblVitaminName" runat="server" Text="Vitamin အမည်"></asp:Label>
<%--        <asp:TextBox ID="txtVitaminName" runat="server" CssClass="form-control"></asp:TextBox>--%>
          <asp:DropDownList ID="ddlVitaminName" runat="server"  CssClass="form-control">
              <asp:ListItem>Vitamin A</asp:ListItem>
              <asp:ListItem>Vitamin D</asp:ListItem>
              <asp:ListItem>Vitamin E</asp:ListItem>
              <asp:ListItem>Vitamin K</asp:ListItem>
              <asp:ListItem>Vitamin B1</asp:ListItem>
              <asp:ListItem>Vitamin B2</asp:ListItem>
              <asp:ListItem>Vitamin B3</asp:ListItem>
              <asp:ListItem>Vitamin B5</asp:ListItem>
              <asp:ListItem>Vitamin B6</asp:ListItem>
              <asp:ListItem>Vitamin B7</asp:ListItem>
              <asp:ListItem>Vitamin B9</asp:ListItem>
              <asp:ListItem>Vitamin 12</asp:ListItem>
              <asp:ListItem>Vitamin C</asp:ListItem>
           </asp:DropDownList>

                 <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="ddlVitaminName" CssClass="text-danger" ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="Vitamin အမည်"></asp:RequiredFieldValidator>
       </div>
              
              <div>
           
        <asp:TextBox ID="txtLocalName" runat="server" CssClass="form-control" Placeholder="အခေါ်အဝေါ်"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLocalName" CssClass="red"  ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="အခေါ်အဝေါ်"></asp:RequiredFieldValidator>

                  </div>

          <div>
        <asp:TextBox ID="txtFoodSources" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="ရရှိနိုင်သော အစားအစာ"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFoodSources" CssClass="red" ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ရရှိနိုင်သော အစားအစာ"></asp:RequiredFieldValidator>
</div>
                    <div>
        <asp:TextBox ID="txtStrengthens" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="သန်မာစေသော အစိတ်အပိုင်း"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStrengthens" CssClass="red" ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="သန်မာစေသော အစိတ်အပိုင်း"></asp:RequiredFieldValidator>
</div>

                        <div>
        <asp:TextBox ID="txtPrevents" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="ဗီတာမင်ချို့တဲ့မှုကြောင့်ဖြစ်ပွားနိုင်သော ရောဂါ"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrevents" CssClass="red" ValidationGroup="InsertGroup" Display="Dynamic" ErrorMessage="ဗီတာမင်ချို့တဲ့မှုကြောင့်ဖြစ်ပွားနိုင်သော ရောဂါ"></asp:RequiredFieldValidator>
</div>

           <asp:Button ID="btnSave" runat="server" Text="Save Vitamin" CssClass="btn-submit" OnClick="btnSave_Click" ValidationGroup="InsertGroup" Display="Dynamic" />

           &nbsp;&nbsp;&nbsp;&nbsp;

           <asp:Button ID="btnShow" runat="server" Text="Show Vitamin" CssClass="btn-submit" OnClick="btnShow_Click" CausesValidation="false" />

           <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
    </div>



</asp:Content>
