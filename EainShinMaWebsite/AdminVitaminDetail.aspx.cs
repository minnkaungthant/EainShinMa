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
    public partial class AdminVitaminDetail : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    LoadVitamin();
                    BindTowns();

                }
            }
        }
        private void LoadVitamin()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                string sql = "SELECT VitaminID, VitaminName FROM VitaminInfo";
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                ddlVitaminName.DataSource = cmd.ExecuteReader();
                ddlVitaminName.DataTextField = "VitaminName";
                ddlVitaminName.DataValueField = "VitaminID";
                ddlVitaminName.DataBind();
            }
            ddlVitaminName.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--- Vitaminအမည်ရွေးပါ --", ""));
        }

        private void BindTowns()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                string sql = @"SELECT F.FoodID, F.FoodName, V.VitaminName,F.Photo,V.VitaminID
                               FROM VitaminFood F
                               INNER JOIN VitaminInfo V ON V.VitaminID = F.VitaminID";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
              
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlVitaminName.SelectedIndex == 0 || string.IsNullOrWhiteSpace(txtFoodName.Text))
                return;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                if (fuFoodImage.HasFile)
                {
                    string extension = Path.GetExtension(fuFoodImage.FileName);
                    if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                    {
                        string fname = Path.GetFileName(fuFoodImage.FileName);
                        fuFoodImage.SaveAs(Server.MapPath("~/images/") + fname);
                        try
                        {
                            conn.Open();
                            string sql = "INSERT INTO VitaminFood (FoodName, VitaminID,Photo) VALUES (@FoodName, @VitaminName,@Photo)";
                            SqlCommand cmd = new SqlCommand(sql, conn);
                            cmd.Parameters.AddWithValue("@FoodName", txtFoodName.Text.Trim());
                            cmd.Parameters.AddWithValue("@VitaminName", ddlVitaminName.SelectedValue);
                            cmd.Parameters.AddWithValue("@photo", fuFoodImage.FileName);
                            int rows = cmd.ExecuteNonQuery();

                            conn.Close();

                            if (rows > 0)
                            {
                                Response.Write("<script>alert('Insert Successfully')</script>");
                                txtFoodName.Text = "";
                                ddlVitaminName.SelectedIndex = 0;
                                BindTowns();

                            }
                            else
                            {
                                Response.Write("<script>alert('Insert Failed')</script>");
                            }
                        }
                        catch (SqlException excep)
                        {
                            Response.Write(excep.Message);
                        }

                        {
                            conn.Close();
                        }
                    }
                }
            }
        }
                
            
        
            protected void btnDelete_Click(object sender, EventArgs e)
    {
        int foodId = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);
        string imagePath = "";

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        {
            // ပထမဆုံး image path ကိုယူမယ်
            string selectQuery = "SELECT Photo FROM VitaminFood WHERE FoodID=@FoodID";
            using (SqlCommand cmdSelect = new SqlCommand(selectQuery, conn))
            {
                cmdSelect.Parameters.AddWithValue("@FoodID", foodId);
                conn.Open();
                object result = cmdSelect.ExecuteScalar();
                if (result != null)
                {
                    imagePath = Server.MapPath("~/images/") + result.ToString();
                }
                conn.Close();
            }

            // Database မှာ delete လုပ်မယ်
            string deleteQuery = "DELETE FROM VitaminFood WHERE FoodNmae=@FoodName";
            using (SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn))
            {
                cmdDelete.Parameters.AddWithValue("@FoodID", foodId);
                conn.Open();
                cmdDelete.ExecuteNonQuery();
                conn.Close();
            }
        }

        // Folder မှာ image ဖိုင်ကိုဖျက်မယ်
        if (File.Exists(imagePath))
        {
            File.Delete(imagePath);
        }

        // Gallery refresh
        BindTowns();
    }
}
}
                    
                        
        
