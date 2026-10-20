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
    public partial class UpdateMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);


        protected void txtCategoryID_TextChanged(object sender, EventArgs e)
        {   conn.Open();
            SqlCommand cmd = new SqlCommand("select * from MenuCategory where CategoryID=@t1", conn);
            cmd.Parameters.AddWithValue("@t1", Convert.ToInt16(txtCategoryID.Text));
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtCategoryName.Text = dr["CategoryName"].ToString();    
            }
            dr.Close();
            conn.Close();
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Update MenuCategory set CategoryName=@p1 where CategoryID=@p4", conn);       
            cmd.Parameters.AddWithValue("@p1", txtCategoryName.Text);
            cmd.Parameters.AddWithValue("@p4", Convert.ToInt16(txtCategoryID.Text));
            cmd.ExecuteNonQuery();
            Show();
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
    }

}