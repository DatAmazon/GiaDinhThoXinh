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
    public partial class Supplier : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowList();
            AddEnable();
        }
        public void AddEnable()
        {
            btnAdd.Enabled = true;
            btnUpdate.Enabled = false;
            btnDel.Enabled = false;
        }
        public void UpDateDelEnalble()
        {
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
            btnDel.Enabled = true;
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "proAddSupplier";
                    cmd.Parameters.AddWithValue("@sSupplierName", txtSupplierName.Text);
                    cmd.Parameters.AddWithValue("@sPhone", txtSupplierPhone.Text);
                    cmd.Parameters.AddWithValue("@sEmail", txtSupplierEmail.Text);
                    cmd.Parameters.AddWithValue("@sAddress", txtSupplierAddress.Text);

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
                using (SqlCommand Cmd = new SqlCommand("select * from tblSupplier", Cnn))
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
            Label supplierID = (Label)dgv.SelectedRow.FindControl("supplierID");
            Label supplierName = (Label)dgv.SelectedRow.FindControl("supplierName");
            Label supplierPhone = (Label)dgv.SelectedRow.FindControl("supplierPhone");
            Label supplierEmail = (Label)dgv.SelectedRow.FindControl("supplierEmail");
            Label supplierAddress = (Label)dgv.SelectedRow.FindControl("supplierAddress");

            txtSupplierID.Text = supplierID.Text.ToString();
            txtSupplierName.Text = supplierName.Text.ToString();
            txtSupplierPhone.Text = supplierPhone.Text.ToString();
            txtSupplierEmail.Text = supplierEmail.Text.ToString();
            txtSupplierAddress.Text = supplierAddress.Text.ToString();
            UpDateDelEnalble();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "proUpdateSupplier";
                    cmd.Parameters.AddWithValue("@PK_iSupplierID", txtSupplierID.Text);
                    cmd.Parameters.AddWithValue("@sSupplierName", txtSupplierName.Text);
                    cmd.Parameters.AddWithValue("@sPhone", txtSupplierPhone.Text);
                    cmd.Parameters.AddWithValue("@sEmail", txtSupplierEmail.Text);
                    cmd.Parameters.AddWithValue("@sAddress", txtSupplierAddress.Text);

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
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "proDeleteSupplier";
                    cmd.Parameters.AddWithValue("@PK_iSupplierID", txtSupplierID.Text);

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
            txtSupplierID.Text = txtSupplierName.Text = txtSupplierPhone.Text = txtSupplierEmail.Text = txtSupplierAddress.Text = "";
            AddEnable();
        }
    }
}

//cmd.CommandText = "proUpdateSupplier";
//cmd.Parameters.AddWithValue("@PK_iSupplierID", txt.Text);
//cmd.Parameters.AddWithValue("@sSupplierName", txtCategoryName.Text);
//cmd.Parameters.AddWithValue("@sPhone", txtState.Text);
//cmd.Parameters.AddWithValue("@sEmail", txtState.Text);
//cmd.Parameters.AddWithValue("@sAddress", txtState.Text);