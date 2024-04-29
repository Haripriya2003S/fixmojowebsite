using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fixmojowebsite
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("paintingdet.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("acdet.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("carpenterdet.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("cleandet.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("elecdet.aspx");
        }

     

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("plumdet.aspx");

        }

       
    }
    }
