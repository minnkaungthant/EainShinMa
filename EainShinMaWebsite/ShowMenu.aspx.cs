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
    public partial class ShowMenu : System.Web.UI.Page
    {
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
                SqlCommand cmd = new SqlCommand("SELECT *  FROM Meal", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
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
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];        
            TextBox txtMealName = (TextBox)row.FindControl("txtMealName");
            FileUpload fuPhoto = (FileUpload)row.FindControl("fuPhoto");
            TextBox txtIngredient = (TextBox)row.FindControl("txtIngredient");
            TextBox txtDescription = (TextBox)row.FindControl("txtDescription");

            string fileName = "";
            if (fuPhoto.HasFile)
            {
                string folderPath = Server.MapPath("~/images/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                fileName = Path.GetFileName(fuPhoto.FileName);
                fuPhoto.SaveAs(Path.Combine(folderPath, fileName));
                //photoPath = "~/images/" + Path.GetFileName(fuPhoto.FileName);
                //fuPhoto.SaveAs(folderPath + Path.GetFileName(fuPhoto.FileName));
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Meal SET  MealName=@MealName " +
           (fileName != null ? ", Photo=@Photo" : "") + ",Ingredient=@Intregient, Description=@Description  WHERE MealID=@Id", conn);
                cmd.Parameters.AddWithValue("@Id", id);
        
                cmd.Parameters.AddWithValue("@MealName", txtMealName.Text);
                cmd.Parameters.AddWithValue("@Photo", fileName);
                cmd.Parameters.AddWithValue("@Intregient", txtIngredient.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);

                cmd.ExecuteNonQuery();
                conn.Close();

            }

            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete from Meal  where MealID='" + id + "'", conn);
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('Data has Deleted')</script>");
                    GridView1.EditIndex = -1;
                    BindGrid();
                }
            }
        }

        }
    }
