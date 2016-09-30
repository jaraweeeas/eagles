
Public Class SearchDocument
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Me.ImageSearchbtn.ImageUrl = "~/Images/Searchfile.png"
            Me.ImageRefreshbtn.ImageUrl = "~/Images/refresh.png"
            Me.ddlschstore.Items.Insert(0, "")
            Me.ddlschcategory.Items.Insert(0, "")

        End If
        myGridView1.DataBind()

    End Sub

    Protected Sub ImageSearchbtn_Click(sender As Object, e As ImageClickEventArgs) Handles ImageSearchbtn.Click
        Using db = New Eagles_ManagementEntities()
            Dim strschname As String = Me.txtschname.Text
            Dim strschKeyWord As String = Me.txtschkeyword.Text
            Dim strddlschStore As String = Me.ddlschstore.Text
            Dim strddlschCategory As String = Me.ddlschcategory.Text

            Dim ds = (From c In db.Document Where c.Name.Contains(strschname) And c.Store.Contains(strddlschStore) And c.Category.Contains(strddlschCategory) And c.Keyword.Contains(strschKeyWord)
              Select New With { _
               c.Name, _
               c.Store, _
               c.Category, _
               c.Keyword, _
               c.UserBy, _
               c.UserDate _
            }).ToList()

            'Assign to GridView
            If ds.Count > 0 Then
                myGridView2.Visible = True
                myGridView2.DataSource = ds
                myGridView2.DataBind()
                myGridView1.Visible = False
            End If
        End Using
    End Sub

    Protected Sub myGridView2_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles myGridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow And Not IsNothing(DataBinder.Eval(e.Row.DataItem, "name")) Then

            '*** Name ***'
            Dim lblName As Label = DirectCast(e.Row.FindControl("lblName"), Label)
            If Not IsNothing(lblName) Then
                lblName.Text = DataBinder.Eval(e.Row.DataItem, "name").ToString()
            End If

            '*** Store ***'
            Dim lblStore As Label = DirectCast(e.Row.FindControl("lblStore"), Label)
            If Not IsNothing(lblStore) Then
                lblStore.Text = DataBinder.Eval(e.Row.DataItem, "Store").ToString()
            End If

            '*** Category ***'
            Dim lblCategory As Label = DirectCast(e.Row.FindControl("lblCategory"), Label)
            If Not IsNothing(lblCategory) Then
                lblCategory.Text = DataBinder.Eval(e.Row.DataItem, "Category").ToString()
            End If

            '*** Keyword ***'
            Dim lblKeyword As Label = DirectCast(e.Row.FindControl("lblKeyword"), Label)
            If Not IsNothing(lblKeyword) Then
                lblKeyword.Text = DataBinder.Eval(e.Row.DataItem, "Keyword").ToString()
            End If

            '*** UserBy ***'
            Dim lblUserBy As Label = DirectCast(e.Row.FindControl("lblUserBy"), Label)
            If Not IsNothing(lblUserBy) Then
                lblUserBy.Text = DataBinder.Eval(e.Row.DataItem, "UserBy").ToString()
            End If

            '*** UserDate ***'
            Dim lblUserDate As Label = DirectCast(e.Row.FindControl("lblUserDate"), Label)
            If Not IsNothing(lblUserDate) Then
                lblUserDate.Text = FormatDateTime(DataBinder.Eval(e.Row.DataItem, "UserDate").ToString(), 0)

            End If

        End If
    End Sub

    Protected Sub ImageRefreshbtn_Click(sender As Object, e As ImageClickEventArgs) Handles ImageRefreshbtn.Click
        myGridView1.Visible = True
        myGridView2.Visible = False
        txtschkeyword.Text = String.Empty
        txtschname.Text = String.Empty
        ddlschstore.ClearSelection()
        ddlschcategory.ClearSelection()
    End Sub
End Class