using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class GridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Lnk_Insert_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("Txt_Name_Insert")).Text;

            SqlDataSource1.InsertParameters["gender"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("Drp_Gender_Insert")).SelectedValue;

            SqlDataSource1.InsertParameters["class"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("Txt_Class_Insert")).Text;

            int a = SqlDataSource1.Insert();
            if(a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Data inserted successfully')</script>");
            } else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Data insertion failed!!!')</script>");
            }
        }
    }
}