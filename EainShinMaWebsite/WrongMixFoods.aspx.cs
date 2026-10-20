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
    public partial class WrongMixFoods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);



        protected void btnSubmit_Click1(object sender, EventArgs e)
        {                 
              if (FileUpload1.HasFile && FileUpload2.HasFile && FileUpload3.HasFile)
         {       
                  //ပထမပုံအတွက်စစ်တာ
                string extension1 = Path.GetExtension(FileUpload1.FileName);
                if (extension1 == ".jpg" || extension1 == ".jpeg" || extension1 == ".png")
                {
                    string fname = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("images/") + fname);

                                      //ဒုတိယပုံအတွက်စစ်တာ
                    string extension2=Path.GetExtension(FileUpload2.FileName);
                     if(extension2 == ".jpg" || extension2==".jpeg"|| extension2==".png"){
                         string fname2=Path.GetFileName(FileUpload2.FileName);
                         FileUpload2.SaveAs(Server.MapPath("images")+fname2);
                    
                             //တတိယပုံအတွက်စစ်တာ
                       string extension3=Path.GetExtension(FileUpload3.FileName);
                     if(extension3 == ".jpg" || extension3==".jpeg"|| extension3==".png"){
                         string fname3=Path.GetFileName(FileUpload2.FileName);
                         FileUpload2.SaveAs(Server.MapPath("images")+fname3);


                         try
                         {
                             conn.Open();

                             string str = "INSERT INTO WrongMixFood(Photo1, Photo1Name,Photo2,Photo2Name,Photo3,Photo3Name)  VALUES (@f1, @f2, @f3, @f4,@f5,@f6)";
                             SqlCommand cmd = new SqlCommand(str, conn);
                             cmd.Parameters.AddWithValue("@f1", FileUpload1.FileName);
                             cmd.Parameters.AddWithValue("@f2", txtPhoto1.Text);
                             cmd.Parameters.AddWithValue("@f3", FileUpload2.FileName);
                             cmd.Parameters.AddWithValue("@f4", txtPhoto2.Text);
                             cmd.Parameters.AddWithValue("@f5", FileUpload3.FileName);
                             cmd.Parameters.AddWithValue("@f6", txtPhoto3.Text);
                             int rows = cmd.ExecuteNonQuery();
                             conn.Close();
                             if (rows > 0)
                             {
                                 Response.Write("<script>alert('Insert Successfully')</script>");
                                 txtPhoto1.Text = "";
                                 txtPhoto2.Text = "";
                                 txtPhoto3.Text = "";
                             }
                             else
                             {                              Response.Write("<script>alert('Insert Failed')</script>");                       }

                         }
                         catch (SqlException excep)
                         { Response.Write(excep.Message); }
                         conn.Close();
                     }
                                              }
               
                     }
        }
        }

        //protected void btnShow_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("SelectWrongMixFood.aspx");
        //}

        protected void btnShow_Click1(object sender, EventArgs e)
        {
            Response.Redirect("SelectWrongMixFood.aspx");
        }
        }

    }

  
