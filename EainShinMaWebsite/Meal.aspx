<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Meal.aspx.cs" Inherits="EainShinMaWebsite.Meal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container mt-5 mb-5" style="border-radius:2px">
            <div class="row">
                <asp:Repeater ID="rptMeals" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3 mb-4">
                            <div class="card h-100 shadow-sm m-3">
                                    <asp:Image ID="Image2" runat="server" CssClass="card-img-top"
                        ImageUrl='<%# ResolveUrl("~/images/") + Eval("Photo") %>' alt="City Image"
                       style="height:150px; object-fit:cover; border-radius:inherit"/>
                                
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("MealName") %></h5>
                                    <p class="card-text">
                                        <%# Eval("Description").ToString().Length > 100 
                                            ? Eval("Description").ToString().Substring(0, 100) + "..." 
                                            : Eval("Description") %>
                                    </p>
                                    <asp:HyperLink ID="btnReadMore" runat="server" 
                                        NavigateUrl='<%# "MealDetailsUpd.aspx?id=" + Eval("MealID") %>' 
                                        CssClass="btn btn-danger">Read More</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>





  <%--  <asp:DataList ID="DataList1" runat="server" DataKeyField="MealID" DataSourceID="SqlDataSource1" Width="502px" RepeatDirection="Horizontal" CssClass="m-5" OnItemCommand="DataList1_ItemCommand">

          <ItemTemplate>
                         <div class="member-img">
                <asp:Image ID="Image1" runat="server" Height="170px" Width="283px" ImageUrl='<%# ResolveUrl("~/images/") + Eval("Photo") %>'  class="img-fluid" alt=""/>
            <br />
              
              </div>              
       
    
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("MealName") %>'></asp:Label>            <br />
            <asp:Button ID="Button1" runat="server" Text="ပိုမိုလေ့လာရန်" CssClass="btn btn-primary" CommandArgument='<%# Eval("MealID") %>' CommandName="Detail"/>
      
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [MealID], [MealName], [Photo] FROM [Meal]"></asp:SqlDataSource>--%>

</asp:Content>
             
