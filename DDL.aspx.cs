using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class DDL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Runtime
            if(!IsPostBack)
            {
                DDL_Fruits.SelectedValue = "2";

            }
        }

        protected void DDL_Btn_Submit_Click(object sender, EventArgs e)
        {
            if(DDL_Fruits.SelectedItem.Value == "-1")
            {
                Response.Write("Please select an item");
            }
            else
            {
                Response.Write($"The Selected Item Text is {DDL_Fruits.SelectedItem.Text}.<br/>");
                Response.Write($"The Selected Item Value is {DDL_Fruits.SelectedValue}.<br/>");
                Response.Write($"The Selected Item Index is {DDL_Fruits.SelectedIndex}.<br/>");

            }
        }
    }
}