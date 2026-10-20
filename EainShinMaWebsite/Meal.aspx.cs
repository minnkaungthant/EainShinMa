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
    public partial class Meal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMeals();
            }
        }

        //protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        //{
        //    Session["meal"] = true;
        //    if (e.CommandName == "Detail") {
        //        Response.Redirect("DetailMeal.aspx?id="+Convert.ToInt16(e.CommandArgument));
        //    }
        //}

        private void BindMeals()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
 
            {
                string query = "SELECT MealID, MealName, Photo, Description FROM Meal";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                rptMeals.DataSource = rdr;
                rptMeals.DataBind();
            }
        }
    }
}