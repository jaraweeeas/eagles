<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDocument.aspx.vb" Inherits="DocumentManagement.AddDocument"  %>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">

    <link href="Content/DocCss.css" rel="stylesheet" type="text/css" />
    


    <title></title>
    <style type="text/css">
        .auto-style4 {
            height: 36px;
            width: 477px;
        }
        .auto-style5 {
            height: 74px;
            width: 477px;
        }
        .auto-style6 {
            height: 105px;
            width: 477px;
        }
        .auto-style10 {
            height: 36px;
            width: 833px;
        }
        .auto-style11 {
            height: 30px;
        }
        .auto-style13 {
            width: 833px;
        }
        </style>
 
   
        <asp:Panel ID="Panel2" runat="server"  width="100%" >
      <table class="table-info"  style="width:919px" >
          <tr>
              <td class="menutab" colspan="2" style="height:35px" >
                  <asp:ImageButton ID="ImageSavebtn" runat="server" height="40px" style="margin-right:7px" ImageAlign="Right" ImageUrl="~/Images/save.png" ToolTip="Save" />
                  <asp:ImageButton ID="ImageNewbtn" runat="server" height="40px" style="margin-right:10px" ImageUrl="~/Images/new.png" ImageAlign="Right" ToolTip="New" />
                  <asp:Label ID="Label3" runat="server" Text="Label" >add document</asp:Label>
                  </td>
          </tr>
          <tr>
              <td class="auto-style11" colspan="2" style="height:35px" ></td>
          </tr>
          <tr>
              <td class="auto-style13" >Folder ที่จัดเก็บไฟล์ &nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlstore" runat="server" Style="text-align:center"  Height="24px" Width="182px" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name" AppendDataBoundItems="true" >
              </asp:DropDownList> &nbsp;&nbsp; &nbsp;&nbsp;
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:D_ConnectionString %>" SelectCommand="SELECT Name FROM M_Document WHERE (Type = @Type) ORDER BY Name">
                      <SelectParameters  >
                          <asp:Parameter DefaultValue="ที่จัดเก็บ" Name="Type" Type="String"  />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  
              </td>
              <td class="auto-style6">
                  <asp:Label ID="Label2" runat="server" BorderStyle="None">คำสำคัญ</asp:Label>&nbsp;&nbsp;&nbsp&nbsp;
                  <Textarea style="vertical-align:middle; height: 57px; width: 303px;" ID="txakeyword" runat="server"></Textarea>
              </td>
              </tr>
              <tr>
              <td class="auto-style13"  >หมวดหมู่ที่เกี่ยวข้อง &nbsp;&nbsp;
                  <asp:DropDownList ID="ddlCategory" runat="server" Style="text-align:center"  Height="24px" Width="182px" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" AppendDataBoundItems="True">
                      </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                   
                  <asp:ImageButton ID="ImageAddbtn" runat="server" height="28px" style="vertical-align:middle" ImageUrl="~/Images/plus.png" ToolTip="Add" />
                  &nbsp;
                   <asp:ImageButton ID="ImageCancelbtn" runat="server" height="28px" style="vertical-align:middle" ImageUrl="~/Images/cancel.png" ToolTip="Clear" />
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:D_ConnectionString %>" SelectCommand="SELECT [Name] FROM [M_Document] WHERE ([Type] = @Type) ORDER BY Name">
                      <SelectParameters>
                          <asp:Parameter DefaultValue="หมวดหมู่" Name="Type" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  
              </td>
                  <td class="auto-style5">&nbsp;&nbsp;&nbsp;
                      <asp:Label ID="lblcategory1" runat="server"></asp:Label><asp:Label ID="lblcategory2" runat="server"></asp:Label><hr />
                  </td>
          </tr>
          <tr>
              <td class="auto-style10"></td>
              <td  class="auto-style4" >อัพโหลดไฟล์&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:FileUpload id="fiUpload" runat="server" Width="284px" ></asp:FileUpload></td> 
          
              </tr>  
      </table>
            </asp:Panel>
        <br /><br /><br />
         
        <br />
        <asp:Panel ID="Panel1" runat="server"  width="840px" Cssclass="table-info"  > 
            <table style="width:840px; " class="menutab">
                <tr ><td>
            <asp:Label ID="Label1" runat="server" Text="Labe2" >view Document</asp:Label>
                    <asp:ImageButton ID="ImageNextbtn2" runat="server" height="40px" style="margin-right:10px" ImageUrl="~/Images/next2.png" ImageAlign="Right" ToolTip="Forward" />
                    <asp:ImageButton ID="ImageNextbtn" runat="server" height="40px" style="margin-right:7px" ImageAlign="Right" ImageUrl="~/Images/next.png" ToolTip="Next" />
                    <asp:ImageButton ID="ImageBackbtn" runat="server" height="40px" style="margin-right:10px" ImageUrl="~/Images/back.png" ImageAlign="Right" ToolTip="Back" />
                    <asp:ImageButton ID="ImageBackbtn2" runat="server" height="40px" style="margin-right:10px" ImageUrl="~/Images/back2.png" ImageAlign="Right" ToolTip="Backward" />
                    </td>
                   </tr>
                </table>
            <br /><br /><br />
        <asp:GridView ID="myGridView1" runat="server" AutoGenerateColumns="False" Width="678px"  CssClass="tablestyle"  DataKeyNames="Name" DataSourceID="SqlDataSource4" AllowPaging="True" PageSize="20" >
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
       
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:D_ConnectionString %>" SelectCommand="SELECT * FROM [Document]"></asp:SqlDataSource>
       
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:D_ConnectionString %>" SelectCommand="SELECT * FROM [M_Document] ORDER BY [Userdate] DESC"></asp:SqlDataSource>
       
        </asp:Panel>
   </asp:Content>
 