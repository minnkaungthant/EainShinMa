using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace EainShinMaWebsite
{
    public partial class MenuCategory : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd1 = new SqlCommand("insert into MenuCategory(CategoryName) values (@t1)", conn);
            cmd1.Parameters.AddWithValue("@t1", txtCategoryName.Text);
            cmd1.ExecuteNonQuery();
            Show(); 
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            //GVbind();
        }

        protected void GridView1_RowUpdated(object sender, System.Web.UI.WebControls.GridViewUpdatedEventArgs e)
        {
            //int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        }
        public void Show()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from MenuCategory", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "pp");
            conn.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Update(ds, "pp");
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateMenu.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteMenuCategory.aspx");
        }


    }

        }
 