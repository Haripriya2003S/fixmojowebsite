using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fixmojowebsite
{
    public partial class carpenterdet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Call a method to retrieve and display order details
                DisplayOrderDetails();
            }
            void DisplayOrderDetails()
            {
                // Connection string to your database
                string connectionString = "Data Source=HARI\\SQLEXPRESS01;Initial Catalog=user;Integrated Security=True;";

                // SQL query to select order details
                string query = "SELECT orderID,qtyn1, qty1, qtyn2, qty2, qtyn3, qty3, qtyn4, qty4, total, email FROM bookdetcarpen";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Open connection
                        connection.Open();

                        // Execute query
                        SqlDataReader reader = command.ExecuteReader();

                        // Bind the retrieved data to a GridView or any other suitable control
                        GridView1.DataSource = reader;
                        GridView1.DataBind();

                        // Close connection
                        reader.Close();
                    }
                }
            }
        }
    }
}