<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Image.aspx.cs" Inherits="giadinhthoxinh1.Image1" EnableEventValidation="false" %>

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

        .label {
            display: inline-block;
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="show-list">
            <h1 class="title">Danh sách</h1>
            <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" OnRowDataBound="dgvCategory_RowDataBound" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" Width="260px">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="imageID" runat="server" Text='<%# Eval("PK_iImageID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã sản phẩm">
                        <ItemTemplate>
                            <asp:Label ID="categoryID" runat="server" Text='<%# Eval("FK_iProductID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Hình ảnh">
                        <ItemTemplate>
                            <asp:Label ID="Image" runat="server" Text='<%# Eval("sImage") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Trạng thái">
                        <ItemTemplate>
                            <asp:Label ID="imageState" runat="server" Text='<%# Eval("iState") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="func">
            <div class="form-func">
                <p>
                    <span class="label">Mã hình ảnh:</span>
                    <asp:TextBox ID="txtImageID" runat="server" Enabled="false" Width="184px"></asp:TextBox>
                </p>
                <p>
                    <span class="label">Chọn sản phẩm:</span>
                    <asp:Repeater runat="server" ID="rptProduct">
                        <ItemTemplate>
                            <p>
                                <a class="product-name" href="<%#Eval("sProductName")%>"></a>
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>
                </p>

                <p>
                    <span class="label">Chọn sản phẩm:</span>
                    <asp:DropDownList ID="drlProduct" runat="server"></asp:DropDownList>

                </p>
                <p>
                    <span class="label">Chọn ảnh:</span>
                    <asp:FileUpload ID="uploadImage" runat="server" />
                    <asp:RequiredFieldValidator ID="rUpload" runat="server" ControlToValidate="uploadImage" ErrorMessage="Hình ảnh không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <span class="label">Trạng thái:</span>
                    <asp:TextBox ID="txtState" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reState" runat="server" ControlToValidate="txtState" ErrorMessage="Trạng thái không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revState" runat="server" ValidationExpression="^[0-9]+$" Display="None"
                        ControlToValidate="txtState" ErrorMessage="Trạng thái chỉ được là 0 hoặc 1" ForeColor="Red" ValidationGroup="checkGroup"></asp:RegularExpressionValidator>
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
