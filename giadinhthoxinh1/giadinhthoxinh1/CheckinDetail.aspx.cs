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
    public partial class CheckinDetail : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable productTable = GetProduct();//table lấy sản phẩm
                rptProduct.DataSource = productTable;
                rptProduct.DataBind();
                foreach (DataRow row in productTable.Rows)
                {
                    drlProductName.Items.Add(new ListItem(row["sProductName"].ToString(), row["PK_iProductID"].ToString()));
                }

                rptProduct.DataSource = productTable;
                rptProduct.DataBind();
                ShowList();
                AddEnable();
            }
            ShowList();
            AddEnable();
        }

        private DataTable GetProduct()//table lấy sản phẩm
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "pro_getProduct";
                    DataTable dt = new DataTable();
                    cnn.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        cnn.Close();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
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
                using (SqlCommand cmd = new SqlCommand("proAddCheckinDetail", cnn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FK_iImportOrderID", txtFKImportOrderID.Text);
                    cmd.Parameters.AddWithValue("@FK_iProductID", drlProductName.SelectedValue);
                    cmd.Parameters.AddWithValue("@iQuatity", txtQuatity.Text);
                    cmd.Parameters.AddWithValue("@iPrice", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@iTotalMoney", txtTotalMoney.Text);

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
                using (SqlCommand Cmd = new SqlCommand("select * from tblCheckinDetail", Cnn))
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
            Label checkinDetailID = (Label)dgv.SelectedRow.FindControl("checkinDetailID");
            Label importOrderID = (Label)dgv.SelectedRow.FindControl("importOrderID");
            Label productID = (Label)dgv.SelectedRow.FindControl("productID");
            Label quatity = (Label)dgv.SelectedRow.FindControl("quatity");
            Label price = (Label)dgv.SelectedRow.FindControl("price");
            Label totalMoney = (Label)dgv.SelectedRow.FindControl("totalMoney");


            txtCheckinDetailID.Text = checkinDetailID.Text.ToString();
            txtFKImportOrderID.Text = importOrderID.Text.ToString();
            drlProductName.SelectedValue = productID.Text.ToString();
            txtQuatity.Text = quatity.Text.ToString();
            txtPrice.Text = price.Text.ToString();
            txtTotalMoney.Text = totalMoney.Text.ToString();
            UpDateDelEnalble();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proUpdateCheckinDetail", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iCheckinDetailID", txtCheckinDetailID.Text);
                    cmd.Parameters.AddWithValue("@FK_iImportOrderID", txtFKImportOrderID.Text);
                    cmd.Parameters.AddWithValue("@FK_iProductID", drlProductName.SelectedValue);
                    cmd.Parameters.AddWithValue("@iQuatity", txtQuatity.Text);
                    cmd.Parameters.AddWithValue("@iPrice", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@iTotalMoney", txtTotalMoney.Text);

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
                using (SqlCommand cmd = new SqlCommand("proDeleteCheckinDetail", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iCheckinDetailID", txtCheckinDetailID.Text);

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
            txtCheckinDetailID.Text = txtFKImportOrderID.Text = txtQuatity.Text = txtPrice.Text = txtTotalMoney.Text = "";
            AddEnable();
        }
    }
}