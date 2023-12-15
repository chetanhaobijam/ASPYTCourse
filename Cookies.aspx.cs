using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class Cookies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            //Saves the cookie variable to the user constructor
            HttpCookie cookie = new HttpCookie("user");
            cookie["username"] = Txt_Username.Text;
            //Store cookie in the browser
            Response.Cookies.Add(cookie);
            Response.Redirect("Redirect_Cookie.aspx");
        }
    }
}