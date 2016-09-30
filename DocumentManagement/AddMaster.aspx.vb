Imports System.IO

Public Class AddMaster
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtmastername.Text = String.Empty
            ImageSavebtn.ImageUrl = "~/Images/save.png"
            ImageNewbtn.ImageUrl = "~/Images/new.png"
            ImageNextbtn.ImageUrl = "~/Images/next.png"
            ImageNextbtn2.ImageUrl = "~/Images/next2.png"
            ImageBackbtn.ImageUrl = "~/Images/back.png"
            ImageBackbtn2.ImageUrl = "~/Images/back2.png"
            ddlmastertype.Items.Insert(0, "- กรุณาเลือกข้อมูล -")
        End If

        If myGridView.PageIndex = -1 Then
            ImageBackbtn.Enabled = False
        Else
            'ImageBackbtn.Enabled = True
        End If
    End Sub

    Protected Sub ImageSavebtn_Click(sender As Object, e As EventArgs) Handles ImageSavebtn.Click

        If Page.IsPostBack Then


            Using db = New Eagles_ManagementEntities()
                Dim strMasterName As String = txtmastername.Text()
                Dim strMasterType As String = ddlmastertype.Text()

                'Check insert
                If strMasterType = "- กรุณาเลือกข้อมูล -" Then
                    ClientScript.RegisterStartupScript(Me.GetType, "PopupScript", "<script>alert('" + String.Format("กรุณาเลือก MasterType") + "');</script>")
                ElseIf strMasterName = "" Then
                    ClientScript.RegisterStartupScript(Me.GetType, "PopupScript", "<script>alert('" + String.Format("กรุณากรอกชื่อ Master") + "');</script>")
                Else
                    ' Insert data to M_Document
                    Dim ds = (From c In db.M_Document
                              Where c.Name = strMasterName
                            Select c).FirstOrDefault()
                    ' Insert
                    If ds IsNot Nothing Then
                        ClientScript.RegisterStartupScript(Me.GetType, "PopupScript", "<script>alert('" + String.Format("Master {0} มีอยู่ในระบบแล้ว", strMasterName) + "');</script>")
                    Else

                        db.M_Document.Add(New M_Document() With { _
                                .Name = strMasterName, _
                                .Type = strMasterType, _
                                .Userby = "test", _
                                .Userdate = Now.Date _
                            })
                        db.SaveChanges()

                        'refresh gridview
                        myGridView.DataBind()
                        ClientScript.RegisterStartupScript(Me.GetType, "PopupScript", "<script>alert('" + String.Format("บันทึก Master เรียบร้อย") + "');</script>")
                        If txtmastername.Text = "ที่จัดเก็บ" Then
                            Dim DirInfo As New DirectoryInfo("\\192.168.2.240\DocManagement\" & txtmastername.Text)

                            '*** Create Folder ***'
                            If Not DirInfo.Exists Then
                                DirInfo.Create()
                            End If
                        End If
                    End If
                End If
            End Using
        End If
    End Sub

    Protected Sub myGridView_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles myGridView.PageIndexChanging
        myGridView.PageIndex = e.NewPageIndex
    End Sub

    Protected Sub ImageNewbtn_Click(sender As Object, e As ImageClickEventArgs) Handles ImageNewbtn.Click
        txtmastername.Text = String.Empty
        ddlmastertype.ClearSelection()
    End Sub

    Protected Sub ImageNextbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageNextbtn.Click
        myGridView_PageIndexChanging(myGridView, New GridViewPageEventArgs(myGridView.PageIndex + 1))
    End Sub

    Protected Sub ImageBackbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageBackbtn.Click

        myGridView_PageIndexChanging(myGridView, New GridViewPageEventArgs(myGridView.PageIndex - 1))
    End Sub

    Protected Sub ImageNextbtn2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageNextbtn2.Click
        myGridView.PageIndex = myGridView.PageCount - 1
        DataBind()
    End Sub

    Protected Sub ImageBackbtn2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageBackbtn2.Click
        myGridView.PageIndex = 0
        DataBind()
    End Sub
End Class