Imports System.Drawing
Imports System.Data

Public Class WebForm5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub
    Function gen_date(ByVal St_month As Integer, St_year As Integer) As String
        Dim num_day As Integer = DateTime.DaysInMonth(St_year, St_month)
        Dim end_date As String = St_month & "/" & num_day & "/" & St_year
        Return end_date
    End Function

    Sub select_month(ByVal month As Integer, year As Integer)
        'Dim fromDate As String = month & "/" & "01" & "/" & year
        Dim fromDate As String = month & "/" & "01" & "/" & year
        Dim todate As String = gen_date(month, year)
        'Dim todate As String = "04/26/2023"
        'Dim todate As String = "02/28/2023"
        Dim startDate As DateTime = Convert.ToDateTime(fromDate)
        Dim endDate As DateTime = Convert.ToDateTime(todate)
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("Sunday")
        dt.Columns.Add("Monday")
        dt.Columns.Add("Tuesday")
        dt.Columns.Add("Wednesday")
        dt.Columns.Add("Thursday")
        dt.Columns.Add("Friday")
        dt.Columns.Add("Saturday")
        Dim dr As DataRow = dt.NewRow()
        Dim sdate As DateTime = startDate
        While sdate <= endDate
            Dim i As Integer = CInt(sdate.DayOfWeek)
            Dim day As String = sdate.DayOfWeek.ToString()
            dr(day) = sdate.ToString("dd")
            If i = 6 Then
                dt.Rows.Add(dr)
                dr = dt.NewRow()
            End If
            sdate = sdate.AddDays(1)
        End While
        Me.gvWeeklyCalender.DataSource = dt
        Me.gvWeeklyCalender.DataBind()
        '    Dim holidays As List(Of DateTime) = New List(Of DateTime)()
        '    holidays.Add(New DateTime(DateTime.Now.Year, 1, 1))
        '    holidays.Add(New DateTime(DateTime.Now.Year, 1, 16))
        '    holidays.Add(New DateTime(DateTime.Now.Year, 1, 26))
        '    Dim count As Integer = 0
        '    For Each row As GridViewRow In Me.gvWeeklyCalender.Rows
        '        For Each cell As TableCell In row.Cells
        '            If cell.Text <> "&nbsp;" Then
        '                Dim datee = holidays.Where(Function(x) x.ToShortDateString() = cell.Text).FirstOrDefault()
        '                If datee <> DateTime.MinValue Then
        '                    cell.ForeColor = Color.Green
        '                ElseIf CInt(Convert.ToDateTime(cell.Text).DayOfWeek) = 0 OrElse CInt(Convert.ToDateTime(cell.Text).DayOfWeek) = 6 Then
        '                Else
        '                    count += 1
        '                End If
        '            End If
        '        Next
        '        row.Cells(0).ForeColor = Color.Red
        '        row.Cells(6).ForeColor = Color.Red
        '    Next
        '    lblWorkingDays.Text = "Total working Days : " & count.ToString()
    End Sub

    Protected Sub btnsearch_Click(sender As Object, e As EventArgs) Handles btnsearch.Click
        select_month(DropDownList1.SelectedValue, DropDownList2.SelectedValue)
    End Sub
End Class