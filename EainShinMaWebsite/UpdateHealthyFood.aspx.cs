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
    public partial class UpdateHealthyFood : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
          if (!IsPostBack)
        {
            if (Session["FoodID"] != null)
            {
                int foodID = Convert.ToInt32(Session["FoodID"]);
                lblFoodID.Text = foodID.ToString();
                LoadFood(foodID);
            }
            else
            {
                Response.Redirect("AdminHealthyFood.aspx");
            }
        }
                }


        private void LoadFood(int foodID)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM HealthyFood WHERE FoodID=@FoodID", conn);
            cmd.Parameters.AddWithValue("@FoodID", foodID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                txtFoodName.Text = dt.Rows[0]["FoodName"].ToString();
                txtBodyPart.Text = dt.Rows[0]["BodyPart"].ToString();
                txtDescription.Text = dt.Rows[0]["Description"].ToString();


                string foodPhoto = dt.Rows[0]["Photo"].ToString();
                if (!string.IsNullOrEmpty(foodPhoto))
                    imgPhoto.ImageUrl = ResolveUrl("~/images/" + foodPhoto);

                // BodyPart Photo
                string bodyPartPhoto = dt.Rows[0]["BodyPartPhoto"].ToString();
                if (!string.IsNullOrEmpty(bodyPartPhoto))
                    imgBodyPartPhoto.ImageUrl = ResolveUrl("~/images/" + bodyPartPhoto);

                //imgPhoto.ImageUrl = dt.Rows[0]["Photo"].ToString();
                //imgBodyPartPhoto.ImageUrl = dt.Rows[0]["BodyPartPhoto"].ToString();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
  
            int foodID = Convert.ToInt32(Session["FoodID"]);

            string photoPath = imgPhoto.ImageUrl;         // ရှိပြီးသား path
            string bodyPartPhotoPath = imgBodyPartPhoto.ImageUrl;

            // 1) Food Photo upload
            if (fuPhoto.HasFile)
            {
                string filename = Path.GetFileName(fuPhoto.PostedFile.FileName); // filename only
                string folderPath = "~/images/"; // folder path
                string savePath = folderPath + filename;

                fuPhoto.SaveAs(Server.MapPath(savePath)); // server folder ထဲသိမ်း
                photoPath = filename; // Database ထဲမှာ f
            }
            if (fuBodyPartPhoto.HasFile)
            {
                string filename2 = Path.GetFileName(fuBodyPartPhoto.PostedFile.FileName);
                string folderPath = "~/images/";
                string savePath2 = folderPath + filename2;

                fuBodyPartPhoto.SaveAs(Server.MapPath(savePath2));
                bodyPartPhotoPath = filename2; // Database မှာ filename only
            }


            //if (fuBodyPartPhoto.HasFile)
            //{
            //    string filename2 = Path.GetFileName(fuBodyPartPhoto.PostedFile.FileName);
            //    string path2 = "~/images/" + filename2;
            //    fuBodyPartPhoto.SaveAs(Server.MapPath(path2));
            //    bodyPartPhotoPath = path2;
            //}

            // 3) Update database
            SqlCommand cmd = new SqlCommand("UPDATE HealthyFood SET FoodName=@FoodName, BodyPart=@BodyPart, Description=@Description, Photo=@Photo, BodyPartPhoto=@BodyPartPhoto WHERE FoodID=@FoodID", conn);
            cmd.Parameters.AddWithValue("@FoodName", txtFoodName.Text);
            cmd.Parameters.AddWithValue("@BodyPart", txtBodyPart.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@Photo", photoPath);
            cmd.Parameters.AddWithValue("@BodyPartPhoto", bodyPartPhotoPath);
            cmd.Parameters.AddWithValue("@FoodID", foodID);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("AdminHealthyFood.aspx"); // ပြန် Admin Panel
    }
        }
    }

