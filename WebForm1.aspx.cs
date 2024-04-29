using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
namespace fixmojowebsite
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_click(object sender, EventArgs e)
            {

                MailMessage mail = new MailMessage();
                mail.To.Add(user.Text.ToString().Trim());
                mail.From = new MailAddress("poojapounraj@gmail.com");
                mail.Body = "Welcome to our Car Planet family. Your order has been successfully placed, and the payment has been processed. ~ADMIN";
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new System.Net.NetworkCredential("carplanetcars2024@gmail.com", "zvynacxywlxvcbog");
                smtp.Send(mail);
                Response.Redirect("rate.aspx");





            }

        }

    }