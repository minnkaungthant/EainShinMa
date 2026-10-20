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
    public partial class ShowAdminHealthyFood : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFood();
            }
        }
        private void LoadFood()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM HealthyFood", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

  
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int foodID = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);
            Session["FoodID"] = foodID; 
            Response.Redirect("UpdateHealthyFood.aspx");
        }

    
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int foodID = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);

            SqlCommand cmd = new SqlCommand("DELETE FROM HealthyFood WHERE FoodID=@FoodID", conn);
            cmd.Parameters.AddWithValue("@FoodID", foodID);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            LoadFood(); 
        }
    }
}
