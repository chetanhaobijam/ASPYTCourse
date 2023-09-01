using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class SessionState3aspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Write($"Welcome {Session["user"].ToString()}");
            } else
            {
                Response.Redirect("SessionStateForm1.aspx");
            }
        }

        protected void LogOutBtn_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Session["user"] = null;
                Response.Redirect("SessionStateForm1.aspx");
            }
        }
    }
}