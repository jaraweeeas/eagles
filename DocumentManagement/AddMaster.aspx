<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddMaster.aspx.vb" Inherits="DocumentManagement.AddMaster" %>
<link href="Content/DocCss.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
 
    </style>
    </head>
<body class="bg">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server"  width="1024px" CssClass="bg">
            <table  class="table-info" style="width:885px; height: 237px;" >

              <tr class="menutab">
                  <td class="menutab" colspan="2" style="height:35px" >
                  <asp:ImageButton ID="ImageSavebtn" runat="server" height="40px" style="margin-right:7px" ImageAlign="Right" ImageUrl="~/Images/save.png" ToolTip="Save" />
                  <asp:ImageButton ID="ImageNewbtn" runat="server" height="40px" style="margin-right:10px" ImageUrl="~/Images/new.png" ImageAlign="Right" ToolTip="New" />
                  <asp:Label ID="Label3" runat="server" Text="Label" >add master</asp:Label>
                  </td>
              </tr>
                <tr>
                   <td  colspan="2" style="height:10px"  >
                </tr>

                <tr >
                    <td style="text-align:center; " class="auto-style4" >MASTER TYPE&nbsp;&nbsp;&nbsp;
                    
                        <asp:DropDownList ID="ddlmastertype" runat="server" Style="text-align:center" Height="24px" Width="182px" AppendDataBoundItems="True">
                            <asp:ListItem>ที่จัดเก็บ</asp:ListItem>
                            <asp:ListItem>หมวดหมู่</asp:ListItem>
                        </asp:DropDownList>
                    </td>

                    <td  style="text-align:center">MASTER NAME&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtmastername" runat="server"  Height="24px" Width="182px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br /><br />
        <asp:Panel ID="Panel2" runat="server"  width="805px" Cssclass="table-info"  > 
            <table style="width:805px; " class="menutab">
                <tr ><td>
            <asp:Label ID="Label2" runat="server" Text="Labe2" >view master</asp:Label>
                    <asp:ImageButton ID="ImageNextbtn2" runat="server" height="40px" style="margin-right:10px" ImageUrl="~/Images/next2.png" ImageAlign="Right" ToolTip="Forward" />
                    <asp:ImageButton ID="ImageNextbtn" runat="server" height="40px" style="margin-right:7px" ImageAlign="Right" ImageUrl="~/Images/next.png" ToolTip="Next" />
                    <asp:ImageButton ID="ImageBackbtn" runat="server" height="40px" style="margin-right:10px" ImageUrl="~/Images/back.png" ImageAlign="Right" ToolTip="Back" OnClientClick="this.disabled=true;" />
                    <asp:ImageButton ID="ImageBackbtn2" runat="server" height="40px" style="margin-right:10px" ImageUrl="~/Images/back2.png" ImageAlign="Right" ToolTip="Backward" />
                    </td>
                   </tr>
                </table>
            <br /><br /><br />
        <asp:GridView ID="myGridView" runat="server" AutoGenerateColumns="False" Width="678px"  CssClass="tablestyle"  DataKeyNames="Name" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="20" >
            <AlternatingRowStyle CssClass="altrowstyle" />
            <HeaderStyle CssClass="headerstyle" />
            <RowStyle CssClass="rowstyle" />

            <Columns>
                      <asp:TemplateField HeaderText="ลำดับที่">
                      <ItemStyle HorizontalAlign="Center" Width="60px" />
                      <HeaderStyle HorizontalAlign="Center" /><ItemTemplate><%#Container.DataItemIndex+1%> </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="Name" HeaderText="ชื่อ Master" SortExpression="Name" >
                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Type" HeaderText="ประเภท" SortExpression="Type" >
                      <ItemStyle HorizontalAlign="Center" Width="110px" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Userby" HeaderText="ผู้บันทึก" SortExpression="Userby" >
                      <ItemStyle HorizontalAlign="Center" Width="110px" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Userdate" DataFormatString="{0:d}" HeaderText="วันที่บันทึก" SortExpression="Userdate" >
                      <ItemStyle HorizontalAlign="Center" Width="100px" />
                      </asp:BoundField>
            </Columns>
                        </asp:GridView>
       
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:D_ConnectionString %>" SelectCommand="SELECT * FROM [M_Document] ORDER BY [Userdate] DESC"></asp:SqlDataSource>
       
        </asp:Panel>
    </form>
</body>
</html>
