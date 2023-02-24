<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="giadinhthoxinh1.Review" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/component.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="wrap">
        <div class="show-list">
            <h1 class="title">Danh sách</h1>
            <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False"  Width="460px">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="ReviewID" runat="server" Text='<%# Eval("PK_iReviewID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <asp:Label ID="productID" runat="server" Text='<%# Eval("FK_iProductID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Account ID">
                        <ItemTemplate>
                            <asp:Label ID="accountID" runat="server" Text='<%# Eval("FK_iAccountID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Số sao">
                        <ItemTemplate>
                            <asp:Label ID="starRate" runat="server" Text='<%# Eval("iStarRating") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Trạng thái">
                        <ItemTemplate>
                            <asp:Label ID="categoryState" runat="server" Text='<%# Eval("dtReviewTime") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="func">
            <div class="form-func">
                <p>
                    <span class="label">Mã review:</span>
                    <asp:TextBox ID="txtReviewID" runat="server" Enabled="false" Width="184px"></asp:TextBox>
                </p>
                <p>
                    <span class="label">Mã sản phẩm:</span>
                    <asp:TextBox ID="txtProductID" runat="server" Width="184px"></asp:TextBox>
                </p>
                <p>
                    <span class="label">Mã tài khoản:</span>
                    <asp:TextBox ID="txtAccount" runat="server" Width="184px"></asp:TextBox>
                </p>
                <p>
                    <span class="label">Số sao:</span>
                    <asp:TextBox ID="txtStarRating" runat="server" Width="184px"></asp:TextBox>
                </p>
                <p>
                    <span class="label">Số sao:</span>
                    <asp:Timer ID="Timer1" runat="server"></asp:Timer>
                </p>
                <p class="lblNotify">
                    <asp:Label ID="lblNotify" runat="server" Text="" ForeColor="blue"></asp:Label>
                </p>

                <p class="error-message">
                    <asp:ValidationSummary ID="sumResgister" runat="server" ValidationGroup="checkGroup" HeaderText="" ForeColor="Red" Width="300px" Style="margin-left: 50px" />
                </p>

                <div class="form-btn">
                    <asp:Button ID="btnAdd" class="btn" runat="server" Text="Thêm" Enabled=" false" OnClick="btnAdd_Click" ValidationGroup="checkGroup" />
                    <asp:Button ID="btnUpdate" class="btn" runat="server" Text="Sửa" Enabled=" false" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnDel" class="btn" runat="server" Text="Xóa" Enabled=" false" OnClick="btnDel_Click" />
                    <asp:Button ID="btnReset" class="btn" runat="server" Text="Reset" OnClick="btnReset_Click" Enabled=" false" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
