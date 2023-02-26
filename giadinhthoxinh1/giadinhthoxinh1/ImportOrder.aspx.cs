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
            if (!IsPostBack)
            {
                DataTable productTable = GetReceiver();//table lấy sản phẩm
                rptReceiver.DataSource = productTable;
                rptReceiver.DataBind();
                foreach (DataRow row in productTable.Rows)
                {
                    drlReceiver.Items.Add(new ListItem(row["sUserName"].ToString(), row["PK_iAccountID"].ToString()));
                }

                rptReceiver.DataSource = productTable;
                rptReceiver.DataBind();

                DataTable productTable1 = GetSupplier();//table lấy sản phẩm
                rptSupplier.DataSource = productTable1;
                rptSupplier.DataBind();
                foreach (DataRow row in productTable1.Rows)
                {
                    drlSupplier.Items.Add(new ListItem(row["sSupplierName"].ToString(), row["PK_iSupplierID"].ToString()));
                }

                rptSupplier.DataSource = productTable1;
                rptSupplier.DataBind();


            }
            ShowList();
            AddEnable();
        }

        private DataTable GetReceiver()//table lấy sản phẩm
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "pro_getReceiver";
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
        private DataTable GetSupplier()//table lấy sản phẩm
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "pro_getSupplier";
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
                using (SqlCommand cmd = new SqlCommand("proAddImportOrder", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FK_iAccountID", drlReceiver.SelectedValue);
                    cmd.Parameters.AddWithValue("@FK_iSupplierID", drlSupplier.SelectedValue);
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
            if (dgv.SelectedDataKey != null)
            {
                using (SqlConnection cnn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("procSelectImportOrderByID", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@PK_iImportOrderID", dgv.SelectedValue.ToString());
                        cnn.Open();
                        SqlDataReader dataReader = cmd.ExecuteReader();
                        if (dataReader.HasRows)
                        {

                            dataReader.Read();
                            txtImportOrderID.Text = dataReader["PK_iImportOrderID"].ToString();
                            string idReceiver = dataReader["FK_iAccountID"].ToString();
                            foreach (ListItem item in drlReceiver.Items)
                            {
                                if (item.Value.Equals(idReceiver))
                                {
                                    drlReceiver.ClearSelection();
                                    item.Selected = true;
                                    break;
                                }
                            }
                            string idSupplier = dataReader["FK_iSupplierID"].ToString();
                            foreach (ListItem item in drlSupplier.Items)
                            {
                                if (item.Value.Equals(idSupplier))
                                {
                                    drlSupplier.ClearSelection();
                                    item.Selected = true;
                                    break;
                                }
                            }
                            txtDateAdded.Text = dataReader["dtDateAdded"].ToString();
                            txtDeliver.Text = dataReader["sDeliver"].ToString();

                        }
                        cnn.Close();
                    }
                }

            }
            UpDateDelEnalble();
            //Label importOrderID = (Label)dgv.SelectedRow.FindControl("importOrderID");
            //Label FKAccountID = (Label)dgv.SelectedRow.FindControl("FKAccountID");
            //Label FKSupplierID = (Label)dgv.SelectedRow.FindControl("FKSupplierID");
            //Label dtDateAdded = (Label)dgv.SelectedRow.FindControl("dtDateAdded");
            //Label deliver = (Label)dgv.SelectedRow.FindControl("deliver");

            //txtImportOrderID.Text = importOrderID.Text.ToString();
            //drlReceiver.SelectedValue = FKAccountID.Text.ToString();
            //drlSupplier.SelectedValue= FKSupplierID.Text.ToString();
            //txtDateAdded.Text = dtDateAdded.Text.ToString();
            //txtDeliver.Text = deliver.Text.ToString();
            //UpDateDelEnalble();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proUpdateImportOrder", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iImportOrderID", txtImportOrderID.Text);
                    cmd.Parameters.AddWithValue("@FK_iAccountID", drlReceiver.Text);
                    cmd.Parameters.AddWithValue("@FK_iSupplierID", drlSupplier.SelectedValue);
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
            txtImportOrderID.Text = txtDateAdded.Text = txtDeliver.Text = "";
            AddEnable();
        }

    }
}