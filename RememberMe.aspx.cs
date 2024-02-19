using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

namespace ASP_Tutorial
{
    public partial class RememberMe : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["aspcoursecs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Txt_Password.Attributes["type"] = "password";
            if (!IsPostBack)
            {
                if (Request.Cookies["username"] != null)
                {
                    Txt_Username.Text = Request.Cookies["username"].Value.ToString();
                }
                if (Request.Cookies["password"] != null)
                {
                    string encryptedPassword = Request.Cookies["password"].Value.ToString();
                    byte[] b = Convert.FromBase64String(encryptedPassword);
                    string decryptedPassword = ASCIIEncoding.ASCII.GetString(b);
                    //Use this method to display text on Password Textbox
                    Txt_Password.Attributes.Add("value", decryptedPassword);
                }
                if (Request.Cookies["username"] != null && Request.Cookies["password"] != null)
                {
                    Chk_RememberMe.Checked = true;
                }
            }
        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Login where username = @username and password = @password";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@username", Txt_Username.Text);
            sda.SelectCommand.Parameters.AddWithValue("@password", Txt_Password.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count > 0 )
            {
                if(Chk_RememberMe.Checked )
                {
                    Response.Cookies["username"].Value = Txt_Username.Text;
                    //Encrypting the Password
                    byte [] b = ASCIIEncoding.ASCII.GetBytes(Txt_Password.Text);
                    string encryptedPassword = Convert.ToBase64String(b);
                    Response.Cookies["password"].Value = encryptedPassword;
                    Response.Cookies["username"].Expires = DateTime.Now.AddDays(2);
                    Response.Cookies["password"].Expires = DateTime.Now.AddDays(2);
                }
                else
                {
                    //Delete the cookies
                    Response.Cookies["username"].Expires = DateTime.Now.AddDays(-2);
                    Response.Cookies["password"].Expires = DateTime.Now.AddDays(-2);
                }
                Session["username"] = Txt_Username.Text;
                Session["password"] = Txt_Password.Text;
                Response.Redirect("RememberMe2.aspx");
            }
            else
            {
                Response.Write("<script>alert('Username or Password is incorrect!');</script>");
            }
        }
    }
}