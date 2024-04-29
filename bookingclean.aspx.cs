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
    public partial class bookingclean : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);

            if (!IsPostBack)
            {
         
                // Retrieve data sent from the previous page
                string fullQuantity = Request.Form["fullQuantity"];
                string preQuantity = Request.Form["preQuantity"];
                string kitQuantity = Request.Form["kitQuantity"];
                string bathQuantity = Request.Form["cupQuantity"];
                string fullName = Request.Form["fullName"];
                string preName = Request.Form["preName"];
                string kitName = Request.Form["kitName"];
                string bathName = Request.Form["bathName"];

                string subtotal = Request.Form["subtotal"];
                string tax = Request.Form["tax"];
                string shipping = Request.Form["shipping"];
                string total = Request.Form["total"];

                int full = 0, pre = 0;
                int kit = 0, bath = 0;
                int.TryParse(fullQuantity, out full);
                int.TryParse(preQuantity, out pre);
                int.TryParse(kitQuantity, out kit);
                int.TryParse(bathQuantity, out bath);

                lblfull.Visible = (full > 0);
                lblpre.Visible = (pre > 0);
                lblkit.Visible = (kit > 0);
                lblbath.Visible = (bath > 0);
                lblfullname.Visible = (full > 0);
                lblprename.Visible = (pre > 0);

               
                lblfull.Text = fullQuantity;
                lblpre.Text = preQuantity;
                lblkit.Text = kitQuantity;
                lblbath.Text = bathQuantity;
                lblfullname.Text = fullName;
                lblprename.Text = preName;
                lblkitname.Text = kitName;
                lblbathname.Text = bathName;
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
            
            string fullName = lblfullname.Text;
            string preName = lblprename.Text;
            string kitName = lblkitname.Text;
            string bathName = lblbathname.Text;
            string fullQuantity = lblfull.Text;
            string preQuantity = lblpre.Text;
            string kitQuantity = lblkit.Text;
            string bathQuantity = lblbath.Text;
            string app = appointment.Text.Trim();
            string total = lbltotal.Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            con.Open();
            string insertorder = "INSERT INTO bookdetclean(qtyn1, qty1, qtyn2, qty2, qtyn3, qty3, qtyn4, qty4, total, email,appointmentdate) " +
                                 "VALUES (@qtyn1, @qty1, @qtyn2, @qty2, @qtyn3, @qty3, @qtyn4, @qty4, @total, @email,@appointmentdate)";
            SqlCommand cmuser = new SqlCommand(insertorder, con);
            cmuser.Parameters.AddWithValue("@qtyn1", fullName);
            cmuser.Parameters.AddWithValue("@qty1", fullQuantity);
            cmuser.Parameters.AddWithValue("@qtyn2", preName);
            cmuser.Parameters.AddWithValue("@qty2", preQuantity);
            cmuser.Parameters.AddWithValue("@qtyn3", kitName);
            cmuser.Parameters.AddWithValue("@qty3", kitQuantity);
            cmuser.Parameters.AddWithValue("@qtyn4", bathName);
            cmuser.Parameters.AddWithValue("@qty4", bathQuantity);
            cmuser.Parameters.AddWithValue("@total", total);
            cmuser.Parameters.AddWithValue("@email", email);
            cmuser.Parameters.AddWithValue("@appointmentdate", app);
            cmuser.ExecuteNonQuery();
            con.Close();
            Response.Redirect("WebForm1.aspx");
        }
    }
}