using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class RememberMe2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"]  != null)
            {
                Response.Write("Welcome " + Session["username"].ToString());
            }
            else
            {
                Response.Redirect("RememberMe.aspx");
            }
        }

        protected void Btn_Logout_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                //Session["username"] = null;
                Session.Abandon();
                Response.Redirect("RememberMe.aspx");
            }
        }
    }
}