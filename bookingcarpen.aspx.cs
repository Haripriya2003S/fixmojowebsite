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
    public partial class bookingcarpen : System.Web.UI.Page
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
         
                string doorrepQuantity = Request.Form["doorrepQuantity"];
                string doorinQuantity = Request.Form["doorinQuantity"];
                string furQuantity = Request.Form["furQuantity"];
                string cupQuantity = Request.Form["cupQuantity"];
                string doorrepName = Request.Form["doorrepName"];
                string doorinName = Request.Form["doorinName"];
                string furName = Request.Form["furName"];
                string cupName = Request.Form["cupName"];

                string subtotal = Request.Form["subtotal"];
                string tax = Request.Form["tax"];
                string shipping = Request.Form["shipping"];
                string total = Request.Form["total"];

                int doorrep = 0, doorin = 0;
                int fur = 0, cup = 0;
                int.TryParse(doorrepQuantity, out doorrep);
                int.TryParse(doorinQuantity, out doorin);
                int.TryParse(furQuantity, out fur);
                int.TryParse(cupQuantity, out cup);

                lbldoorrep.Visible = (doorrep > 0);
                lbldoorin.Visible = (doorin > 0);
                lblfur.Visible = (fur > 0);
                lblcup.Visible = (cup > 0);
                lbldoorrepname.Visible = (doorrep > 0);
                lbldoorinname.Visible = (doorin > 0);

           
                lbldoorrep.Text = doorrepQuantity;
                lbldoorin.Text = doorinQuantity;
                lblfur.Text = furQuantity;
                lblcup.Text = cupQuantity;
                lbldoorrepname.Text = doorrepName;
                lbldoorinname.Text = doorinName;
                lblfurname.Text = furName;
                lblcupname.Text = cupName;
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
           
            string doorrepName = lbldoorrepname.Text;
            string doorinName = lbldoorinname.Text;
            string furName = lblfurname.Text;
            string cupName = lblcupname.Text;
            string doorrepQuantity = lbldoorrep.Text;
            string doorinQuantity = lbldoorin.Text;
            string furQuantity = lblfur.Text;
            string cupQuantity = lblcup.Text;
            string total = lbltotal.Text;
            string app = appointment.Text.Trim();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            con.Open();
            string insertorder = "INSERT INTO bookdetcarpen(qtyn1, qty1, qtyn2, qty2, qtyn3, qty3, qtyn4, qty4, total, email,appointmentdate) " +
                                 "VALUES (@qtyn1, @qty1, @qtyn2, @qty2, @qtyn3, @qty3, @qtyn4, @qty4, @total, @email,@appointmentdate)";
            SqlCommand cmuser = new SqlCommand(insertorder, con);
            cmuser.Parameters.AddWithValue("@qtyn1", doorrepName);
            cmuser.Parameters.AddWithValue("@qty1", doorrepQuantity);
            cmuser.Parameters.AddWithValue("@qtyn2", doorinName);
            cmuser.Parameters.AddWithValue("@qty2", doorinQuantity);
            cmuser.Parameters.AddWithValue("@qtyn3", furName);
            cmuser.Parameters.AddWithValue("@qty3", furQuantity);
            cmuser.Parameters.AddWithValue("@qtyn4", cupName);
            cmuser.Parameters.AddWithValue("@qty4", cupQuantity);
            cmuser.Parameters.AddWithValue("@total", total);
            cmuser.Parameters.AddWithValue("@email", email);
            cmuser.Parameters.AddWithValue("@appointmentdate", app);
            cmuser.ExecuteNonQuery();
            con.Close();
            Response.Redirect("WebForm1.aspx");

        }
    }
}