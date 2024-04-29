using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fixmojowebsite
{
    public partial class bookingelec : System.Web.UI.Page
    {
        protected void appointment_TextChanged(object sender, EventArgs e)
        {

            DateTime appointmentDate = DateTime.Parse(appointment.Text);

            string email = lblemail.Text.Trim();

            SaveAppointmentDate(appointmentDate, email);
        }

        protected void SaveAppointmentDate(DateTime appointmentdate, string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            string insertQuery = "INSERT INTO[user].[dbo].[appointmentdet](appointmentdate, Email)" +
             "VALUES(@appointmentdate, @Email)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {

                    command.Parameters.AddWithValue("@appointmentdate", appointmentdate);
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {

                        connection.Open();

                        command.ExecuteNonQuery();

                        lblMessage.Text = "Appointment date and email saved successfully.";
                    }
                    catch (Exception ex)
                    {
                        // Display an error message if there's an exception
                        lblMessage.Text = "Error saving appointment date and email: " + ex.Message;
                    }
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);



            if (!IsPostBack)
            {
                // Retrieve data sent from previous page
                string liginQuantity = Request.Form["liginQuantity"];
                string ligrepQuantity = Request.Form["ligrepQuantity"];
                string faninQuantity = Request.Form["faninQuantity"];
                string fanrepQuantity = Request.Form["fanrepQuantity"];
                string liginName = Request.Form["liginName"];
                string ligrepName = Request.Form["ligrepName"];
                string faninName = Request.Form["faninName"];
                string fanrepName = Request.Form["fanrepName"];

                string subtotal = Request.Form["subtotal"];
                string tax = Request.Form["tax"];
                string shipping = Request.Form["shipping"];
                string total = Request.Form["total"];

                int ligin = 0, ligrep = 0;
                int fanin = 0, fanrep = 0;
                int.TryParse(liginQuantity, out ligin);
                int.TryParse(ligrepQuantity, out ligrep);
                int.TryParse(faninQuantity, out fanin);
                int.TryParse(fanrepQuantity, out fanrep);

                lblligin.Visible = (ligin > 0);
                lblligrep.Visible = (ligrep > 0);
                lblfanin.Visible = (fanin > 0);
                lblfanrep.Visible = (fanrep > 0);
                lblliginname.Visible = (ligin > 0);
                lblligrepname.Visible = (ligrep > 0);

                lblligin.Text = liginQuantity;
                lblligrep.Text = ligrepQuantity;
                lblfanin.Text = faninQuantity;
                lblfanrep.Text = fanrepQuantity;
                lblliginname.Text = liginName;
                lblligrepname.Text = ligrepName;
                lblfaninname.Text = faninName;
                lblfanrepname.Text = fanrepName;
                lblsubtotal.Text = subtotal;
                lbltax.Text = tax;
                lblship.Text = shipping;
                lbltotal.Text = total;

            }
        }

        protected void btnSubmitAppointment_Click(object sender, EventArgs e)
        {

            string email = lblemail.Text.Trim();




            if (!string.IsNullOrEmpty(email))
            {
                try
                {
                    // Create and configure the email message
                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress("fixmojoo@gmail.com"); // Sender's email address
                    mail.To.Add(email);
                    mail.Subject = "Appointment Confirmation";
                    mail.Body = "Hello!! User, Your appointment has been confirmed.";

                    // Configure SMTP client
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
                    smtpClient.Port = 587;
                    smtpClient.Credentials = new NetworkCredential("fixmojoo@gmail.com", "kczf xtfc ftxy ggyq");
                    smtpClient.EnableSsl = true;

                    // Send the email
                    smtpClient.Send(mail);

                    // Insert booking details into the database
                    InsertBookingDetails(email);



                    // Redirect to confirmation page
                    Response.Redirect("WebForm1.aspx");
                }
                catch (Exception ex)
                {
                    // Handle email sending error
                    lblMessage.Text = "An error occurred while sending the email: " + ex.Message;
                }
            }
            else
            {
                // Handle case where email is empty
                lblMessage.Text = "Please enter a valid email address.";
            }
        }






        private void InsertBookingDetails(string email)
        {


            string liginName = lblliginname.Text;
            string ligrepName = lblligrepname.Text;
            string faninName = lblfaninname.Text;
            string fanrepName = lblfanrepname.Text;
            string liginQuantity = lblligin.Text;
            string ligrepQuantity = lblligrep.Text;
            string faninQuantity = lblfanin.Text;
            string fanrepQuantity = lblfanrep.Text;
            string app = appointment.Text.Trim();

            string total = lbltotal.Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            con.Open();
            string insertorder = "INSERT INTO bookdetelec(qtyn1, qty1, qtyn2, qty2, qtyn3, qty3, qtyn4, qty4, total, email,appointmentdate) " +
                                 "VALUES (@qtyn1, @qty1, @qtyn2, @qty2, @qtyn3, @qty3, @qtyn4, @qty4, @total, @email,@appointmentdate)";
            SqlCommand cmuser = new SqlCommand(insertorder, con);
            cmuser.Parameters.AddWithValue("@qtyn1", liginName);
            cmuser.Parameters.AddWithValue("@qty1", liginQuantity);
            cmuser.Parameters.AddWithValue("@qtyn2", ligrepName);
            cmuser.Parameters.AddWithValue("@qty2", ligrepQuantity);
            cmuser.Parameters.AddWithValue("@qtyn3", faninName);
            cmuser.Parameters.AddWithValue("@qty3", faninQuantity);
            cmuser.Parameters.AddWithValue("@qtyn4", fanrepName);
            cmuser.Parameters.AddWithValue("@qty4", fanrepQuantity);
            cmuser.Parameters.AddWithValue("@total", total);
            cmuser.Parameters.AddWithValue("@email", email);
            cmuser.Parameters.AddWithValue("@appointmentdate", app);
            cmuser.ExecuteNonQuery();




            con.Close();
            Response.Redirect("WebForm1.aspx");

        }
    }
}