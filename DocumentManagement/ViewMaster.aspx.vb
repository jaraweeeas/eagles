Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BindData()
        End If
    End Sub

    Protected Sub BindData()

        ' Create new entities Object
        Using db = New Eagles_ManagementEntities()

            ' Get data from CUSTOMER
            Dim ds = (From c In db.M_Document
                      Select New With { _
                        c.Name, _
                        c.Type, _
                        c.Userby, _
                        c.Userdate _
                         }).ToList()

            ' Assign to DataGridView
            If ds.Count > 0 Then
                Me.myGridView.DataSource = ds
                Me.myGridView.DataBind()

            End If
        End Using
    End Sub

    Protected Sub myGridView_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles myGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow And Not IsNothing(DataBinder.Eval(e.Row.DataItem, "Name")) Then


            '*** Name ***'
            Dim lblMasterName As Label = DirectCast(e.Row.FindControl("lblMasterName"), Label)
            If Not IsNothing(lblMasterName) Then
                lblMasterName.Text = DataBinder.Eval(e.Row.DataItem, "NAME").ToString()
            End If

            '*** Type ***'
            Dim lblMasterType As Label = DirectCast(e.Row.FindControl("lblMasterType"), Label)
            If Not IsNothing(lblMasterType) Then
                lblMasterType.Text = DataBinder.Eval(e.Row.DataItem, "Type").ToString()
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

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        Response.Redirect("AddMaster.aspx")
    End Sub

End Class