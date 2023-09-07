using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;

namespace ASP_Tutorial
{
    public partial class InsertImages : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetImage();
            }
            if(IsPostBack)
            {
                GetImage();
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string path = Server.MapPath("images/");
            if(FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                int length = postedFile.ContentLength;
                if(extension == ".jpg" || extension == ".png" || extension == ".jpeg")
                {
                    if(length <= 1000000)
                    {
                        FileUpload1.SaveAs(path + fileName);
                        string name = "images/" + fileName;

                        string query = "Insert into Images values(@img)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@img", name);
                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if(a  > 0)
                        {
                            Label1.Text = "Inserted Successfully";
                            Label1.ForeColor = Color.Green;
                            Label1.Visible = true;
                            GetImage();
                        } else
                        {
                            Label1.Text = "Inserted failed";
                            Label1.ForeColor = Color.Red;
                            Label1.Visible = true;
                        }
                    } else
                    {
                        Label1.Text = "The images size should not be greater than 1MB";
                        Label1.ForeColor = Color.Red;
                        Label1.Visible = true;
                    }
                } else
                {
                    Label1.Text = "Image Format not supported";
                    Label1.ForeColor = Color.Red;
                    Label1.Visible = true;
                }

            }
        }

        protected void GetImage()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select * from Images";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}