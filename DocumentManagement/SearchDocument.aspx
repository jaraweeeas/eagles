<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SearchDocument.aspx.vb" Inherits="DocumentManagement.SearchDocument" %>
<link href="Content/DocCss.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
        .auto-style2 {
            margin-left: 50px;
           
            
        }
        .auto-style3 {
            height: 19px;
        }
        .auto-style4 {
            height: 50px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel3" runat="server" Width="100%" >
            <table style="width: 919px;" class="table-info">
                <tr>
                    <td class="menutab" style="height: 35px">
                        <asp:Label ID="Label4" runat="server" Text="Labe2">search Document</asp:Label>
                        <asp:ImageButton ID="ImageSearchbtn" runat="server" Height="41px" Style="margin-right: 7px" ImageAlign="Right" ImageUrl="~/Images/Searchfile.png" ToolTip="Search" />
                        <asp:ImageButton ID="ImageRefreshbtn" runat="server" Height="41px" Style="margin-right: 7px" ImageAlign="Right" ImageUrl="~/Images/refresh.png" ToolTip="Refresh" />
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label9" runat="server" BorderStyle="None">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;ชื่อ File</asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtschname" runat="server" Height="24px" Width="190px"></asp:TextBox>

                        <asp:Label ID="Label7" runat="server" BorderStyle="None"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;คำสำคัญ</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:TextBox style="vertical-align: middle; height: 40px; width: 240px;" TextMode="multiline" id="txtschkeyword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="height: 60px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อ Folder &nbsp;&nbsp;&nbsp;&nbsp;
              <asp:DropDownList ID="ddlschstore" runat="server" Style="text-align: center" Height="24px" Width="210px" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="Name" AppendDataBoundItems="True">
              </asp:DropDownList>
                        &nbsp;&nbsp; &nbsp;&nbsp;
                  <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:D_ConnectionString %>" SelectCommand="SELECT Name FROM M_Document WHERE (Type = @Type) ORDER BY Name">
                      <SelectParameters>
                          <asp:Parameter DefaultValue="ที่จัดเก็บ" Name="Type" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;
                   หมวดหมู่ที่เกี่ยวข้อง &nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:DropDownList ID="ddlschcategory" runat="server" Style="text-align: center" Height="24px" Width="210px" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="Name" AppendDataBoundItems="True">
                  </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                  <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:D_ConnectionString %>" SelectCommand="SELECT [Name] FROM [M_Document] WHERE ([Type] = @Type) ORDER BY Name">
                      <SelectParameters>
                          <asp:Parameter DefaultValue="หมวดหมู่" Name="Type" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>

                    </td>
                </tr>
            <tr>
                <td class="auto-style1"></td>
                <tr class="menutab">
                    <td class="menutab">
                        <asp:Label ID="Label1" runat="server" Text="Labe2">view Document</asp:Label>
                        <asp:ImageButton ID="ImageNextbtn2" runat="server" Height="40px" ImageAlign="Right" ImageUrl="~/Images/next2.png" Style="margin-right: 10px" ToolTip="Forward" />
                        <asp:ImageButton ID="ImageNextbtn" runat="server" Height="40px" ImageAlign="Right" ImageUrl="~/Images/next.png" Style="margin-right: 7px" ToolTip="Next" />
                        <asp:ImageButton ID="ImageBackbtn" runat="server" Height="40px" ImageAlign="Right" ImageUrl="~/Images/back.png" Style="margin-right: 10px" ToolTip="Back" />
                        <asp:ImageButton ID="ImageBackbtn2" runat="server" Height="40px" ImageAlign="Right" ImageUrl="~/Images/back2.png" Style="margin-right: 10px" ToolTip="Backward" />
                    </td>
                </tr>
            
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" width="840px" Cssclass="table-info" >

                <asp:GridView ID="myGridView1" runat="server" AutoGenerateColumns="False" Width="678px"  CssClass="tablestyle"  DataKeyNames="Name" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="20" >
            <AlternatingRowStyle CssClass="altrowstyle" />
            <HeaderStyle CssClass="headerstyle" />
            <RowStyle CssClass="rowstyle" />

            <Columns>
                      <asp:BoundField DataField="Name" HeaderText="ชื่อไฟล์" ReadOnly="True" SortExpression="Name" >
                      <ItemStyle Width="50px" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Store" HeaderText="Folder จัดเก็บ" SortExpression="Store" >
                      <ItemStyle Width="100px" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Category" HeaderText="หมวดหมู่ที่เกี่ยวข้อง" SortExpression="Category" >
                      <ItemStyle Width="200px" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Keyword" HeaderText="Keyword" SortExpression="Keyword" >
                      <ItemStyle Width="100px" />
                      </asp:BoundField>
                      <asp:BoundField DataField="UserBy" HeaderText="ผู้บันทึก" SortExpression="UserBy">
                      <ItemStyle Width="80px" />
                      </asp:BoundField>
                      <asp:BoundField DataField="UserDate" DataFormatString="{0:d}" HeaderText="วันที่บันทึก" SortExpression="UserDate">
                      <ItemStyle Width="80px" />
                      </asp:BoundField>
            </Columns>
                        </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:D_ConnectionString %>" SelectCommand="SELECT * FROM [Document]"></asp:SqlDataSource>

            <asp:GridView ID="myGridView2" runat="server" AutoGenerateColumns="False" Width="678px" CssClass="auto-style2" DataKeyNames="Name"  AllowPaging="True" PageSize="20" OnRowDataBound="myGridView2_RowDataBound">
                <AlternatingRowStyle CssClass="altrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <RowStyle CssClass="rowstyle" />
                <Columns>
                <asp:TemplateField HeaderText="ชื่อไฟล์">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Folder จัดเก็บ">
                    <ItemTemplate>
                        <asp:Label ID="lblStore" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="หมวดหมู่ที่เกี่ยวข้อง">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Keyword">
                    <ItemTemplate>
                        <asp:Label ID="lblKeyword" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ผู้บันทึก">
                    <ItemTemplate>
                        <asp:Label ID="lblUserBy" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="วันที่บันทึก">
                    <ItemTemplate>
                        <asp:Label ID="lblUserDate" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            </asp:GridView>
     
        </asp:Panel>
    </form>
</body>
</html>
