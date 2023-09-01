using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class ViewState : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Btn_Click(object sender, EventArgs e)
        {
            ViewState["user"] = Txt_User.Text;
            ViewState["pass"] = Txt_Pass.Text;

            Txt_User.Text = string.Empty;
            Txt_Pass.Text = string.Empty;
        }

        protected void Restore_Btn_Click(object sender, EventArgs e)
        {
            if (ViewState["user"] != null)
            {
                Txt_User.Text = ViewState["user"].ToString();
            }
            if (ViewState["pass"] != null)
            {
                Txt_Pass.Text = ViewState["pass"].ToString();
            }
        }
    }
}