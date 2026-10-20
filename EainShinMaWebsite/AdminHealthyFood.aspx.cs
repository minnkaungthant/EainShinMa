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
    public partial class AdminHealthyFood : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowAdminHealthyFood.aspx");
        }

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            if (fuPhoto.HasFile && fuBodyPartPhoto.HasFile)
            {
                //ပထမပုံအတွက်စစ်တာ


                string extension1 = Path.GetExtension(fuPhoto.FileName).ToLower();


                if (extension1 == ".jpg" || extension1 == ".jpeg" || extension1 == ".png")
                {
                    string fname = Path.GetFileName(fuPhoto.FileName);
                    fuPhoto.SaveAs(Server.MapPath("images/") + fname);


                    //ဒုတိယပုံအတွက်စစ်တာ
                    string extension2 = Path.GetExtension(fuBodyPartPhoto.FileName).ToLower();
                    if (extension2 == ".jpg" || extension2 == ".jpeg" || extension2 == ".png")
                    {
                        string fname2 = Path.GetFileName(fuBodyPartPhoto.FileName);
                        fuBodyPartPhoto.SaveAs(Server.MapPath("images/") + fname2);

                        try
                        {
                            conn.Open();

                            string sql = @"INSERT INTO HealthyFood (FoodName, Photo, BodyPart, BodyPartPhoto, Description) 
                               VALUES (@FoodName, @Photo, @BodyPart, @BodyPartPhoto, @Description)";
                            SqlCommand cmd = new SqlCommand(sql, conn);
                            cmd.Parameters.AddWithValue("@FoodName", txtFoodName.Text);
                            cmd.Parameters.AddWithValue("@Photo", fname);
                            cmd.Parameters.AddWithValue("@BodyPart", txtBodyPart.Text);
                            cmd.Parameters.AddWithValue("@BodyPartPhoto", fname2);
                            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                            int rows = cmd.ExecuteNonQuery();
            
                            //conn.Close();
                            if (rows > 0)
                            {
                                Response.Write("<script>alert('Insert Successfully')</script>");
                                lblMessage.Text = "✅ Food added successfully!";

                                txtFoodName.Text = "";
                                txtBodyPart.Text = "";
                                txtDescription.Text = "";

                            }
                            else
                            {
                                Response.Write("<script>alert('Insert Failed')</script>");

                                lblMessage.Text = "❌ Insert Failed";

                            }

                        }
                        catch (SqlException excep)
                        { Response.Write("<script>alert('" + excep.Message + "')</script>"); }
                        conn.Close();
                    }

                }
            }
        }
    }
    }






