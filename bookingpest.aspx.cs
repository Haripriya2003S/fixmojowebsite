using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fixmojowebsite
{
    public partial class bookingpest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);



            if (!IsPostBack)
            {
                // Retrieve data sent from previous page
                string pesthQuantity = Request.Form["pesthQuantity"];
                string pestkitQuantity = Request.Form["pestkitQuantity"];
                string pestbathQuantity = Request.Form["pestbathQuantity"];
                string pestutQuantity = Request.Form["pestutQuantity"];
                string pesthName = Request.Form["pesthName"];
                string pestkitName = Request.Form["pestkitName"];
                string pestbathName = Request.Form["pestbathName"];
                string pestutName = Request.Form["pestutName"];



                string subtotal = Request.Form["subtotal"];
                string tax = Request.Form["tax"];
                string shipping = Request.Form["shipping"];
                string total = Request.Form["total"];

                int pesth = 0, pestkit = 0;
                int pestbath = 0, pestut = 0;
                int.TryParse(pesthQuantity, out pesth);
                int.TryParse(pestkitQuantity, out pestkit);
                int.TryParse(pestbathQuantity, out pestbath);
                int.TryParse(pestutQuantity, out pestut);



                lblpesth.Visible = (pesth > 0);
                lblpestkit.Visible = (pestkit > 0);
                lblpestbath.Visible = (pestbath > 0);
                lblpestut.Visible = (pestut > 0);
                lblpesthname.Visible = (pesth > 0);
                lblpestkitname.Visible = (pestkit > 0);


                lblpesth.Text = pesthQuantity;
                lblpestkit.Text = pestkitQuantity;
                lblpestut.Text = pestutQuantity;
                lblpestbath.Text = pestbathQuantity;
                lblpesthname.Text = pesthName;
                lblpestkitname.Text = pestkitName;
                lblpestutname.Text = pestutName;
                lblpestbathname.Text = pestbathName;
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


            string pesthName = lblpesthname.Text;
            string pestkitName = lblpestkitname.Text;
            string pestutName = lblpestutname.Text;
            string pestbathName = lblpestbathname.Text;
            string pesthQuantity = lblpesth.Text;
            string pestkitQuantity = lblpestkit.Text;
            string pestbathQuantity = lblpestbath.Text;
            string pestutQuantity = lblpestut.Text;
            string app = appointment.Text.Trim();

            string total = lbltotal.Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            con.Open();
            string insertorder = "INSERT INTO bookdetpest(qtyn1, qty1, qtyn2, qty2, qtyn3, qty3, qtyn4, qty4, total, email,appointmentdate) " +
                                 "VALUES (@qtyn1, @qty1, @qtyn2, @qty2, @qtyn3, @qty3, @qtyn4, @qty4, @total, @email,@appointmentdate)";
            SqlCommand cmuser = new SqlCommand(insertorder, con);
            cmuser.Parameters.AddWithValue("@qtyn1", pesthName);
            cmuser.Parameters.AddWithValue("@qty1", pesthQuantity);
            cmuser.Parameters.AddWithValue("@qtyn2", pestkitName);
            cmuser.Parameters.AddWithValue("@qty2", pestkitQuantity);
            cmuser.Parameters.AddWithValue("@qtyn3", pestbathName);
            cmuser.Parameters.AddWithValue("@qty3", pestbathQuantity);
            cmuser.Parameters.AddWithValue("@qtyn4", pestutName);
            cmuser.Parameters.AddWithValue("@qty4", pestutQuantity);
            cmuser.Parameters.AddWithValue("@total", total);
            cmuser.Parameters.AddWithValue("@email", email);
            cmuser.Parameters.AddWithValue("@appointmentdate", app);
            cmuser.ExecuteNonQuery();




            con.Close();
            Response.Redirect("WebForm1.aspx");


        }

    }
}
