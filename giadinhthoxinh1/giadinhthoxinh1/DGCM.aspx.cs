using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace giadinhthoxinh1
{
    public partial class DGCM : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dgcm"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            layDSSV();
        }
        public void layDSSV()
        {
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("select * from tblsinhvien", Cnn))
                {
                    Cmd.CommandType = CommandType.Text;
                    Cnn.Open();
                    using (SqlDataReader reader = Cmd.ExecuteReader())
                    {
                        dgv.DataSource = reader;
                        dgv.DataBind();

                    }
                    Cnn.Close();
                }
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "themSV";
                    cmd.Parameters.AddWithValue("@PK_MaSV", txtID.Text);
                    cmd.Parameters.AddWithValue("@Hoten_sv", txtName.Text);
                 

                    cmd.Parameters.AddWithValue("@Gioitinh_sv", txtGioiTinh.Text);
                    cmd.Parameters.AddWithValue("@Tenlop_sv", txtlop.Text);
                    //if (CheckBox1.Checked)
                    //{
                    //    cmd.Parameters.AddWithValue("@Devo", true);
                    //}
                    //else
                    //{
                    //    cmd.Parameters.AddWithValue("@Devo", false);
                    //}

                    cnn.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i == 0)
                    {
                        Label1.Text = "Thêm thất bại";
                    }
                    else
                    {
                        Label1.Text = "Thêm thành công";
                    }
                    cnn.Close();

                }
            }
            layDSSV();
        }
    }
}