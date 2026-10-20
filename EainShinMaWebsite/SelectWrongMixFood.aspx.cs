using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EainShinMaWebsite
{
    public partial class ShowWrongFood : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadWrongFoods();
            }
        }

        private void LoadWrongFoods()
        {
            string query = "SELECT * FROM WrongMixFood";
            SqlDataAdapter sda = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnBackToDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int wId = Convert.ToInt32(e.CommandArgument);
                string deleteQuery = "DELETE FROM WrongMixFood WHERE WID = @WID";
                SqlCommand cmd = new SqlCommand(deleteQuery, conn);
                cmd.Parameters.AddWithValue("@WID", wId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                LoadWrongFoods(); // Refresh the GridView
            }
        }
    }
}
