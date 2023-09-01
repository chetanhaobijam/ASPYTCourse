using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class PostBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                AddListBoxItems();
            }
        }

        protected void AddListBoxItems()
        {
            ListBox1.Items.Add("Haobijam");
            ListBox1.Items.Add("Chetan");
            ListBox1.Items.Add("Singh");

        }
    }
}