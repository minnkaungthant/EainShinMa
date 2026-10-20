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
    public partial class MealDetailsUpd : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMeal();
            }
        }

        private void LoadMeal()
        {
            if (Request.QueryString["id"] != null)
            {
                int mealId;
                if (int.TryParse(Request.QueryString["id"], out mealId))
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
         
                    {
                        string query = "SELECT MealName, Photo, Ingredient, Description FROM Meal WHERE MealID=@MealID";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@MealID", mealId);
                        conn.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            pnlMeal.Visible = true;

                           imgMeal.ImageUrl = ResolveUrl("~/images/" + rdr["Photo"].ToString());
                         //imgMeal.ImageUrl = rdr["Photo"].ToString();
                            lblMealName.InnerText = rdr["MealName"].ToString();
                            lblIngredient.InnerText = rdr["Ingredient"].ToString();
                            lblDescription.InnerText= rdr["Description"].ToString();
                        }
                        //else
                        //{
                        //    lblMessage.InnerText = "Meal not found!";
                        //}
                    }
                }
                //else
                //{
                //    lblMessage.InnerText = "Invalid Meal ID!";
                //}
            }
            //else
            //{
            //    lblMessage.InnerText = "Meal ID is missing!";
            //}
        }
    }
}