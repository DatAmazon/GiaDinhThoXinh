<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DanhMuc.aspx.cs" Inherits="giadinhthoxinh1.DanhMuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <p>
            Tên danh mục:
                &nbsp;<asp:TextBox ID="txtCategory" runat="server" Width="184px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtCategory" ErrorMessage="!Tên danh mục không được bỏ trống"
                ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
        </p>
        <asp:Button ID="btnAdd" runat="server" Text="Thêm" />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAdd0" runat="server" Text="Thêm" />
        &nbsp;
            <asp:Button ID="btnAdd1" runat="server" Text="Thêm" />
    </div>
</asp:Content>
