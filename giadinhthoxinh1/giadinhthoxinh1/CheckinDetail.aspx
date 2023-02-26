<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckinDetail.aspx.cs" Inherits="giadinhthoxinh1.CheckinDetail" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/component.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="show-list">
            <h1 class="title">Danh sách</h1>
            <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" OnRowDataBound="dgvCategory_RowDataBound" DataKeyNames="PK_iCheckinDetailID" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" Width="460px">
                <Columns>
                    <asp:TemplateField HeaderText="Mã chi tiết hóa đơn nhập">
                        <ItemTemplate>
                            <asp:Label ID="checkinDetailID" runat="server" Text='<%# Eval("PK_iCheckinDetailID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã đơn nhập">
                        <ItemTemplate>
                            <asp:Label ID="importOrderID" runat="server" Text='<%# Eval("FK_iImportOrderID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã sản phẩm">
                        <ItemTemplate>
                            <asp:Label ID="productID" runat="server" Text='<%# Eval("FK_iProductID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Số lượng">
                        <ItemTemplate>
                            <asp:Label ID="quatity" runat="server" Text='<%# Eval("iQuatity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Giá">
                        <ItemTemplate>
                            <asp:Label ID="price" runat="server" Text='<%# Eval("iPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Thành tiền">
                        <ItemTemplate>
                            <asp:Label ID="totalMoney" runat="server" Text='<%# Eval("iTotalMoney") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

        <div class="func">
            <div class="form-func">
                <p>
                    <span class="label">Mã chi tiết hóa đơn nhập:</span>
                    <asp:TextBox ID="txtCheckinDetailID" runat="server" Enabled="false" Width="184px"></asp:TextBox>
                </p>

                <p>
                    <span class="label">Mã đơn nhập:</span>
                    <asp:TextBox ID="txtFKImportOrderID" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtFKImportOrderID" ErrorMessage="Mã đơn nhập không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>

<%--                <p>
                    <span class="label">Mã sản phẩm:</span>
                    <asp:TextBox ID="txtFKProductID" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reState" runat="server" ControlToValidate="txtFKProductID" ErrorMessage="Mã sản phẩm không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>--%>
                
                <p>
                    <asp:Repeater runat="server" ID="rptProduct">
                        <ItemTemplate>
                            <p>
                                <a class="product-name" href="<%#Eval("sProductName")%>"></a>
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>
                </p>

                <p>
                    <span class="label">Tên sản phẩm:</span>
                    <asp:DropDownList ID="drlProductName" runat="server"></asp:DropDownList>

                </p>

                <p>
                    <span class="label">Số lượng:</span>
                    <asp:TextBox ID="txtQuatity" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuatity" ErrorMessage="Số lượng không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <span class="label">Giá:</span>
                    <asp:TextBox ID="txtPrice" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Giá không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <span class="label">Thành tiền:</span>
                    <asp:TextBox ID="txtTotalMoney" runat="server" Width="184px"></asp:TextBox>
<%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtState" ErrorMessage="Thành tiền không được bỏ trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>--%>
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
