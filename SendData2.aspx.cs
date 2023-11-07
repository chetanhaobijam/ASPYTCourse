using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class SendData2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null && Session["name"] != null && Session["age"] != null && Session["image"] != null)
            {
                Lbl_Id.Text = Session["id"].ToString();
                Lbl_Name.Text = Session["name"].ToString();
                Lbl_Age.Text = Session["age"].ToString();
                Img.ImageUrl = Session["image"].ToString();
            } else
            {
                Response.Redirect("SendData1.aspx");
            }
        }
    }
}