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
    public partial class WrongMixFoodUser : System.Web.UI.Page
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
                    SELECT Photo1, Photo1Name, Photo2, Photo2Name, Photo3, Photo3Name FROM WrongMixFood
                    WHERE (@kw = '' OR Photo1Name LIKE '%'+@kw+'%' OR Photo2Name LIKE '%'+@kw+'%' OR Photo3Name LIKE '%'+@kw+'%')";
       
                cmd.Parameters.AddWithValue("@kw", keyword ?? string.Empty);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                  gvFoods.DataSource=dt;
                    gvFoods.DataBind();
      
                }
            }
        }

        protected void gvFoods_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            gvFoods.PageIndex = e.NewPageIndex;
            BindGrid(txtSearch.Text.Trim());
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid(txtSearch.Text.Trim());
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            gvFoods.PageIndex = 0;
            BindGrid();
        }
    }
    }
