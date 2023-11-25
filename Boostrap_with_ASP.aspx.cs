using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace ASP_Tutorial
{
    public partial class Boostrap_with_ASP : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["aspcoursecs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Insert into BootstrapForm values (@name, @gender, @email, @subject, @comment)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@name", Txt_Name.Text);
            cmd.Parameters.AddWithValue("@gender", Ddl_Gender.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@email", Txt_Email.Text);
            cmd.Parameters.AddWithValue("@subject", Ddl_Subject.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@comment", Txt_Comment.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if(a > 0)
            {
                Lbl_Alert.Text = "Form has been submitted";
                Lbl_Alert.Visible = true;
                Lbl_Alert.CssClass = "text-success mb-2";
                Txt_Name.Text = Txt_Email.Text = Txt_Comment.Text = "";
                Ddl_Gender.ClearSelection();
                Ddl_Subject.ClearSelection();
            }
            else
            {
                Lbl_Alert.Text = "Form has not been submitted";
                Lbl_Alert.Visible = true;
                Lbl_Alert.CssClass = "text-danger mb-2";
            }
        }
    }
}