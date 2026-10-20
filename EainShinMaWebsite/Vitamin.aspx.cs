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
    public partial class Vitamin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
     
            {
                string query = @"INSERT INTO VitaminInfo 
                                (VitaminName, LocalName, FoodSources, Strengthens, Prevents) 
                                VALUES (@VitaminName, @LocalName, @FoodSources, @Strengthens, @Prevents)";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@VitaminName", ddlVitaminName.SelectedValue); 
                cmd.Parameters.AddWithValue("@LocalName", txtLocalName.Text.Trim());
                cmd.Parameters.AddWithValue("@FoodSources", txtFoodSources.Text.Trim());
                cmd.Parameters.AddWithValue("@Strengthens", txtStrengthens.Text.Trim());
                cmd.Parameters.AddWithValue("@Prevents", txtPrevents.Text.Trim());

                conn.Open();
                int rows = cmd.ExecuteNonQuery();
                conn.Close();

                if (rows > 0)
                {
                    Response.Write("<script>alert('Insert Successfully')</script>");
                  
                    //lblMessage.Text = "✔ Vitamin information saved successfully!";
                    //lblMessage.ForeColor = System.Drawing.Color.Green;

                    // Clear form (except DropdownList)
                    txtLocalName.Text = "";
                    txtFoodSources.Text = "";
                    txtStrengthens.Text = "";
                    txtPrevents.Text = "";
                }
                else
                {
                    //lblMessage.Text = "❌ Failed to save vitamin information.";
                    //lblMessage.ForeColor = System.Drawing.Color.Red;
                    Response.Write("<script>alert('Insert Failed')</script>"); 
                }
            }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowVitamin.aspx");
        }


    }
}