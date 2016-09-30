<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ViewMaster.aspx.vb" Inherits="DocumentManagement.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 254px">
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="myGridView" runat="server" AutoGenerateColumns="False" Width="605px" Height="203px" >
                 <Columns>
                      <asp:TemplateField HeaderText="MasterName">
                            <ItemTemplate>
                            <asp:Label ID="lblMasterName" runat="server"></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="MasterType">
                            <ItemTemplate>
                            <asp:Label ID="lblMasterType" runat="server"></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="UserBy">
                            <ItemTemplate>
                            <asp:Label ID="lblUserBy" runat="server"></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="UserDate">
                            <ItemTemplate>
                            <asp:Label ID="lblUserDate" runat="server"></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>  
                     <asp:TemplateField HeaderText="Detail">
                    <ItemTemplate>
                        <asp:HyperLink ID="hplDetail" Text="View" runat="server"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                        </asp:GridView>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add" Height="28px" Width="63px" />
    </div>
    </form>
</body>
</html>
