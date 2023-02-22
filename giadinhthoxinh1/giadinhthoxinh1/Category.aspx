<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="giadinhthoxinh1.DanhMuc" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/component.css" />
    <style>
    </style>
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

                    <asp:GridView ID="dgvCategory" runat="server" AutoGenerateColumns="False" OnRowDataBound="dgvCategory_RowDataBound" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" Width="260px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="categoryID" runat="server" Text='<%# Eval("PK_iCategoryID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Tên danh mục">
                                <ItemTemplate>
                                    <asp:Label ID="categoryName" runat="server" Text='<%# Eval("sCategoryName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

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

                        <asp:ValidationSummary ID="sumResgister" runat="server" ValidationGroup="checkGroup" HeaderText="" ForeColor="Red" Width="300px" Style="margin-left: 50px" />

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


<%--                      tại sao thế ô nhỉ
                            khi refesh page, nó coi như là gửi submit, nên nó auto click cái button. 
                            cái button ông click đấy, giờ thử cái clear cache xem dc k, vì dữ liệu trước khi ông submit được lưu lại.
                            => ok ô nha --%>
