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
    public partial class login : System.Web.UI.Page
    {
        protected SqlConnection GetSqlConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return new SqlConnection(connectionString);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (email.Text == "fixmojoadmin1@gmail.com" && password.Text == "fmadmin1" )
            {

                Response.Redirect("admin.aspx");
            }

            else
            {
                SqlConnection con = GetSqlConnection();
                try
                {
                    con.Open();
                    string insertuserlog = "insert into [uslogin](email,password)values(@email,@password)";
                    SqlCommand cmuser = new SqlCommand(insertuserlog, con);
                    cmuser.Parameters.AddWithValue("@email", email.Text);
                    cmuser.Parameters.AddWithValue("@password", password.Text);
                    cmuser.ExecuteNonQuery();
                    Response.Redirect("services.aspx");
                }
                catch (Exception ex)
                {
                    // Handle the exception
                    errmsg.Text = "An error occurred while processing your request." + ex.Message;
                }
                finally
                {
                    if (con.State == System.Data.ConnectionState.Open)
                    {
                        con.Close();
                    }
                }
            }

        }


    }
}
