using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class ListBoxExercise : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(ListBox1.SelectedIndex == -1)
            {
                Response.Write("Please select an item");
            } else
            {
                foreach(ListItem li in ListBox1.Items)
                {
                    if(li.Selected)
                    {
                        Response.Write($"Selected Item Text is {li.Text}. <br/>");
                        Response.Write($"Selected Item Value is {li.Value}. <br/>");
                        Response.Write($"Selected Item Index is {ListBox1.Items.IndexOf(li)}. <br/>");
                        Response.Write("---------------------------------------<br/>");
                    }
                }
            }
        }
    }
}