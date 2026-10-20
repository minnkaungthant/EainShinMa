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
    public partial class DetailMeal : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    LoadDetail(id);
                }
                else
                {
                    Response.Write("ID is missing in query string!");
                }
            }

        }

        private void LoadDetail(int id)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Meal WHERE MealID=@Id", conn);
            cmd.Parameters.AddWithValue("@Id", id);
            conn.Open();
            FormView1.DataSource = cmd.ExecuteReader();
            FormView1.DataBind();
            conn.Close();
        }

    }

}