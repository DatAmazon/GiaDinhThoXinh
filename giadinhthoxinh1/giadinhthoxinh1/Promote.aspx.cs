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
    public partial class Promote : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proAddPromote", cnn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sPromoteName", txtpromoteID.Text);
                    cmd.Parameters.AddWithValue("@sPromoteRate", txtPromoteRate.Text);
                    cmd.Parameters.AddWithValue("@dtStartDay", txtStartDay.Text);
                    cmd.Parameters.AddWithValue("@dtEndDay", txtEndDay.Text);


                    cnn.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i == 0)
                    {
                        lblNotify.Text = "Thêm thất bại";
                        lblNotify.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblNotify.Text = "Thêm thành công";
                    }
                    cnn.Close();
                }
            }
            ShowList();
            Reset();
        }

        public void ShowList()
        {
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("select * from tblPromote", Cnn))
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

        protected void dgvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.Header:
                    break;
                case DataControlRowType.DataRow:
                    e.Row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(this.dgv, "Select$" + e.Row.RowIndex));
                    break;
            }
        }

        protected void dgvCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label promoteID = (Label)dgv.SelectedRow.FindControl("promoteID");
            Label promoteName = (Label)dgv.SelectedRow.FindControl("promoteName");
            Label promoteRate = (Label)dgv.SelectedRow.FindControl("promoteRate");
            Label dtStartDay = (Label)dgv.SelectedRow.FindControl("dtStartDay");
            Label dtEndDay = (Label)dgv.SelectedRow.FindControl("dtEndDay");

            txtpromoteID.Text = promoteID.Text.ToString();
            txtPromoteName.Text = promoteName.Text.ToString();
            txtPromoteRate.Text = promoteRate.Text.ToString();
            txtStartDay.Text = dtStartDay.Text.ToString();
            txtEndDay.Text = dtEndDay.Text.ToString();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proUpdatePromote", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iPromoteID", txtpromoteID.Text);
                    cmd.Parameters.AddWithValue("@sPromoteName", txtpromoteID.Text);
                    cmd.Parameters.AddWithValue("@sPromoteRate", txtPromoteRate.Text);
                    cmd.Parameters.AddWithValue("@dtStartDay", DateTime.Parse(txtStartDay.Text));
                    cmd.Parameters.AddWithValue("@dtEndDay", DateTime.Parse(txtEndDay.Text));
                    

                    cnn.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i == 0)
                    {
                        lblNotify.Text = "Sửa thất bại";
                        lblNotify.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblNotify.Text = "Sửa thành công";
                    }
                    cnn.Close();
                }
            }
            ShowList();
            Reset();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proDeletePromote", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iPromoteID", txtpromoteID.Text);

                    cnn.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i == 0)
                    {
                        lblNotify.Text = "Xóa thất bại";
                        lblNotify.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblNotify.Text = "Xóa thành công";
                    }
                    cnn.Close();

                }
            }
            ShowList();
            Reset();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }
        public void Reset()
        {
            txtpromoteID.Text = txtPromoteName.Text = txtPromoteRate.Text = txtStartDay.Text = txtEndDay.Text = "";

        }

    }
}