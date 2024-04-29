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
    public partial class bookingplum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);



                if (!IsPostBack)
                {
                    // Retrieve data sent from previous page
                    string pldrainQuantity = Request.Form["pldrainQuantity"];
                    string plflushQuantity = Request.Form["plflushQuantity"];
                    string plshQuantity = Request.Form["plshQuantity"];
                    string plbasinQuantity = Request.Form["plbasinQuantity"];
                    string pldrainName = Request.Form["pldrainName"];
                    string plflushName = Request.Form["plflushName"];
                    string plshName = Request.Form["plshName"];
                    string plbasinName = Request.Form["plbasinName"];



                    string subtotal = Request.Form["subtotal"];
                    string tax = Request.Form["tax"];
                    string shipping = Request.Form["shipping"];
                    string total = Request.Form["total"];

                    int pldrain = 0, plflush = 0;
                    int plsh = 0, plbasin = 0;
                    int.TryParse(pldrainQuantity, out pldrain);
                    int.TryParse(plflushQuantity, out plflush);
                    int.TryParse(plshQuantity, out plsh);
                    int.TryParse(plbasinQuantity, out plbasin);

                lblpldrain.Visible = (pldrain > 0);
                lblplflush.Visible = (plflush > 0);
                lblplsh.Visible = (plsh > 0);
                lblplbasin.Visible = (plbasin > 0);
                lblpldrainname.Visible = (pldrain > 0);
                lblplflushname.Visible = (plflush > 0);


                lblpldrain.Text = pldrainQuantity;
                lblplflush.Text = plflushQuantity;
                lblplbasin.Text = plbasinQuantity;
                lblplsh.Text = plshQuantity;
                lblpldrainname.Text = pldrainName;
                lblplflushname.Text = plflushName;
                lblplbasinname.Text = plbasinName;
                lblplshname.Text = plshName;
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


            string pldrainName = lblpldrainname.Text;
            string plflushName = lblplflushname.Text;
            string plshName = lblplshname.Text;
            string plbasinName = lblplbasinname.Text;
            string pldrainQuantity = lblpldrain.Text;
            string plflushQuantity = lblplflush.Text;
            string plbasinQuantity = lblplbasin.Text;
            string plshQuantity = lblplsh.Text;
            string app = appointment.Text.Trim();

            string total = lbltotal.Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            con.Open();
            string insertorder = "INSERT INTO bookdetplum(qtyn1, qty1, qtyn2, qty2, qtyn3, qty3, qtyn4, qty4, total, email,appointmentdate) " +
                                 "VALUES (@qtyn1, @qty1, @qtyn2, @qty2, @qtyn3, @qty3, @qtyn4, @qty4, @total, @email,@appointmentdate)";
            SqlCommand cmuser = new SqlCommand(insertorder, con);
            cmuser.Parameters.AddWithValue("@qtyn1", pldrainName);
            cmuser.Parameters.AddWithValue("@qty1", pldrainQuantity);
            cmuser.Parameters.AddWithValue("@qtyn2", plflushName);
            cmuser.Parameters.AddWithValue("@qty2", plflushQuantity);
            cmuser.Parameters.AddWithValue("@qtyn3", plbasinName);
            cmuser.Parameters.AddWithValue("@qty3", plbasinQuantity);
            cmuser.Parameters.AddWithValue("@qtyn4", plshName);
            cmuser.Parameters.AddWithValue("@qty4", plshQuantity);
            cmuser.Parameters.AddWithValue("@total", total);
            cmuser.Parameters.AddWithValue("@email", email);
            cmuser.Parameters.AddWithValue("@appointmentdate", app);
            cmuser.ExecuteNonQuery();




            con.Close();
            Response.Redirect("WebForm1.aspx");


        }








    }
}
