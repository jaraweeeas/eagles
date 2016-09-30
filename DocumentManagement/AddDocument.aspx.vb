Public Class AddDocument
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Me.ImageAddbtn.ImageUrl = "~/Images/plus.png"
            Me.ImageCancelbtn.ImageUrl = "~/Images/cancel.png"
            Me.ImageSavebtn.ImageUrl = "~/Images/save.png"
            Me.ImageNewbtn.ImageUrl = "~/Images/new.png"
            Me.ddlstore.Items.Insert(0, "- กรุณาเลือกข้อมูล -")
            Me.ddlCategory.Items.Insert(0, "- กรุณาเลือกข้อมูล -")

        End If

    End Sub

    Private Sub BindControl()
        '-- ...
        '-- อ่านข้อมูลจากฐานข้อมูล มาใส่ไว้ใน DataTable
        '-- ...
        ' Dim dv As DataView = dt.DefaultView
        Dim pgNdx As New PagedDataSource()
        'pgNdx.DataSource = dv        '-- Bind DataView ให้กับ PageDataSource object
        pgNdx.PageSize = 5             '-- กำหนดจำนวนรายการที่ต้องการให้แสดงในแต่ละหน้า
        pgNdx.AllowPaging = True    '-- กำหนดว่าให้มีการทำ paging ได้
        'ddlPageIndex.Items.Clear()   '-- เพิ่มจำนวนหน้าลงใน DropDownList Control
        ' For i As Integer = 0 To (pgNdx.PageCount - 1)
        'ddlPageIndex.Items.Add(New ListItem(Convert.ToString(i + 1), Convert.ToString(i + 1)))
        '' Next
        ' ddlPageIndex.SelectedIndex = currentPageIndex
        '  pgNdx.CurrentPageIndex = currentPageIndex
        ImageBackbtn.Enabled = Not (pgNdx.IsFirstPage)         '-- ถ้าหากเป็นหน้าแรกให้ disable ปุ่ม Back
        ImageNextbtn.Enabled = Not (pgNdx.IsLastPage)         '-- ถ้าหากเป็นหน้าสุดท้ายให้ disable ปุ่ม Next
        myGridView1.DataSource = pgNdx
        myGridView1.DataBind()
    End Sub

    ' Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click


    'db.M_Document.Add(New M_Document() With { _
    '                    .Name = strMasterName, _
    '                    .Type = strMasterType, _
    '                     .Userby = "test", _
    '                   .Userdate = Now.Date _
    '  })
    'db.SaveChanges()

    ' End Using
    ' End Sub

    Protected Sub ImageAddbtn_Click(sender As Object, e As ImageClickEventArgs) Handles ImageAddbtn.Click
        If lblcategory1.Text = "" Then
            Me.lblcategory1.Text = ddlCategory.SelectedValue.ToString()
        Else
            Me.lblcategory2.Text = lblcategory2.Text + " , " + ddlCategory.SelectedValue.ToString()
        End If
    End Sub

    Protected Sub ImageCancelbtn_Click(sender As Object, e As ImageClickEventArgs) Handles ImageCancelbtn.Click
        Me.lblcategory1.Text = ""
        Me.lblcategory2.Text = ""
    End Sub

    Protected Sub ImageSavebtn_Click(sender As Object, e As ImageClickEventArgs) Handles ImageSavebtn.Click

        Using db = New Eagles_ManagementEntities()
            Dim strddlstore As String = ddlstore.Text()
            Dim strddlCategory As String = ddlCategory.Text()
            Dim strtxakeyword As String = txakeyword.Value()
            Dim strlblcategory1 As String = lblcategory1.Text()

            'Check insert
            If strddlstore = "- กรุณาเลือกข้อมูล -" Then
                ClientScript.RegisterStartupScript(Me.GetType, "PopupScript", "<script>alert('" + String.Format("กรุณาเลือก ที่จัดเก็บไฟล์") + "');</script>")
            ElseIf strlblcategory1 = "" Then
                ClientScript.RegisterStartupScript(Me.GetType, "PopupScript", "<script>alert('" + String.Format("กรุณาเพิ่ม หมวดหมู่ที่เกี่ยวข้องกับไฟล์") + "');</script>")
            ElseIf fiUpload.PostedFile.FileName = "" Then
                ClientScript.RegisterStartupScript(Me.GetType, "PopupScript", "<script>alert('" + String.Format("กรุณาเพิ่ม ไฟล์ที่จะจัดเก็บ") + "');</script>")
            Else
                ' Check data 
                Dim ds = (From d In db.Document
                 Where d.Name = fiUpload.PostedFile.FileName
                       Select d).FirstOrDefault()
                ' alert
                If ds IsNot Nothing Then
                    ClientScript.RegisterStartupScript(Me.GetType, "PopupScript", "<script>alert('" + String.Format("File {0} มีอยู่ในระบบแล้ว", fiUpload.PostedFile.FileName) + "');</script>")
                Else
                    ' Insert
                    If Me.fiUpload.HasFile Then
                        Me.fiUpload.SaveAs("\\192.168.2.240\DocManagement\" & ddlstore.Text & "\" & fiUpload.FileName)
                    End If

                    db.Document.Add(New Document() With { _
                            .Name = fiUpload.PostedFile.FileName, _
                            .Store = strddlstore, _
                            .Category = strlblcategory1, _
                            .Keyword = strtxakeyword, _
                            .UserBy = "test", _
                            .UserDate = Now.Date _
                        })
                    db.SaveChanges()
                    ClientScript.RegisterStartupScript(Me.GetType, "PopupScript", "<script>alert('" + String.Format("บันทึกไฟล์เรียบร้อย") + "');</script>")
                    'Response.Redirect("ViewMaster.aspx")

                End If
            End If
        End Using
    End Sub

    Protected Sub ImageNewbtn_Click(sender As Object, e As ImageClickEventArgs) Handles ImageNewbtn.Click
        txakeyword.Value = String.Empty
        lblcategory1.Text = String.Empty
        lblcategory2.Text = String.Empty
        ddlstore.ClearSelection()
        ddlCategory.ClearSelection()
    End Sub
    Protected Sub myGridView_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        myGridView1.PageIndex = e.NewPageIndex
    End Sub

    Protected Sub ImageNextbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageNextbtn.Click
        myGridView1_PageIndexChanging(myGridView1, New GridViewPageEventArgs(myGridView1.PageIndex + 1))
        BindControl()
    End Sub

    Protected Sub ImageBackbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageBackbtn.Click
        myGridView_PageIndexChanging(myGridView1, New GridViewPageEventArgs(myGridView1.PageIndex - 1))
        BindControl()
    End Sub

    Protected Sub ImageNextbtn2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageNextbtn2.Click
        myGridView1.PageIndex = myGridView1.PageCount - 1
        DataBind()
    End Sub

    Protected Sub ImageBackbtn2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageBackbtn2.Click
        myGridView1.PageIndex = 0
        DataBind()
    End Sub

    Protected Sub myGridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles myGridView1.PageIndexChanging
        myGridView1.PageIndex = e.NewPageIndex
    End Sub
   
End Class