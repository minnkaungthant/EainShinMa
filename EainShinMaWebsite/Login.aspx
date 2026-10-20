<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EainShinMaWebsite.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card shadow-lg p-4 rounded-4" style="max-width: 450px; width: 100%;">
                <h3 class="text-center mb-4 text-danger">   Login</h3>
           
                <!-- Email -->
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail" ErrorMessage="Email is required"
                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail" ErrorMessage="Invalid email format"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"></asp:RegularExpressionValidator>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword" ErrorMessage="Password is required"
                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" runat="server"
                        ControlToValidate="txtPassword" ErrorMessage="Password must be at least 6 characters, include 1 uppercase, 1 lowercase, and 1 digit"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$"></asp:RegularExpressionValidator>
                </div>

                  
                <!-- Submit -->
                <div class="d-grid">
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login"   CssClass="btn" style="background-color:#ce1212;color:white;font-weight:500;font-size:larger" />
                </div>

                <asp:ValidationSummary ID="vsErrors" runat="server" CssClass="alert alert-danger mt-3" HeaderText="Please fix the following:" DisplayMode="BulletList" />
                     <div>
                        If you don't have an account, Please 
                </div>
                 <!-- Error Alert Box -->
<asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-danger alert-dismissible fade show mt-3" role="alert">
    <asp:Label ID="lblError" runat="server"></asp:Label>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>


      <!-- Bootstrap JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
         <%--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" rel="stylesheet" />--%>