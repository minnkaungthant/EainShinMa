using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace EainShinMaWebsite
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            conn.Open();

            // Check if email already exists
            SqlCommand checkCmd = new SqlCommand("SELECT Email FROM Register WHERE Email = @e1", conn);
            checkCmd.Parameters.AddWithValue("@e1", txtEmail.Text);
            SqlDataReader rdr = checkCmd.ExecuteReader();

            if (rdr.Read())
            {
                // Email already exists
                Response.Write("<script>alert('This user already exists.')</script>");
                ClearFields();
                rdr.Close();
            }
            else
            {
                rdr.Close(); // Important to close reader before reusing connection

                // Insert new user
                SqlCommand insertCmd = new SqlCommand("INSERT INTO Register (Name, Email, Password, CPassword, PhoneNo) VALUES (@t1, @t2, @t3, @t4, @t5)", conn);
                insertCmd.Parameters.AddWithValue("@t1", txtName.Text);
                insertCmd.Parameters.AddWithValue("@t2", txtEmail.Text);
                insertCmd.Parameters.AddWithValue("@t3", txtPassword.Text);
                insertCmd.Parameters.AddWithValue("@t4", txtConfirmPassword.Text);
                insertCmd.Parameters.AddWithValue("@t5", Convert.ToInt64(txtPhone.Text));
                insertCmd.ExecuteNonQuery();

                // Retrieve the ID of the newly registered user
                SqlCommand getIdCmd = new SqlCommand("SELECT Id FROM Register WHERE Email = @e2", conn);
                getIdCmd.Parameters.AddWithValue("@e2", txtEmail.Text);
                object userId = getIdCmd.ExecuteScalar();

                if (userId != null)
                {
                    Session["UserId"] = userId;
                    conn.Close();
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Error retrieving user ID.')</script>");
                    conn.Close();
                }

                ClearFields();
            }
        }

        private void ClearFields()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtPhone.Text = "";
        }
    }
}
