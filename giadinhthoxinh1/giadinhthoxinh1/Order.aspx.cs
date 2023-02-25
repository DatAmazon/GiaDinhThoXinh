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
    public partial class Order : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
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
                using (SqlCommand cmd = new SqlCommand("proAddOrder", cnn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@FK_iAccountID", txtAccountID.Text);
                    cmd.Parameters.AddWithValue("@sCustomerName", txtCustomerName.Text);
                    cmd.Parameters.AddWithValue("@sCustomerPhone", txtCustomerPhone.Text);
                    cmd.Parameters.AddWithValue("@sDeliveryAddress", txtDeliveryAddress.Text);
                    cmd.Parameters.AddWithValue("@dInvoidDate", txtInvoidDate.Text);
                    cmd.Parameters.AddWithValue("@sBiller", txtBiller.Text);
                    cmd.Parameters.AddWithValue("@iState", txtState.Text);
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
                using (SqlCommand Cmd = new SqlCommand("select * from tblOrder", Cnn))
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
            Label orderID = (Label)dgv.SelectedRow.FindControl("orderID");
            Label accountID = (Label)dgv.SelectedRow.FindControl("accountID");
            Label customerName = (Label)dgv.SelectedRow.FindControl("customerName");
            Label customerPhone = (Label)dgv.SelectedRow.FindControl("customerPhone");
            Label deliveryAddress = (Label)dgv.SelectedRow.FindControl("deliveryAddress");
            Label invoidDate = (Label)dgv.SelectedRow.FindControl("invoidDate");
            Label biller = (Label)dgv.SelectedRow.FindControl("biller");
            Label state = (Label)dgv.SelectedRow.FindControl("state");

            txtOrderID.Text = orderID.Text.ToString();
            txtAccountID.Text = accountID.Text.ToString();
            txtCustomerName.Text = customerName.Text.ToString();
            txtCustomerPhone.Text = customerPhone.Text.ToString();
            txtDeliveryAddress.Text = deliveryAddress.Text.ToString();
            txtInvoidDate.Text = invoidDate.Text.ToString();
            txtBiller.Text = biller.Text.ToString();
            txtState.Text = state.Text.ToString();
            UpDateDelEnalble();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proUpdateOrder", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iOrderID", txtOrderID.Text);
                    cmd.Parameters.AddWithValue("@FK_iAccountID", txtAccountID.Text);
                    cmd.Parameters.AddWithValue("@sCustomerName", txtCustomerName.Text);
                    cmd.Parameters.AddWithValue("@sCustomerPhone", txtCustomerPhone.Text);
                    cmd.Parameters.AddWithValue("@sDeliveryAddress", txtDeliveryAddress.Text);
                    cmd.Parameters.AddWithValue("@dInvoidDate", txtInvoidDate.Text);
                    cmd.Parameters.AddWithValue("@sBiller", txtBiller.Text);
                    cmd.Parameters.AddWithValue("@iState", txtState.Text);

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
                using (SqlCommand cmd = new SqlCommand("proDeleteOrder", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iOrderID", txtOrderID.Text);

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
            txtOrderID.Text = txtAccountID.Text = txtCustomerName.Text = txtCustomerPhone.Text = txtDeliveryAddress.Text = txtInvoidDate.Text = txtBiller.Text = txtState.Text = txtOrderID.Text = "";
            AddEnable();
        }

    }
}