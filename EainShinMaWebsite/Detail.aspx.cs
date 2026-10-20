using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EainShinMaWebsite
{
    public partial class Detail : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
    if (!IsPostBack)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
        {
            int id;
            if (int.TryParse(Request.QueryString["Id"], out id))
            {
                LoadDetail(id);
            }
            else
            {
                Response.Write("Invalid ID!");
            }
        }
        else
        {
            Response.Write("ID is missing in query string!");
        }
    }
}

private void LoadDetail(int id)
{
    // Database connection
        string sql = "SELECT Id, Name, Photo, Description FROM Testing WHERE Id=@Id";
        using (SqlCommand cmd = new SqlCommand(sql, conn))
        {
            cmd.Parameters.AddWithValue("@Id", id);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            { blName.Text=dr["Name"].ToString();
        
               
                lblDescription.Text = dr["Description"].ToString();
                imgProduct.ImageUrl = dr["Photo"].ToString(); 
                //img.Src = dr["Photo"].ToString(); // image path adjust လုပ်ရမယ်
            }
            else
            {
                Response.Write("No record found for ID=" + id);
            }
            dr.Close();
        }
    }
}



        }


