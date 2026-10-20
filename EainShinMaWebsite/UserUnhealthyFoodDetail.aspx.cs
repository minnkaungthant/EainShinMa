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
    public partial class UserUnhealthyFoodDetail : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string foodId = Request.QueryString["FoodID"];
                if (!string.IsNullOrEmpty(foodId))
                {
                    LoadFoodDetails(foodId);
                }
            }
        }
private void LoadFoodDetails(string foodId)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
 
            {
                string query = "SELECT FoodName, Photo, Disease, Description FROM UnhealthyFood WHERE FoodID=@FoodID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FoodID", foodId);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dvFoodDetails.DataSource = dr;
                dvFoodDetails.DataBind();
                conn.Close();
            }
        }
        }
    }
