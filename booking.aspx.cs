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
    public partial class booking : System.Web.UI.Page
    {
        private int intpt;
        private int extpt;
        private string itemName = "";
       
        protected void appointment_TextChanged(object sender, EventArgs e)
        {
         
            DateTime appointmentDate = DateTime.Parse(appointment.Text);
          
            string email = lblemail.Text.Trim();

            SaveAppointmentDate(appointmentDate, email);
        }

        protected void SaveAppointmentDate(DateTime appointmentdate, string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            string insertQuery = "INSERT INTO[user].[dbo].[appointmentdet](appointmentdate, Email)"+
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
                string paintQuantity = Request.Form["paintQuantity"];
                string waterQuantity = Request.Form["waterQuantity"];
                string intptQuantity = Request.Form["intptQuantity"];
                string extptQuantity = Request.Form["extptQuantity"];
                string paintName = Request.Form["paintName"];
                string waterName = Request.Form["waterName"];
                string intptName = Request.Form["intptName"];
                string extptName = Request.Form["extptName"];



                string subtotal = Request.Form["subtotal"];
                string tax = Request.Form["tax"];
                string shipping = Request.Form["shipping"];
                string total = Request.Form["total"];
                int paint = 0, water = 0;
                int.TryParse(paintQuantity, out paint);
                int.TryParse(waterQuantity, out water);
                int.TryParse(intptQuantity, out intpt);
                int.TryParse(extptQuantity, out extpt);



                lblpaint.Visible = (paint > 0);
                lblwater.Visible = (water > 0);
                lblintpt.Visible = (intpt > 0);
                lblextpt.Visible = (extpt > 0);
                lblpaintname.Visible = (paint > 0);
                lblwatername.Visible = (water > 0);


                lblpaint.Text = paintQuantity;
                lblwater.Text = waterQuantity;
                lblextpt.Text = extptQuantity;
                lblintpt.Text = intptQuantity;
                lblpaintname.Text = paintName;
                lblwatername.Text = waterName;
                lblextptname.Text = extptName;
                lblintptname.Text = intptName;
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


            string paintName = lblpaintname.Text;
            string waterName = lblwatername.Text;
            string intptName = lblintptname.Text;
            string extptName = lblextptname.Text;
            string paintQuantity = lblpaint.Text;
            string waterQuantity = lblwater.Text;
            string extptQuantity = lblextpt.Text;
            string intptQuantity = lblintpt.Text;
            string app = appointment.Text.Trim();

            string total = lbltotal.Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            con.Open();
            string insertorder = "INSERT INTO bookdet(qtyn1, qty1, qtyn2, qty2, qtyn3, qty3, qtyn4, qty4, total, email,appointmentdate) " +
                                 "VALUES (@qtyn1, @qty1, @qtyn2, @qty2, @qtyn3, @qty3, @qtyn4, @qty4, @total, @email,@appointmentdate)";
            SqlCommand cmuser = new SqlCommand(insertorder, con);
            cmuser.Parameters.AddWithValue("@qtyn1", paintName);
            cmuser.Parameters.AddWithValue("@qty1", paintQuantity);
            cmuser.Parameters.AddWithValue("@qtyn2", waterName);
            cmuser.Parameters.AddWithValue("@qty2", waterQuantity);
            cmuser.Parameters.AddWithValue("@qtyn3", extptName);
            cmuser.Parameters.AddWithValue("@qty3", extptQuantity);
            cmuser.Parameters.AddWithValue("@qtyn4", intptName);
            cmuser.Parameters.AddWithValue("@qty4", intptQuantity);
            cmuser.Parameters.AddWithValue("@total", total);
            cmuser.Parameters.AddWithValue("@email", email);
            cmuser.Parameters.AddWithValue("@appointmentdate",app);
            cmuser.ExecuteNonQuery();
            
            
           
         
            con.Close();
            Response.Redirect("WebForm1.aspx");


        }

         }
            }
        

