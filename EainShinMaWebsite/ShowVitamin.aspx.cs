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
using System.IO;

namespace EainShinMaWebsite
{
    public partial class ShowVitamin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }
        private void BindGrid()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
  
            {
                string query = "SELECT VitaminID, VitaminName, FoodSources, Strengthens, Prevents FROM VitaminInfo";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int vitaminID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                string query = "DELETE FROM VitaminInfo WHERE VitaminID=@VitaminID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@VitaminID", vitaminID);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            // Refresh GridView
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
  
            int vitaminID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string foodSources = ((TextBox)row.FindControl("txtFoodSources")).Text;
            string strengthens = ((TextBox)row.FindControl("txtStrengthens")).Text;
            string prevents = ((TextBox)row.FindControl("txtPrevents")).Text;

         
            {
                string query = @"UPDATE VitaminInfo 
                                 SET FoodSources=@FoodSources, Strengthens=@Strengthens, Prevents=@Prevents 
                                 WHERE VitaminID=@VitaminID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FoodSources", foodSources);
                cmd.Parameters.AddWithValue("@Strengthens", strengthens);
                cmd.Parameters.AddWithValue("@Prevents", prevents);
                cmd.Parameters.AddWithValue("@VitaminID", vitaminID);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            GridView1.EditIndex = -1;
            BindGrid();
        }
    }

       

        }


