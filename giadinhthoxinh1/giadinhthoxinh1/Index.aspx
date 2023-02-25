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
            background-color: azure;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .total {
            width: 1200px;
            height: 100vh;
            margin: auto;
            background-color: #ffd4f4;
            display: flex;
            justify-content: space-between;
        }

        .sidebar {
            width: 190px;
            height: 100vh;
            background-color: #fff9f4;
            display: inline-block;
        }

        .product-are {
            width: 990px;
            height: 100vh;
            background-color: #fff4ba;
            display: inline-block;
        }

        .row-product {
            width: 300px;
            height: 300px;
            background-color: aliceblue;
        }

        .product-item {
            width: 300px;
            height: 300px;
            background-color: aliceblue;
        }

        .image-item {
            width: 180px;
            height: 240px;
            object-fit: cover;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="total">
            <div class="sidebar">
                <div class="categories">
                    <p style="font-size: 20px">Danh mục</p>
                </div>
            </div>
            <div class="product-are">
                <div class="list-product">
                    <div class="row-product">
                        <div class="product-item">
                            <asp:Repeater runat="server" ID="rptProductItem" OnItemDataBound="rptProductItem_ItemDataBound">
                                <ItemTemplate>
                                    <a>
                                        <image class="image-item" src="<%# Eval("sImage") %>"></image>
                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
