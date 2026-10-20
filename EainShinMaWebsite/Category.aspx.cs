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
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GVbind();
            }
        }
        void clear()
        {
            txtCategory.Text = "";
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into MenuCategory  values(N'" + txtCategory.Text + "')", conn);
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert(''Data has been submitted successfully')</script>");
                    GVbind();
                }
                clear();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtCategory.Text = "";

        }
        protected void GVbind()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {              
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT CategoryID, CategoryName FROM MenuCategory", conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;
            GVbind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            //string categoryName = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                // Update လုပ်မယ့် ID ကို ရယူ
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                // Edit mode row မှ TextBox control ကိုရယူ
                GridViewRow row = GridView1.Rows[e.RowIndex];
                string CategoryName = ((TextBox)row.Cells[1].Controls[0]).Text;

                // Database update query
   
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE MenuCategory SET CategoryName=@CategoryName WHERE CategoryID=@Id", conn);
                    cmd.Parameters.AddWithValue("@CategoryName", CategoryName);
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.ExecuteNonQuery();
                }

                // Edit mode cancel လုပ်ပြီး GridView refresh
                GridView1.EditIndex = -1;
                GVbind();
            }

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GVbind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete from MenuCategory where CategoryID='" + id + "'", conn);
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('Data has Deleted')</script>");
                    GridView1.EditIndex = -1;
                    GVbind();
                }
            }
        }

  
    }
}