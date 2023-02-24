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
    public partial class ImportOrder : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("proAddImportOrder", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FK_iAccountID", txtFKAccountID.Text);
                    cmd.Parameters.AddWithValue("@FK_iSupplierID", txtFKSupplierID.Text);
                    cmd.Parameters.AddWithValue("@dtDateAdded", txtDateAdded.Text);
                    cmd.Parameters.AddWithValue("@sDeliver", txtDeliver.Text);
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
                using (SqlCommand Cmd = new SqlCommand("select * from tblImportOrder", Cnn))
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
            Label importOrderID = (Label)dgv.SelectedRow.FindControl("importOrderID");
            Label FKAccountID = (Label)dgv.SelectedRow.FindControl("FKAccountID");
            Label FKSupplierID = (Label)dgv.SelectedRow.FindControl("FKSupplierID");
            Label dtDateAdded = (Label)dgv.SelectedRow.FindControl("dtDateAdded");
            Label deliver = (Label)dgv.SelectedRow.FindControl("deliver");

            txtImportOrderID.Text = importOrderID.Text.ToString();
            txtFKAccountID.Text = FKAccountID.Text.ToString();
            txtFKSupplierID.Text = FKSupplierID.Text.ToString();
            txtDateAdded.Text = dtDateAdded.Text.ToString();
            txtDeliver.Text = deliver.Text.ToString();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proUpdateImportOrder", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iImportOrderID", txtImportOrderID.Text);
                    cmd.Parameters.AddWithValue("@FK_iAccountID", txtFKAccountID.Text);
                    cmd.Parameters.AddWithValue("@FK_iSupplierID", txtFKSupplierID.Text);
                    cmd.Parameters.AddWithValue("@dtDateAdded", txtDateAdded.Text);
                    cmd.Parameters.AddWithValue("@sDeliver", txtDeliver.Text);


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
                using (SqlCommand cmd = new SqlCommand("proDeleteImportOrder", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iImportOrderID", txtImportOrderID.Text);

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
            txtImportOrderID.Text = txtFKAccountID.Text = txtFKSupplierID.Text = txtDateAdded.Text = txtDeliver.Text = "";
        }

    }
}