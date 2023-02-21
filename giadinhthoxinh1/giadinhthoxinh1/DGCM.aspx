<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DGCM.aspx.cs" Inherits="giadinhthoxinh1.DGCM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html {
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            /*border-top: 1px solid #000000;*/
        }

        #page {
            margin: auto;
            border-top: 1px solid #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page">
            <h1>Thêm sinh viên</h1>
            <p>
                Mã sinh viên:
                &nbsp;<asp:TextBox ID="txtID" runat="server" Width="184px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtID" ErrorMessage="!Mã danh mục không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
            </p>
            <p>
                Họ tên:
                &nbsp;<asp:TextBox ID="txtName" runat="server" Width="184px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtName" ErrorMessage="!Tên danh mục không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
            </p>
            <p>
                Giới tính:<asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Text="Nam" Value="Nam"></asp:ListItem>
                    <asp:ListItem Text="Nữ" Value="Nu"></asp:ListItem>

                    <%--<asp:RadioButton ID="nam" runat="server">Nam</asp:RadioButton>--%>
                    <%--<asp:RadioButton ID="nữ" runat="server">Nữ</asp:RadioButton>--%>
                </asp:RadioButtonList>
            </p>
            <p>
                Giới tính:
                <asp:TextBox ID="txtGioiTinh" runat="server"></asp:TextBox>
            </p>
            <p>
                Lớp:
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Text="12A1" Value="1">12A1</asp:ListItem>
                    <asp:ListItem Text="12A2" Value="2">12A2</asp:ListItem>
                    <asp:ListItem Text="12A03" Value="3">12A3</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                lớp
                <asp:TextBox ID="txtlop" runat="server"></asp:TextBox>
            </p>


            <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>&nbsp;

            <asp:ValidationSummary ID="sumResgister" runat="server" ValidationGroup="checkGroup" HeaderText="" ForeColor="Red" Width="450px" />



            <asp:Button ID="btnAdd" runat="server" Text="Lưu" OnClick="btnAdd_Click" ValidationGroup="checkGroup" />
            &nbsp;&nbsp;&nbsp;

            <asp:GridView ID="dgv" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
