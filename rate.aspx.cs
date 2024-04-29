using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fixmojowebsite
{
    public partial class rate : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=HARI\\SQLEXPRESS01;Initial Catalog=user;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void rateus(object sender, EventArgs e)
        {



            if (Page.IsValid)
            {

                conn.Open();


                string insertQuery = "INSERT INTO userfeedback(emailaddress,feedback) VALUES (@emailaddress, @feedback)";



                SqlCommand cmd = new SqlCommand(insertQuery, conn);



                cmd.Parameters.AddWithValue("@emailaddress", user.Text);
                cmd.Parameters.AddWithValue("@feedback", info.Text);

                cmd.ExecuteNonQuery();
                Response.Redirect("home.aspx");
                conn.Close();








            }


        }




    }
}