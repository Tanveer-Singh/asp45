<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StrongTypes.aspx.cs" Inherits="WebApplication1.Controls.StrongTypes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server"
                        ItemType="DataObjects.EmployeModel.Emp"
                        AutoGenerateColumns="False"
                        SelectMethod="GridView1_GetData"
                        UpdateMethod="GridView1_UpdateItem"
                        DeleteMethod="GridView1_DeleteItem"
                        DataKeyNames="ID"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%#:Item.ID %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#:BindItem.Name %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LblName" runat="server" Text='<%#:Item.Name %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>

                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </div>
    </form>
</body>
</html>
