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
    public partial class HealthyFood : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                BindGrid();

            }
        }
        private void BindGrid(string keyword = "")
        {

            using (SqlCommand cmd = conn.CreateCommand())
            {

                cmd.CommandText = @"
                    SELECT FoodID,FoodName, Photo,BodyPart,BodyPartPhoto,Description FROM HealthyFood
                    WHERE (@kw = '' OR FoodName LIKE '%'+@kw+'%' )";

                cmd.Parameters.AddWithValue("@kw", keyword ?? string.Empty);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptFood.DataSource = dt;
                    rptFood.DataBind();

                }
            }
        }

    }
}
       










