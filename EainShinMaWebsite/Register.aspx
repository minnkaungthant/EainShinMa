<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EainShinMaWebsite.Register" %>

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
                <h3 class="text-center mb-4 text-danger">User Registration</h3>

                <!-- Name -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="Name is required" 
                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

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

                <!-- Confirm Password -->
                <div class="mb-3">
                    <label class="form-label">Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                        ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm password is required"
                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvPassword" runat="server"
                        ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword"
                        ErrorMessage="Passwords do not match"
                        CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
                </div>

                <!-- Phone -->
                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="09xxxxxxxxx"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                        ControlToValidate="txtPhone" ErrorMessage="Phone number is required"
                        CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server"
                        ControlToValidate="txtPhone" ErrorMessage="Invalid phone number"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationExpression="^[0-9]{7,15}$"></asp:RegularExpressionValidator>
                </div>

                <!-- Submit -->
                <div class="d-grid">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" style="background-color:#ce1212;color:white;font-weight:500;font-size:larger" OnClick="btnRegister_Click" />
                </div>

                <asp:ValidationSummary ID="vsErrors" runat="server" CssClass="alert alert-danger mt-3" HeaderText="Please fix the following:" DisplayMode="BulletList" />

            </div>
        </div>
    </form>
</body>
</html>


      <!-- Bootstrap JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
         <%--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" rel="stylesheet" />--%>