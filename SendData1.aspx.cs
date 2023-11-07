using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class SendData1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from SendData";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lblId = (Label)row.FindControl("Lbl_Id");
            Label lblName = (Label)row.FindControl("Lbl_Name");
            Label lblAge = (Label)row.FindControl("Lbl_Age");
            Image img = (Image)row.FindControl("Img");

            Session["id"] = lblId.Text;
            Session["name"] = lblName.Text;
            Session["age"] = lblAge.Text;
            Session["image"] = img.ImageUrl.ToString();
            Response.Redirect("SendData2.aspx");
        }
    }
}