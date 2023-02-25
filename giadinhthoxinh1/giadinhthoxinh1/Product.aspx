<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="giadinhthoxinh1.Product" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/component.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrap">
        <div class="show-list">
            <h1 class="title">Danh sách</h1>
            <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" OnRowDataBound="dgvCategory_RowDataBound" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" Width="460px">
                <Columns>
                    <asp:TemplateField HeaderText="Mã sản phẩm">
                        <ItemTemplate>
                            <asp:Label ID="productID" runat="server" Text='<%# Eval("PK_iProductID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã danh mục">
                        <ItemTemplate>
                            <asp:Label ID="categoryID" runat="server" Text='<%# Eval("FK_iCategoryID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã khuyến mãi">
                        <ItemTemplate>
                            <asp:Label ID="promoteID" runat="server" Text='<%# Eval("FK_iPromoteID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tên sản phẩm">
                        <ItemTemplate>
                            <asp:Label ID="productName" runat="server" Text='<%# Eval("sProductName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Giá">
                        <ItemTemplate>
                            <asp:Label ID="price" runat="server" Text='<%# Eval("iPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mô tả">
                        <ItemTemplate>
                            <asp:Label ID="describle" runat="server" Text='<%# Eval("sDescribe") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Màu sắc">
                        <ItemTemplate>
                            <asp:Label ID="color" runat="server" Text='<%# Eval("sColor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Size">
                        <ItemTemplate>
                            <asp:Label ID="size" runat="server" Text='<%# Eval("sSize") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

        <div class="func">
            <div class="form-func">
                <p>
                    <span class="label">Mã sản phẩm:</span>
                    <asp:TextBox ID="txtProductID" runat="server" Enabled="false" Width="184px"></asp:TextBox>
                </p>
                <p>
                    <span class="label">Mã danh mục:</span>
                    <asp:TextBox ID="txtCategoryID" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtCategoryID" ErrorMessage="Mã danh mục không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <span class="label">Mã khuyến mãi:</span>
                    <asp:TextBox ID="txtPromoteID" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reState" runat="server" ControlToValidate="txtPromoteID" ErrorMessage="Mã khuyến mãi không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <span class="label">Tên sản phẩm:</span>
                    <asp:TextBox ID="txtProductName" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductName" ErrorMessage="Tên sản phẩm không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <span class="label">Giá:</span>
                    <asp:TextBox ID="txtPrice" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Giá không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <span class="label">Mô tả:</span>
                    <asp:TextBox ID="txtDescrible" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescrible" ErrorMessage="Mô tả không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <span class="label">Màu sắc:</span>
                    <asp:TextBox ID="txtColor" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtColor" ErrorMessage="Màu sắc không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <span class="label">Size:</span>
                    <asp:TextBox ID="txtSize" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSize" ErrorMessage="Size không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
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
