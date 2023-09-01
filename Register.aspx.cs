using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class Register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into signup values(@fname,@lname,@gender,@email,@address,@username,@password)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@fname", Txt_First_Name.Text);
            cmd.Parameters.AddWithValue("@lname", Txt_Last_Name.Text);
            cmd.Parameters.AddWithValue("@gender", Txt_Gender.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@email", Txt_Email_Address.Text);
            cmd.Parameters.AddWithValue("@address", Txt_Address.Text);
            cmd.Parameters.AddWithValue("@username", Txt_Username.Text);
            cmd.Parameters.AddWithValue("@password", Txt_Password.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if(a > 0)
            {
                ClientScript.RegisterStartupScript(typeof(Page), "scripts", "alert('Signup successful, Welcome " + Txt_Username.Text  + ".')", true);
                ClearControls();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('Signup failed')</script>");
            }
            con.Close();
        }

        protected void ClearControls()
        {
            Txt_First_Name.Text = Txt_First_Name.Text = Txt_Email_Address.Text = Txt_Address.Text = Txt_Username.Text = Txt_Password.Text = Txt_Confirm_Password.Text = "";
            Txt_Gender.ClearSelection();
        }
    }
}