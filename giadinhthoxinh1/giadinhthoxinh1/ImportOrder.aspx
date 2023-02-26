<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ImportOrder.aspx.cs" Inherits="giadinhthoxinh1.ImportOrder" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/component.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="show-list">
            <h1 class="title">Danh sách</h1>
            <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" OnRowDataBound="dgvCategory_RowDataBound" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" Width="460px">
                <Columns>
                    <asp:TemplateField HeaderText="Mã đơn nhập">
                        <ItemTemplate>
                            <asp:Label ID="importOrderID" runat="server" Text='<%# Eval("PK_iImportOrderID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã NV nhận hàng:">
                        <ItemTemplate>
                            <asp:Label ID="FKAccountID" runat="server" Text='<%# Eval("FK_iAccountID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã nhà cung cấp">
                        <ItemTemplate>
                            <asp:Label ID="FKSupplierID" runat="server" Text='<%# Eval("FK_iSupplierID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ngày thêm">
                        <ItemTemplate>
                            <asp:Label ID="dtDateAdded" runat="server" Text='<%# Eval("dtDateAdded") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Người giao">
                        <ItemTemplate>
                            <asp:Label ID="deliver" runat="server" Text='<%# Eval("sDeliver") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--                    <asp:TemplateField HeaderText="Người nhận">
                        <ItemTemplate>
                            <asp:Label ID="receiver" runat="server" Text='<%# Eval("sReceiver") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>
        </div>

        <div class="func">
            <div class="form-func">
                <p>
                    <span class="label">Mã đơn nhập:</span>
                    <asp:TextBox ID="txtImportOrderID" runat="server" Enabled="false" Width="184px"></asp:TextBox>
                </p>

<%--                <p>
                    <span class="label">NV nhận:</span>
                    <asp:TextBox ID="txtFKAccountID" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtFKAccountID" ErrorMessage="Người nhận không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>--%>

                <p>
                    <asp:Repeater runat="server" ID="rptReceiver">
                        <ItemTemplate>
                            <p>
                                <a class="receiver-name" href="<%#Eval("sUserName")%>"></a>
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>
                </p>

                <p>
                    <span class="label">NV nhận hàng:</span>
                    <asp:DropDownList ID="drlReceiver" runat="server"></asp:DropDownList>
                </p>

<%--                <p>
                    <span class="label">Mã nhà cung cấp:</span>
                    <asp:TextBox ID="txtFKSupplierID" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reState" runat="server" ControlToValidate="txtFKSupplierID" ErrorMessage="Nhà cung cấp không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>--%>

                <p>
                    <asp:Repeater runat="server" ID="rptSupplier">
                        <ItemTemplate>
                            <p>
                                <a class="supplier-name" href="<%#Eval("sSupplierName")%>"></a>
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>
                </p>

                <p>
                    <span class="label">Chọn NCC:</span>
                    <asp:DropDownList ID="drlSupplier" runat="server"></asp:DropDownList>
                </p>

                <p>
                    <span class="label">Ngày thêm:</span>

                    <asp:TextBox ID="txtDateAdded" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDateAdded" ErrorMessage="Ngày thêm không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <span class="label">Người giao:</span>
                    <asp:TextBox ID="txtDeliver" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDeliver" ErrorMessage="Người giao hàng không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
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
