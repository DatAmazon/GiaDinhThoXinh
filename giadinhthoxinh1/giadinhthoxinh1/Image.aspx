<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Image.aspx.cs" Inherits="giadinhthoxinh1.Image1" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Assets/css/component.css" />
    <script type="text/javascript">
        function ShowPreview(input) {
            if (input.files && input.files[0]) {
                //   var image = document.getElementyId('ContentPlaceHolder1_Image1');
                //   img.src = URL.createObjectURL(event.target.files[0]);
                //  console.log('a');
                var ImageDir = new FileReader();
                ImageDir.onload = function (e) {
                    //Jquery
                    //  $('#ContentPlaceHolder1_Image1').attr('src', e.target.result);
                    var image = document.getElementById('ContentPlaceHolder1_imageShow');
                    image.src = e.target.result;
                }
                ImageDir.readAsDataURL(input.files[0]);
            }
        }
    </script>
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
                    <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" DataKeyNames="PK_iImageID" OnRowDataBound="dgvCategory_RowDataBound" OnSelectedIndexChanged="dgvCategory_SelectedIndexChanged" Width="260px">
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
                            <%--                    <span class="label">Chọn sản phẩm:</span>--%>
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
                            <asp:FileUpload ID="uploadImage" runat="server" onchange="ShowPreview(this)" />
                            <asp:RequiredFieldValidator ID="rUpload" runat="server" ControlToValidate="uploadImage" ErrorMessage="Hình ảnh không được bỏ trống"
                                ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                          
                            <asp:Image class="image-show" ID="imageShow" runat ="server"/>
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
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
