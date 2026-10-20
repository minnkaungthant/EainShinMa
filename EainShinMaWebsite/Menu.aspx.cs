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
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string extension = Path.GetExtension(FileUpload1.FileName);
                if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                {
                    string fname = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("images/") + fname);
                    try
                    {
                        conn.Open();

                        string str = "INSERT INTO Meal (MealName, Photo, Ingredient, Description)  VALUES (@menu, @photo, @ing, @desc)";

                        SqlCommand cmd = new SqlCommand(str, conn);

                        cmd.Parameters.AddWithValue("@menu", txtMenuName.Text);
                     cmd.Parameters.AddWithValue("@photo", FileUpload1.FileName);       
                        cmd.Parameters.AddWithValue("@ing", txtIngredient.Text);
                        cmd.Parameters.AddWithValue("@desc", txtDescription.Text);

                        int rows = cmd.ExecuteNonQuery();

                        conn.Close();

                        if (rows > 0)
                        {
                            Response.Write("<script>alert('Insert Successfully')</script>");
                            txtDescription.Text = "";
                            txtIngredient.Text = "";
                            txtMenuName.Text = "";
            
                        }
                        else
                        {
                            Response.Write("<script>alert('Insert Failed')</script>");
                        }

                    }
                    catch (SqlException excep)
                    {              Response.Write(excep.Message);                   }
                                        conn.Close();
                }
                //Show();
            }
            
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowMenu.aspx");
        }


    }
}