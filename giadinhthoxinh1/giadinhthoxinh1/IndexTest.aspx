<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="IndexTest.aspx.cs" Inherits="giadinhthoxinh1.IndexTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/index.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1"
        runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="lstitem">
                <div class="cho1caiten" style="">
                    <div class="danhmuc_title">
                        <p>DANH MỤC SẢN PHẨM</p>
                    </div>
                    <%--<div class="cho2caiten" style="text-align: right; padding-right: 10px;">--%>
                    <%--                        <asp:DropDownList ID="ddlHang" Style="margin-bottom: -10px;"
                            runat="server"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlHang_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:DropDownList ID="DropDownList1" Style="margin-bottom: -10px;"
                            runat="server"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="Sắp xếp"></asp:ListItem>
                            <asp:ListItem Value="ASC" Text="Tăng dần"></asp:ListItem>
                            <asp:ListItem Value="DESC" Text="Giảm dần"></asp:ListItem>
                            <asp:ListItem Value="SELL_DESC" Text="Bán chạy"></asp:ListItem>
                        </asp:DropDownList>--%>
                    <%--</div>--%>

                    <asp:Repeater ID="grvData" runat="server">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="item">
                                <a class="item-detail">
                                    <image class="image-item" src="<%# Eval("sImage") %>"></image>
                                </a>
                                <a class="item-detail">
                                    Size: <asp:Label ID="Label1" runat="server" Text='<%# Eval("FK_iProductID") %>'></asp:Label>
                                </a>
                                <a class="item-detail itemPrice">
                                    Giá: <asp:Label ID="Label2" runat="server" Text='<%# Eval("iState") %>'></asp:Label>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>


                <div style="background: linear-gradient(90deg,#ffecd2 0%,#fcb69f 100%); margin-bottom: 20px; border-radius: 0.5rem!important;">
                    <div class="danhmuc_title">
                        <p style="color: black;">BÌNH LUẬN NHIỀU</p>
                    </div>

                    <asp:Repeater ID="grvData_Binhluan" runat="server">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="item">
                                <a class="image-item1">
                                    <image class="image-item" src="<%# Eval("sImage") %>"></image>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
