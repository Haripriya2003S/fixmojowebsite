using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fixmojowebsite
{
    public partial class paymentdet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(user.Text.ToString().Trim());
            mail.From = new MailAddress("fixmojoo@gmail.com");
            mail.Body = " Your order has been successfully placed, and the payment has been processed. ~FIXMOJO";
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential("fixmojoo@gmail.com", "kczfxtfcftxyggyq");
            smtp.Send(mail);
            Response.Redirect("rate.aspx");
        }
    }
}