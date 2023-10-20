Imports System.Data.SqlClient
Module md_query
    Function load_mc_losstime(ByVal year_month As String) As DataTable
        Dim sql As String = "SELECT month_year, ltmc, ltcode, ltshift, description, Line, Pro_Group, Work_Center, Len, Work_Des, LossTimeName, Loss_Time_Min, Loss_Time_HR
                             FROM     V_AVMC_LOSSTIME
                             WHERE  (month_year = '" & year_month & "')"
        'Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(TokaiwsSQL.SelectSQL_json(sql))
        Return stable
    End Function
End Module
