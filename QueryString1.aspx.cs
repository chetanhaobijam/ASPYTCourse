using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class QueryString1aspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("QueryString2.aspx?id=" + Server.UrlEncode(Txt_Student_Id.Text) + "&name=" + Server.UrlEncode(Txt_Student_Name.Text) + "&age=" + Server.UrlEncode(Txt_Student_Age.Text));
        }
    }
}