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
    public partial class SelectWrongMixFood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindGrid();
            }
        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        private void BindGrid(string keyword = "")
        {
            using (SqlCommand cmd = conn.CreateCommand())
            {
                cmd.CommandText = @"
    SELECT WID, Photo1, Photo1Name, Photo2, Photo2Name, Photo3, Photo3Name 
    FROM WrongMixFood
    WHERE (@kw = '' OR Photo1Name LIKE '%'+@kw+'%' 
                  OR Photo2Name LIKE '%'+@kw+'%' 
                  OR Photo3Name LIKE '%'+@kw+'%')";

                cmd.Parameters.AddWithValue("@kw", keyword ?? string.Empty);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvFoods.DataSource = dt;
                    gvFoods.DataBind();
                }
            }
        }


        protected void gvFoods_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvFoods.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvFoods_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFoods.EditIndex = -1;
            BindGrid();
        }
        //protected void gvFoods_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        //{
        //    gvFoods.PageIndex = e.NewPageIndex;
        //    BindGrid(txtSearch.Text.Trim());
        //}

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
        protected void gvFoods_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int wID = Convert.ToInt32(gvFoods.DataKeys[e.RowIndex].Value);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                string query = "DELETE FROM WrongMixFood WHERE WID=@WID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@WID", wID);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            // Refresh GridView
            BindGrid();
        }
        //protected void gvFoods_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    int id = Convert.ToInt32(gvFoods.DataKeys[e.RowIndex].Value);
        //    GridViewRow row = gvFoods.Rows[e.RowIndex];

        //    // Find controls
        //    FileUpload fu1 = (FileUpload)row.FindControl("fuEditPhoto1");
        //    FileUpload fu2 = (FileUpload)row.FindControl("fuEditPhoto2");
        //    FileUpload fu3 = (FileUpload)row.FindControl("fuEditPhoto3");

        //    TextBox txt1 = (TextBox)row.FindControl("txtPhoto1");
        //    TextBox txt2 = (TextBox)row.FindControl("txtPhoto2");
        //    TextBox txt3 = (TextBox)row.FindControl("txtPhoto3");

        //    // Update photos if new file uploaded
        //    if (fu1.HasFile)
        //    {
        //        string path1 = "~/images/" + fu1.FileName;
        //        fu1.SaveAs(Server.MapPath(path1));
        //        txt1.Text = fu1.FileName;
        //    }
        //    if (fu2.HasFile)
        //    {
        //        string path2 = "~/images/" + fu2.FileName;
        //        fu2.SaveAs(Server.MapPath(path2));
        //        txt2.Text = fu2.FileName;
        //    }
        //    if (fu3.HasFile)
        //    {
        //        string path3 = "~/images/" + fu3.FileName;
        //        fu3.SaveAs(Server.MapPath(path3));
        //        txt3.Text = fu3.FileName;
        //    }

        //    // TODO: Update database with new values
        //    UpdateFoodInDatabase(id, txt1.Text, txt2.Text, txt3.Text);

        //    gvFoods.EditIndex = -1;
        //    BindGrid();
        //}

        //private void UpdateFoodInDatabase(int id, string photo1, string photo2, string photo3)
        //{
        //    // Example: SQL Update Command

        //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        //    {
        //        string query = "UPDATE WrongMixFood SET Photo1=@p1, Photo2=@p2, Photo3=@p3 WHERE WID=@id";
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@p1", photo1);
        //        cmd.Parameters.AddWithValue("@p2", photo2);
        //        cmd.Parameters.AddWithValue("@p3", photo3);
        //        cmd.Parameters.AddWithValue("@id", id);

        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //        conn.Close();
        //    }
        //}
        protected void gvFoods_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvFoods.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvFoods.Rows[e.RowIndex];

            FileUpload fu1 = (FileUpload)row.FindControl("fuEditPhoto1");
            FileUpload fu2 = (FileUpload)row.FindControl("fuEditPhoto2");
            FileUpload fu3 = (FileUpload)row.FindControl("fuEditPhoto3");

            TextBox txt1 = (TextBox)row.FindControl("txtPhoto1Edit");
            TextBox txt2 = (TextBox)row.FindControl("txtPhoto2Edit");
            TextBox txt3 = (TextBox)row.FindControl("txtPhoto3Edit");

            // default values (textbox values)
            string photo1 = null, photo1Name = txt1.Text;
            string photo2 = null, photo2Name = txt2.Text;
            string photo3 = null, photo3Name = txt3.Text;

            // upload new photo if any
            if (fu1.HasFile)
            {
                string fileName1 = fu1.FileName;
                fu1.SaveAs(Server.MapPath("~/images/" + fileName1));
                photo1 = fileName1;   // photo path

            }

            if (fu2.HasFile)
            {
                string fileName2 = fu2.FileName;
                fu2.SaveAs(Server.MapPath("~/images/" + fileName2));
                photo2 = fileName2;
            }

            if (fu3.HasFile)
            {
                string fileName3 = fu3.FileName;
                fu3.SaveAs(Server.MapPath("~/images/" + fileName3));
                photo3 = fileName3;
            }

            UpdateFoodInDatabase(id, photo1, photo1Name, photo2, photo2Name, photo3, photo3Name);

            gvFoods.EditIndex = -1;
            BindGrid();
        }

        private void UpdateFoodInDatabase(int id, string photo1, string photo1Name,
                                  string photo2, string photo2Name,
                                  string photo3, string photo3Name)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                string query = @"UPDATE WrongMixFood 
                         SET Photo1 = ISNULL(@p1, Photo1), Photo1Name=@p1n,
                             Photo2 = ISNULL(@p2, Photo2), Photo2Name=@p2n,
                             Photo3 = ISNULL(@p3, Photo3), Photo3Name=@p3n
                         WHERE WID=@id";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@p1", (object)photo1 ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@p1n", (object)photo1Name ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@p2", (object)photo2 ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@p2n", (object)photo2Name ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@p3", (object)photo3 ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@p3n", (object)photo3Name ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

    }
}