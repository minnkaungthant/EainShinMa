using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Text;

namespace EainShinMaWebsite
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public string vitaminLabels = "";
        public string vitaminCounts = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["email"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
               
                LoadVitaminChartData();
            }
        }
        private void LoadVitaminChartData()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            {
                string query = @"
                    SELECT VitaminName, COUNT(*) AS VitaminCount
                    FROM VitaminInfo
                    GROUP BY VitaminName
                    ORDER BY VitaminCount DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                StringBuilder labels = new StringBuilder();
                StringBuilder counts = new StringBuilder();

                foreach (DataRow row in dt.Rows)
                {
                    labels.Append("'" + row["VitaminName"].ToString() + "',");
                    counts.Append(row["VitaminCount"].ToString() + ",");
                }

                // Remove trailing commas
                if (labels.Length > 0) labels.Length--;
                if (counts.Length > 0) counts.Length--;

                vitaminLabels = labels.ToString();
                vitaminCounts = counts.ToString();

            }
        }
    }
}