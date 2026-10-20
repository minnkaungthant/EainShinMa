using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace EainShinMaWebsite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
       

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            conn.Open();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

          SqlDataAdapter sda =new SqlDataAdapter( "SELECT * FROM Register WHERE Email='"+txtEmail.Text+"'  AND Password='"+txtPassword.Text+"'",conn);
      DataTable dt=new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                if (AuthenticateUser(email, password))
                {
                    Session["email"] = email;
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                  lblError.Text = "Invalid login";
                }
            }
             
            }
            private bool AuthenticateUser(string email, string pass)
    {
        return email ==  txtEmail.Text.Trim()  &&  pass == txtPassword.Text.Trim();
    }
         
        }
    }
