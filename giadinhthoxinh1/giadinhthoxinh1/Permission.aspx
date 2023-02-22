<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Permission.aspx.cs" Inherits="giadinhthoxinh1.Permission" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/component.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1"
        runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="wrap">
                <div class="show-list">
                    <h1 class="title">Danh sách</h1>
                    <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" OnRowDataBound="dgvCategory_RowDataBound" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" Width="260px">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="permissionID" runat="server" Text='<%# Eval("PK_iPermissionID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Tên danh mục">
                                <ItemTemplate>
                                    <asp:Label ID="permissionName" runat="server" Text='<%# Eval("sPermissionName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng thái">
                                <ItemTemplate>
                                    <asp:Label ID="permissionState" runat="server" Text='<%# Eval("iState") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="func">
                    <div class="form-func">
                        <p>
                            <span class="label">Mã quyền:</span>
                            <asp:TextBox ID="txtPermissionID" runat="server" Enabled="false" Width="184px"></asp:TextBox>
                        </p>
                        <p>
                            <span class="label">Tên quyền:</span>
                            <asp:TextBox ID="txtPermissionName" runat="server" Width="184px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtPermissionName" ErrorMessage="Tên quyền không được bỏ trống"
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

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
