using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EainShinMaWebsite
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["email"] != null)
            //{
            //    lbladminName.Text = Session["email"].ToString();
            //}
            //else
            //{
            //    lbladminName.Text = "Guest"; // Session မရှိလျှင် default text
            //}
            if (Session["email"] == null)
                Response.Redirect("~/Login.aspx");
            else
                lbladminName.Text = "Welcome, " + Session["email"].ToString();
        }

        //protected void btnProfile_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Profile.aspx");
        //}

        //protected void btnLogout_Click(object sender, EventArgs e)
        //{

        //}
    }
}