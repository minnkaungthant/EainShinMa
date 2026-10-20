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
    public partial class UserVitamin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindVitaminData();
            }
        }
        private void BindVitaminData()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT VitaminID, VitaminName, FoodSources, Strengthens, Prevents FROM VitaminInfo", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptVitamins.DataSource = dt;
                rptVitamins.DataBind();
            }
        }
    }
}