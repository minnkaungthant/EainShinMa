using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.IO;

namespace EainShinMaWebsite
{
    public partial class UserUnhealthyFood : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCards();
            }
        }
        private void BindCards()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM UnhealthyFood", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rptUnhealthyFood.DataSource = dt;
            rptUnhealthyFood.DataBind();
        }



    }
}