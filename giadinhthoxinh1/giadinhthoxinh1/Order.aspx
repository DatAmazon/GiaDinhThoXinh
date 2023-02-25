<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="giadinhthoxinh1.Order" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/component.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="show-list">
            <h1 class="title">Danh sách</h1>
            <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" OnRowDataBound="dgvCategory_RowDataBound" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" Width="460px">
                <Columns>
                    <asp:TemplateField HeaderText="Mã hóa đơn">
                        <ItemTemplate>
                            <asp:Label ID="orderID" runat="server" Text='<%# Eval("PK_iOrderID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mã khách hàng">
                        <ItemTemplate>
                            <asp:Label ID="accountID" runat="server" Text='<%# Eval("FK_iAccountID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên khách hàng">
                        <ItemTemplate>
                            <asp:Label ID="customerName" runat="server" Text='<%# Eval("sCustomerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SĐT khách hàng">
                        <ItemTemplate>
                            <asp:Label ID="customerPhone" runat="server" Text='<%# Eval("sCustomerPhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Địa chỉ giao hàng">
                        <ItemTemplate>
                            <asp:Label ID="deliveryAddress" runat="server" Text='<%# Eval("sDeliveryAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ngày lập hóa đơn">
                        <ItemTemplate>
                            <asp:Label ID="invoidDate" runat="server" Text='<%# Eval("dInvoidDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nhân viên lập">
                        <ItemTemplate>
                            <asp:Label ID="biller" runat="server" Text='<%# Eval("sBiller") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Trạng thái">
                        <ItemTemplate>
                            <asp:Label ID="state" runat="server" Text='<%# Eval("iState") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

        <div class="func">
            <div class="form-func">
                <p>
                    <span class="label">Mã hóa đơn:</span>
                    <asp:TextBox ID="txtOrderID" runat="server" Enabled="false" Width="184px"></asp:TextBox>
                </p>

                <p>
                    <span class="label">Mã khách hàng:</span>
                    <asp:TextBox ID="txtAccountID" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtAccountID" ErrorMessage="Mã khách hàng không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <span class="label">Tên khách hàng:</span>
                    <asp:TextBox ID="txtCustomerName" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reState" runat="server" ControlToValidate="txtCustomerName" ErrorMessage="Tên khách hàng không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <span class="label">SĐT khách hàng:</span>
                    <asp:TextBox ID="txtCustomerPhone" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerPhone" ErrorMessage="SĐT khách hàng không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <span class="label">Địa chỉ giao hàng:</span>
                    <asp:TextBox ID="txtDeliveryAddress" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDeliveryAddress" ErrorMessage="Địa chỉ giao hàng không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <span class="label">Ngày lập hóa đơn:</span>
                    <asp:TextBox ID="txtInvoidDate" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInvoidDate" ErrorMessage="Ngày lập hóa đơn không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <span class="label">Nhân viên lập:</span>
                    <asp:TextBox ID="txtBiller" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBiller" ErrorMessage="Nhân viên lập không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <span class="label">Trạng thái:</span>
                    <asp:TextBox ID="txtState" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtState" ErrorMessage="Trạng thái không được bỏ trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
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
