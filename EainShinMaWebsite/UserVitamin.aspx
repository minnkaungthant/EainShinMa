<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserVitamin.aspx.cs" Inherits="EainShinMaWebsite.UserVitamin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
        .vitamin-card {
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .vitamin-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
        .vitamin-header {
            background: linear-gradient(135deg, #ff6b6b, #ff8787);
            color: white;
            font-weight: bold;
            font-size: 1.2rem;
            padding: 12px 15px;
        }
        .vitamin-body {
            padding: 16px;
            background: #fff;
        }
        .vitamin-body ul {
            list-style-type: disc;
            padding-left: 20px;
        }
        .vitamin-body li {
            margin-bottom: 8px;
            color: #444;
        }
        .btn-details {
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 25px;
            padding: 6px 14px;
            font-size: 14px;
            transition: background-color 0.2s ease;
            text-decoration: none;
        }
        .btn-details:hover {
            background-color: #c82333;
        }
        .pretty li::marker {
  color: orange;   /* bullet အရောင် */
  font-size: 1.2em; /* bullet အရွယ် */
}
         /* Nested bullet style */
  .nested {
    list-style: none;
    padding-left: 20px;
    margin-top: 6px;
  }
  .nested li {
    position: relative;
    margin: 6px 0;
    padding-left: 22px;
    font-weight: normal;
    color: #374151; /* text-slate-700 */
  }
  .nested li::before {
    content: "➤"; /* nested bullet symbol */
    position: absolute;
    left: 0; top: 0;
    color: #059669; /* green-600 */
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container my-4">
        <h2 class="text-center mb-4"><b style="color:red">Vitamin Information</b> </h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater ID="rptVitamins" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card vitamin-card h-100">
                            <!-- Vitamin Name (Title) -->
                            <div class="vitamin-header">
                                <%# Eval("VitaminName") %>
                            </div>
                            <!-- Bullet style Info -->
                            <div class="vitamin-body">
                                <ul>
                                    <li class="pretty" style="color:red"><b>အဓိကရရှိနိုင်သော အစားအစာ</b>
                                              <ul><li class="nested"><%# Eval("FoodSources") %></li>

                                              </ul>
                                    </li>
                                      <li class="pretty" style="color:red"><b>သန်မာစေသော ခန္ဓာကိုယ်အစိတ်အပိုင်း</b>
                                              <ul><li class="nested"> <%# Eval("Strengthens") %></li>

                                              </ul>
                                    </li>
                                     <li class="pretty" style="color:red"><b>ချို့တဲ့မှုကြောင့် ဖြစ်နိုင်သော ရောဂါ</b>
                                              <ul><li class="nested">  <%# Eval("Prevents") %></li>

                                              </ul>
                                    </li>
                                
                                
                                </ul>
                                <a href='VitaminDetails.aspx?id=<%# Eval("VitaminID") %>' class="btn btn-details mt-2">ပါဝင်သောအစားအစာများ</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
