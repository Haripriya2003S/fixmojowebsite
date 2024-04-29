using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fixmojowebsite
{
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);

        }

        protected void regbutton_Click(object sender, EventArgs e)
        {

            bool userExists = CheckIfUserExists(username.Text.ToString(), email.Text.ToString());
            if (userExists)
            {
                // Display error message to the user
                Response.Write("<script>alert('Username or email already exists. Please choose a different one.');</script>");
                return; // Exit the method
            }

            con.Open();
            string insertuser = "insert into [userinfo](username,password,phno,email)values(@username,@password,@phno,@email)";
            SqlCommand cmuser = new SqlCommand(insertuser, con);
            cmuser.Parameters.AddWithValue("@username", username.Text.ToString());
            cmuser.Parameters.AddWithValue("@password", password.Text.ToString());
            cmuser.Parameters.AddWithValue("@phno", phno.Text.ToString());
            cmuser.Parameters.AddWithValue("@email", email.Text.ToString());
            cmuser.ExecuteNonQuery();
            con.Close();
            Response.Redirect("login.aspx");
        }
        private bool CheckIfUserExists(string username, string email)
        {
            con.Open();
            string query = "SELECT COUNT(*) FROM [userinfo] WHERE username = @username OR email = @email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@email", email);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return count > 0;
        }
    }
}