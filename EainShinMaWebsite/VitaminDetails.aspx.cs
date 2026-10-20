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
    public partial class VitaminDetails : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
               if (!IsPostBack && Request.QueryString["id"] != null)
            {
                int vitaminId = int.Parse(Request.QueryString["id"]);          
                LoadFoods(vitaminId);
            }

        }
private void LoadFoods(int id)
{

     SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    {
        conn.Open();
        string query = "SELECT FoodName, Photo FROM VitaminFood WHERE VitaminID=@id";

        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@id", id);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                rptFoods.DataSource = reader;
                rptFoods.DataBind();
            }
        }
    }
}


    }
}
 

