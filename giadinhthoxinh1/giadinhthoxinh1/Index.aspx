<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="giadinhthoxinh1.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/index.css" />

    <style>
        html {
            width: 100vw;
            height: 100vh;
        }

        .body {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .total {
            width: 1200px;
            height: 190vh;
            margin: auto;
            background-color: #ffd4f4;
            display: flex;
            justify-content: space-between;
        }

        .sidebar {
            width: 190px;
            height: 100vh;
            /*background-color: #87dce1;*/
            display: inline-block;
        }

        .categories-select {
            margin-top: 20px;
            padding: 4px;
            background-color: blueviolet;
            border-radius: 3px;
            color: white;
        }
        /*        .product-are {
            width: 990px;
            height: 100vh;
            background-color: #fff4ba;
            display: inline-block;
        }*/

        /*        .row-product {
            width: 300px;
            height: 300px;
            background-color: aliceblue;
        }*/

        /*        .product-item {
            width: 300px;
            height: 300px;
            background-color: aliceblue;
        }*/

        .image-item {
            width: 180px;
            height: 240px;
            object-fit: contain;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="total">
            <div class="sidebar">
                <div class="categories-select">
                    <p style="font-size: 20px; width: 190px;">Danh mục</p>
                </div>
            </div>
            <div class="product-are">
                <div class="row-product">
                    <div class="product-item">
                        <%--                            <asp:Repeater runat="server" ID="rptProductItem" OnItemDataBound="rptProductItem_ItemDataBound">
                                <ItemTemplate>
                                    <a>
                                        <image class="image-item" src="<%# Eval("sImage") %>"></image>
                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>--%>

                        <div class="lstitem">
                            <div class="cho1caiten" style="">
                                <%--                <div class="danhmuc_title">
                                        <p>DANH MỤC SẢN PHẨM</p>
                                    </div>--%>
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
                                            <a class="item-detail">Size:
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FK_iProductID") %>'></asp:Label>
                                            </a>
                                            <a class="item-detail itemPrice">Giá:
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("iState") %>'></asp:Label>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
