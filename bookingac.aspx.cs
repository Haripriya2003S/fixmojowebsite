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
    public partial class bookingac : System.Web.UI.Page
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
                string genacQuantity = Request.Form["genacQuantity"];
                string wetacQuantity = Request.Form["wetacQuantity"];
                string instacQuantity = Request.Form["instacQuantity"];
                string uninacQuantity = Request.Form["uninacQuantity"];
                string genacName = Request.Form["genacName"];
                string wetacName = Request.Form["wetacName"];
                string instacName = Request.Form["instacName"];
                string uninacName = Request.Form["uninacName"];

                string subtotal = Request.Form["subtotal"];
                string tax = Request.Form["tax"];
                string shipping = Request.Form["shipping"];
                string total = Request.Form["total"];

                int genac = 0, wetac = 0;
                int instac = 0, uninac = 0;
                int.TryParse(genacQuantity, out genac);
                int.TryParse(wetacQuantity, out wetac);
                int.TryParse(instacQuantity, out instac);
                int.TryParse(uninacQuantity, out uninac);

                lblgenac.Visible = (genac > 0);
                lblwetac.Visible = (wetac > 0);
                lblinstac.Visible = (instac > 0);
                lbluninac.Visible = (uninac > 0);
                lblGenacName.Visible = (genac > 0);
                lblWetacName.Visible = (wetac > 0);
                


                lblGenacName.Text = genacName;
                lblWetacName.Text = wetacName;
                lblInstacName.Text = instacName;
                lblUninacName.Text = uninacName;

                lblgenac.Text = genacQuantity;
                lblwetac.Text = wetacQuantity;
                lblinstac.Text = instacQuantity;
                lbluninac.Text = uninacQuantity;

                lblSubtotal.Text = subtotal;
                lblTax.Text = tax;
                lblShipping.Text = shipping;
                lblTotal.Text = total;
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
            

            
            string genacName = lblGenacName.Text;
            string wetacName = lblWetacName.Text;
            string instacName = lblInstacName.Text;
            string uninacName = lblUninacName.Text;
            string genacQuantity = lblgenac.Text;
            string wetacQuantity = lblwetac.Text;
            string instacQuantity = lblinstac.Text;
            string uninacQuantity = lbluninac.Text;
            string app = appointment.Text.Trim();
            string total = lblTotal.Text;

            // Insert booking details into the database
            string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                string insertQuery = "INSERT INTO bookdetac (qtyn1,qty1,qtyn2,qty2,qtyn3,qty3,qtyn4,qty4,total, email,appointmentdate) " +
                                     "VALUES (@qtyn1,@qty1,@qtyn2,@qty2,@qtyn3,@qty3,@qtyn4,@qty4,@total, @email,@appointmentdate)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@qtyn1", genacName);
                cmd.Parameters.AddWithValue("@qty1", genacQuantity);
                cmd.Parameters.AddWithValue("@qtyn2", wetacName);
                cmd.Parameters.AddWithValue("@qty2", wetacQuantity);
                cmd.Parameters.AddWithValue("@qtyn3", instacName);
                cmd.Parameters.AddWithValue("@qty3", instacQuantity);
                cmd.Parameters.AddWithValue("@qtyn4", uninacName);
                cmd.Parameters.AddWithValue("@qty4", uninacQuantity);
                cmd.Parameters.AddWithValue("@total", total);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@appointmentdate", app);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("WebForm1.aspx");
        }




    }
}