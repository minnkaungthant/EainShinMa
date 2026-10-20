<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="HealthyFood.aspx.cs" Inherits="EainShinMaWebsite.HealthyFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .animate-card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    animation: fadeUp 0.6s ease-in-out;
}
.animate-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 10px 25px rgba(40, 167, 69, 0.3); /* green glow */
}

@keyframes fadeUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <%-- <div class="container mt-4">
    <div class="row">
        <div class="col-8 ms-5">
              <div class="d-flex gap-4">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name..."></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-danger" Text="Search" OnClick="btnSearch_Click" />
                 
                        </div>
                             </div>
                          </div>--%>
  <%--  </div>--%>
    <div class="container mt-4">
    <div class="row">
        <asp:Repeater ID="rptFood" runat="server">
            <ItemTemplate>
                <div class="col-md-4 mb-4">
                    <div class="card shadow-lg border-0 rounded-4 animate-card p-3 h-100">
                        
                        <!-- Title (Food Name) -->
                        <h4 class="text-success fw-bold mb-3 text-center">
                            <%# Eval("BodyPart") %>
                        </h4>

                        <!-- Two photos side by side -->
                        <div class="d-flex justify-content-center gap-3">
                            <!-- Food Photo -->
                            <div class="text-center">
                                <label class="fw-semibold text-dark">Food</label>
                                <img src='<%# "images/" + Eval("Photo") %>'
                                     alt="Food Photo"
                                     class="rounded shadow-sm"
                                     style="width:140px; height:140px; object-fit:cover;" />
                            </div>

                            <!-- Body Part Photo -->
                            <div class="text-center">
                                <label class="fw-semibold text-dark">Body Part</label>
                                <img src='<%# "images/" + Eval("BodyPartPhoto") %>'
                                     alt="Body Part Photo"
                                     class="rounded shadow-sm"
                                     style="width:140px; height:140px; object-fit:cover;" />
                            </div>
                        </div>

                        <!-- Description -->
                        <div class="card-body">
                            <p class="card-text text-secondary mt-3">
                                <%# Eval("Description") %>
                            </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>


</asp:Content>
