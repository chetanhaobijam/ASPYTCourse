using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class QueryString2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Txt_Student_Id.Text = Request.QueryString[0];
            Txt_Student_Name.Text = Request.QueryString[1];
            Txt_Student_Age.Text = Request.QueryString[2];


        }
    }
}