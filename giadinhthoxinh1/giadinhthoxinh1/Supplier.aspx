<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="giadinhthoxinh1.Supplier" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/component.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--    <asp:ScriptManager ID="ScriptManager1"
        runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <ContentTemplate>--%>

            <div class="wrap">
                <div class="show-list">
                    <h1 class="title">Danh sách</h1>
                    <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" OnRowDataBound="dgvCategory_RowDataBound" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" Width="460px">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="supplierID" runat="server" Text='<%# Eval("PK_iSupplierID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Tên NCC">
                                <ItemTemplate>
                                    <asp:Label ID="supplierName" runat="server" Text='<%# Eval("sSupplierName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="SĐT">
                                <ItemTemplate>
                                    <asp:Label ID="supplierPhone" runat="server" Text='<%# Eval("sPhone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="supplierEmail" runat="server" Text='<%# Eval("sEmail") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Địa chỉ">
                                <ItemTemplate>
                                    <asp:Label ID="supplierAddress" runat="server" Text='<%# Eval("sAddress") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="func">
                    <div class="form-func">
                        <p>
                            <span class="label">Mã:</span>
                            <asp:TextBox ID="txtSupplierID" runat="server" Enabled="false" Width="184px"></asp:TextBox>
                        </p>

                        <p>
                            <span class="label">Tên NCC:</span>
                            <asp:TextBox ID="txtSupplierName" runat="server" Width="184px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSupplierName" ErrorMessage="Tên danh mục không được bỏ trống"
                                ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                        </p>

                        <p>
                            <span class="label">SĐT:</span>
                            <asp:TextBox ID="txtSupplierPhone" runat="server" Width="184px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSupplierPhone" ErrorMessage="Tên danh mục không được bỏ trống"
                                ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                        </p>

                        <p>
                            <span class="label">Email:</span>
                            <asp:TextBox ID="txtSupplierEmail" runat="server" Width="184px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSupplierEmail" ErrorMessage="Tên danh mục không được bỏ trống"
                                ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                        </p>

                        <p>
                            <span class="label">Địa chỉ:</span>
                            <asp:TextBox ID="txtSupplierAddress" runat="server" Width="184px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSupplierAddress" ErrorMessage="Tên danh mục không được bỏ trống"
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

<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
