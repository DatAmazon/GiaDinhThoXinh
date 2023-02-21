<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Image1.aspx.cs" Inherits="giadinhthoxinh1.Image" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .wrap {
            display: flex;
            width: 100%;
            height: 600px;
        }

        .show-list {
            padding: 10px;
            background-color: #e0ffff;
            flex: 1;
            height: 100%;
        }

        .func {
            flex: 1;
            height: 100%;
            background-color: antiquewhite;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-func {
            border: 1px solid #0c9c14;
            padding: 10px;
            margin: auto;
            border-radius: 2px;
        }

        p {
            margin: 20px auto;
        }

        .form-btn {
            /*width: 80%;*/
            display: flex;
            justify-content: space-evenly;
            margin: auto;
        }

        .btn {
            width: 60px;
            background-color: #219ebc;
            border: none;
            padding: 4px 12px;
            border-radius: 2px;
        }

        .lblNotify {
            margin: 10px auto;
            text-align: center;
        }

        .title {
            text-align: center;
            margin: 30px auto;
            font-size: 24px;
        }
        .label{
            display: inline-block;
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="show-list">
            <h1 class="title">Danh sách</h1>
            <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" OnRowDataBound="dgvCategory_RowDataBound" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" Width="260px"></asp:GridView>
        </div>

        <div class="func">
            <div class="form-func">
                <p>
                    <span class="label">Mã danh mục:</span>
                        <asp:TextBox ID="txtCategoryID" runat="server" Enabled="false" Width="184px"></asp:TextBox>
                </p>
                <p>
                    <span class="label">Tên danh mục:</span>
                <asp:TextBox ID="txtCategoryName" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtCategoryName" ErrorMessage="Tên danh mục không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p class="lblNotify">
                    <asp:Label ID="lblNotify" runat="server" Text="" ForeColor="blue"></asp:Label>
                </p>

                <p class="error-message">
                    <asp:ValidationSummary ID="sumResgister" runat="server" ValidationGroup="checkGroup" HeaderText="" ForeColor="Red" Width="300px" Style="margin-left: 50px" />
                </p>


                <div class="form-btn">
                    <asp:Button ID="btnAdd" class="btn" runat="server" Text="Thêm" OnClick="btnAdd_Click" ValidationGroup="checkGroup" />
                    <asp:Button ID="btnUpdate" class="btn" runat="server" Text="Sửa" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnDel" class="btn" runat="server" Text="Xóa" OnClick="btnDel_Click" />
                    <asp:Button ID="btnReset" class="btn" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
