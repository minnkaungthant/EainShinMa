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
    public partial class UnhealthyFood : System.Web.UI.Page
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
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM UnhealthyFood", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string fileName = "";
            if (fuPhoto.HasFile)
            {
                string folder = Server.MapPath("~/images/");
                if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
                fileName = Path.GetFileName(fuPhoto.FileName);
                fuPhoto.SaveAs(Path.Combine(folder, fileName));
            }
            SqlCommand cmd = new SqlCommand("INSERT INTO UnhealthyFood (FoodName, Photo, Disease, Description) VALUES (@FoodName,@Photo,@Disease,@Description)", conn);
            cmd.Parameters.AddWithValue("@FoodName", txtFoodName.Text);
            cmd.Parameters.AddWithValue("@Photo", fileName);
            cmd.Parameters.AddWithValue("@Disease", txtDisease.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            txtFoodName.Text = "";
            txtDisease.Text = "";
            txtDescription.Text = "";
            BindGrid();
        }
        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
    //        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
    //        GridViewRow row = GridView1.Rows[e.RowIndex];

    //        string name = ((TextBox)row.Cells[1].Controls[0]).Text;
    //        string disease = ((TextBox)row.Cells[3].Controls[0]).Text;
    //        string description = ((TextBox)row.Cells[4].Controls[0]).Text;
    //        FileUpload fuEdit = (FileUpload)row.FindControl("fuEditPhoto");
    //        string fileName = "";
    //        if (fuEdit != null && fuEdit.HasFile)
    //        {
    //            string folder = Server.MapPath("~/images/");
    //            if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
    //            fileName = Path.GetFileName(fuEdit.FileName);
    //            fuEdit.SaveAs(Path.Combine(folder, fileName));
    //        }
    //         else
    //{
    //    // ယခင်ပုံကို database မှ ရယူ
    //    SqlCommand cmdGet = new SqlCommand("SELECT Photo FROM UnhealthyFood WHERE FoodID=@Id", conn);
    //    cmdGet.Parameters.AddWithValue("@Id", id);
    //    conn.Open();
    //    object obj = cmdGet.ExecuteScalar();
    //    conn.Close();
    //    fileName = obj.ToString();
    //}

    //        SqlCommand cmd = new SqlCommand("UPDATE UnhealthyFood SET FoodName=@FoodName, Disease=@Disease, Description=@Description, Photo=@Photo WHERE FoodID=@Id", conn);
    //        cmd.Parameters.AddWithValue("@Id", id);
    //        cmd.Parameters.AddWithValue("@FoodName", name);
    //        cmd.Parameters.AddWithValue("@Disease", disease);
    //        cmd.Parameters.AddWithValue("@Description", description);
    //        cmd.Parameters.AddWithValue("@Photo", fileName);

    //        conn.Open();
    //        cmd.ExecuteNonQuery();
    //        conn.Close();
    //           GridView1.EditIndex = -1;
    //BindGrid();

            //News Style


            //int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            //GridViewRow row = GridView1.Rows[e.RowIndex];

            //string name = ((TextBox)row.Cells[1].Controls[0]).Text;
            //string disease = ((TextBox)row.Cells[3].Controls[0]).Text;
            //string description = ((TextBox)row.Cells[4].Controls[0]).Text;

            //// FileUpload control ကို EditItemTemplate မှ ရယူ
            //FileUpload fuEdit = (FileUpload)row.FindControl("fuEditPhoto");
            //string fileName = "";

            //if (fuEdit != null && fuEdit.HasFile)
            //{
            //    string folder = Server.MapPath("~/images/");
            //    if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
            //    fileName = Path.GetFileName(fuEdit.FileName);
            //    fuEdit.SaveAs(Path.Combine(folder, fileName));
            //}
            //else
            //{
            //    // ယခင်ပုံကို database မှ ရယူ
            //    SqlCommand cmdGet = new SqlCommand("SELECT Photo FROM UnhealthyFood WHERE FoodID=@Id", conn);
            //    cmdGet.Parameters.AddWithValue("@Id", id);
            //    conn.Open();
            //    object obj = cmdGet.ExecuteScalar();
            //    conn.Close();
            //    fileName = obj.ToString();
            //}

            //SqlCommand cmd = new SqlCommand("UPDATE UnhealthyFood SET FoodName=@FoodName, Disease=@Disease, Description=@Description, Photo=@Photo WHERE FoodID=@Id", conn);
            //cmd.Parameters.AddWithValue("@Id", id);
            //cmd.Parameters.AddWithValue("@FoodName", name);
            //cmd.Parameters.AddWithValue("@Disease", disease);
            //cmd.Parameters.AddWithValue("@Description", description);
            //cmd.Parameters.AddWithValue("@Photo", fileName);

            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();

            //GridView1.EditIndex = -1;
            //BindGrid();



            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];

            TextBox txtName = (TextBox)row.FindControl("txtFoodNameEdit");
            TextBox txtDisease = (TextBox)row.FindControl("txtDiseaseEdit");
            TextBox txtDescription = (TextBox)row.FindControl("txtDescriptionEdit");
            FileUpload fuEdit = (FileUpload)row.FindControl("fuEditPhoto");

            string name = txtName.Text;
            string disease = txtDisease.Text;
            string description = txtDescription.Text;

            string fileName = "";
            if (fuEdit != null && fuEdit.HasFile)
            {
                string folder = Server.MapPath("~/images/");
                if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
                fileName = Path.GetFileName(fuEdit.FileName);
                fuEdit.SaveAs(Path.Combine(folder, fileName));
            }
            else
            {
                SqlCommand cmdGet = new SqlCommand("SELECT Photo FROM UnhealthyFood WHERE FoodID=@Id", conn);
                cmdGet.Parameters.AddWithValue("@Id", id);
                conn.Open();
                object obj = cmdGet.ExecuteScalar();
                conn.Close();
                fileName = obj.ToString();
            }

            SqlCommand cmd = new SqlCommand("UPDATE UnhealthyFood SET FoodName=@FoodName, Disease=@Disease, Description=@Description, Photo=@Photo WHERE FoodID=@Id", conn);
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@FoodName", name);
            cmd.Parameters.AddWithValue("@Disease", disease);
            cmd.Parameters.AddWithValue("@Description", description);
            cmd.Parameters.AddWithValue("@Photo", fileName);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            GridView1.EditIndex = -1;
            BindGrid();




             }

        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }
 protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand("DELETE FROM UnhealthyFood WHERE FoodID=@Id", conn);
            cmd.Parameters.AddWithValue("@Id", id);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            BindGrid();
        }


        protected void btnShow_Click(object sender, EventArgs e)
        {

        }
    }
}