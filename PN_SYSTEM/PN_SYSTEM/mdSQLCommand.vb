Imports System.ComponentModel.DataAnnotations
Imports System.Data.SqlClient
Imports System.IO
Imports System.Runtime.InteropServices.ComTypes
Imports System.Web.DynamicData
Imports System.Web.Services.Description
Imports Newtonsoft.Json

Module mdSQLCommand
    Public Const strIFS As String = "server = PROD1; uid =ifsapp;password =ifsapp2o18;"
    Public Const strcustomer_edi As String = "Persist Security Info=False;database=customer_edi;server=172.18.1.23;Connect Timeout=400;user id=root; pwd=isylzjko"
    'Public Tokaiws As New WebReference.Service1
    Public TokaiwsSQL As New SQL.sqlsrker

    Public Function load_calendar() As DataTable
        Dim sql As String = "SELECT SUBSTRING(month, 1, 4) AS year, SUBSTRING(month, 5, 2) AS month, customer_no, customer_name, TOTAL_DAY, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, D16, D17, D18, D19, D20, D21, D22, D23,
                            D24, D25, D26, D27, D28, D29, D30, D31
                            FROM tblCustomersCalendar
                            WHERE (flag = 1)"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        If stable.Rows.Count > 0 Then
            Return stable
        End If
    End Function

    Public Function load_total_DT() As DataTable
        Dim sql As String = "SELECT nDowntimeLine, nDowntimeDate, nDowntimeShift, TotalDownTime
                             FROM V_SP_totalDownTime"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Return stable
    End Function

    Public Function load_AVBOM(ByVal TopLv As String, num_row As Integer) As DataTable
        Dim sql As String = ""
        sql &= "SELECT TOP " & num_row
        sql &= " Top_Level_Part_IFS_Code_X, Contract, Lv, Parent_Part_IFS_Code_X, Child_Part_Code_X, QTY, Unit, Product_fam, Operation_no, Process_Group, Process_Descript, LastUpdate"
        sql &= "        FROM tblAVProductStructure"
        If TopLv <> "" Then sql &= " WHERE  (Top_Level_Part_IFS_Code_X Like N'%" & TopLv & "%')"
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function

    Public Function load_forecast() As DataTable
        Dim sql As String = "SELECT f_month, f_plant, f_part, f_mfg, type, f_forcast, SP_MFG_FG_PART, SP_MFG_PART, SP_TYPE, Toatal_Product
                             FROM V_SUM_FORCAST"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Return stable
    End Function

    Public Function load_SPCondition() As DataTable
        Dim sql As String = "SELECT C_code, C_mc_lineNo, C_operate_cycle_sec, C_round_per_hr, C_fullworking_hr_shift, C_cleaning_mold_hr_shift, C_frequency_clenning_every_shift, C_Qty_trolley, C_ct_change_mold_min, C_manpower, C_remark1,
                            C_remark2, C_lastupdate FROM tblSPMcCondition"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Return stable
    End Function

    Public Function load_actDT(ByVal month As String, ByVal Line As String) As DataTable
        Dim sql As String = ""
        sql &= "SELECT month, TOTAL_DAY, C_code, C_mc_lineNo, C_operate_cycle_sec, C_round_per_hr, C_fullworking_hr_shift, nDowntimeShift, totaldowntime, Actual_fuworkingTime"
        sql &= " FROM V_PLSP_ACTDT"
        If month <> "" And Line = "" Then sql &= " WHERE (month LIKE N'%" & month & "%')"
        If month = "" And Line <> "" Then sql &= " WHERE C_mc_lineNo = '" & Line & "'"
        If month <> "" And Line <> "" Then sql &= " WHERE month = '" & month & "' and C_mc_lineNo = '" & Line & "'"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Return stable
    End Function

    Public Function load_tbforecast() As DataTable
        Dim sql As String = "SELECT Id, flag, month, plant, deliver_type, forecast_date, original_forecast_date, import_type, customer_no, customer_name, customer_group, part_no, part_no_sub, mfg_no, cust_part_no, standard_pack_code,
                             standard_pack_qty, qty_forecast, original_qty_forecast, file_import, ship_to_gsdb_code, ship_from_gsdb_code, dock_code, record_date, update_time, update_by
                             FROM tblCustomersForecast
                             WHERE (flag = 1)"
        Return TokaiwsSQL.SelectSQL(sql).Tables(0)
    End Function

    Public Function load_item() As DataTable
        Dim sql As String = ""
        sql = "SELECT MFGNO_ITEM, MFGNO_IFS, STD, PART_BY_STD, TYPE_BOX, QTY_BOX, IFS_CODE, IFS_CODEX, GROUP_PART, PART_DES, CODE_PROCESS, PROCESS, MIN_STOCK, MAX_STOCK, PRIORITY, LOT_QTY, UNIT,
                             SUPPLY_PLANT, LASTUPDATE
                             FROM tblSPITEM"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Return stable
    End Function

    Public Function load_limitmold() As DataTable
        Dim sql As String = "SELECT Part_Injection_by_Item_MFG, Part_Injection_by_Item_IFS_no, Resource_name, M_C, Limit_Mold_M_C_month_N, Priority_for_set_Plan_Month_N, Limit_Mold_M_C_month_N_1, Priority_for_set_Plan_Month_N_1,
                             Limit_Mold_M_C_month_N_2, Priority_for_set_Plan_Month_N_2, Limit_Mold_M_C_month_N_3, Priority_for_set_Plan_Month_N_3, Lastupdate

                             FROM  tblSPLimitMold"
        Return TokaiwsSQL.SelectSQL(sql).Tables(0)
    End Function

    Public Function load_moldlist() As DataTable
        Dim SQL As String = "SELECT Resource_name, SP_Group, Mold_Type_set_no, Mold_Qty, Cav, Priority, Lastupdate
                             FROM tblSPMoldList"
        Return TokaiwsSQL.SelectSQL(SQL).Tables(0)
    End Function

    Public Function load_workcenter() As DataTable
        Dim sql As String = "SELECT Resource_MC, MC_description, Group_MC, Plant, Production_line, Group_Process, WC_UTILIZATION, WC_OPERATE_TIME_PER_CYCLE, WC_SHOT_PER_ROUND, WC_MANPOWER, WC_UOM, Lastupdate
                              FROM tblSPWorkCenter"
        Return TokaiwsSQL.SelectSQL(sql).Tables(0)
    End Function

    Public Function load_MoldNeed() As DataTable
        Dim sql As String = "SELECT f_month, f_plant, f_part, f_mfg, f_forcast, SP_MFG_PART, TotalForecast, GroupLine, Resource_name, Cav, Priority, C_code, C_round_per_hr, Actual_fuworkingTime, PcsPerMonth, moldneed, Mold_Qty,
                             Mold_Remain
                             FROM V_SPMOILDNEED"
        Return TokaiwsSQL.SelectSQL(sql).Tables(0)
    End Function

    Public Function load_issuemat(ByVal date_start As String, ByVal date_stop As String, ByVal group_name As String) As DataTable
        Dim sTable1 As DataTable
        Dim myCmd1 As New SqlCommand
        myCmd1.Parameters.Add(New SqlParameter("@startdate", date_start))
        myCmd1.Parameters.Add(New SqlParameter("@stopdate", date_stop))
        myCmd1.Parameters.Add(New SqlParameter("@GroupCus", group_name))
        myCmd1.Parameters.Add(New SqlParameter("@Status", "issue_by_cus"))

        'sTable1 = SQLREAD.SelectSQLMTTStoredProcedures("SD_issue_mat", myCmd1)
        'If sTable1.Rows.Count > 0 Then

        'End If
        'Return sTable1
    End Function

    Public Function load_year_forecast() As DataSet
        Dim sql As String = "SELECT  month, plant, forecast_date, customer_group, COUNT(*) AS QORDER FROM tblCustomersForecast
                             WHERE   (qty_forecast > 0)
                             GROUP BY month, plant, forecast_date, customer_group
                             ORDER BY month"

        Dim dataset As DataSet = TokaiwsSQL.SelectSQL(sql)

        Return dataset
    End Function

    Public Function load_forecast_mainyearmonth() As DataTable
        Dim sql As String = "SELECT month, plant, COUNT(*) AS QORDER
                             FROM tblCustomersForecast
                             WHERE (qty_forecast > 0)
                             GROUP BY month, plant
                             ORDER BY month"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Return stable
    End Function

    Function load_forcast_total_plant(ByVal datestart As String, ByVal datestop As String) As DataTable
        Dim sql As String = "SELECT month, plant, COUNT(*) AS QORDER
                             FROM tblCustomersForecast
                             WHERE (qty_forecast > 0)
                             GROUP BY month, plant
                             HAVING (month BETWEEN '" & datestart & "' AND '" & datestop & "')
                             ORDER BY month"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Return stable
    End Function

    Function load_review_BOM() As DataTable
        Dim sql As String = "SELECT TOP(2) TopLv, Lv, Name, Contract, AV_ParentsPartByItemIFS, AV_ChildPart, AV_QtyUsege, AV_UNIT_MEAS, IF_DESCRIPTION, IF_PART_PRODUCT_FAMILY, IF_PLANNER_BUYER, IF_TYPE_DESIGNATION, [10], [20], [30], [40], [50], [60],
                             [70], [80], [90]
                             FROM     V_REVIEW_BOM"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Return stable
    End Function

    Function load_treeview(ByVal parent_id As String) As DataTable
        Dim sql As String = ""
        sql &= "SELECT tblITEMMF.IF_ID AS Child_id, BOM.AV_ChildPart"
        sql &= " From tblITEMMF AS tblITEMMF_1 RIGHT OUTER JOIN"
        sql &= "                 (SELECT AV_contract, AV_TopLevelByItem, AV_ChildPart, CASE WHEN AV_TopLevelByItem = AV_ParentsPartByItemIFS THEN NULL ELSE AV_ParentsPartByItemIFS END AS ParentsPart, AV_QtyUsege, "
        sql &= "                                         AV_UNIT_MEAS"
        sql &= "                FROM            tblAVBOM) AS BOM ON tblITEMMF_1.IF_CONTRACT = BOM.AV_contract AND tblITEMMF_1.IF_PART_NO = BOM.ParentsPart LEFT OUTER JOIN"
        sql &= "           tblITEMMF ON BOM.AV_contract = tblITEMMF.IF_CONTRACT AND BOM.AV_ChildPart = tblITEMMF.IF_PART_NO"
        If parent_id <> "" Then sql &= "	          WHERE (CASE WHEN  tblITEMMF_1.IF_ID IS NULL THEN 0 ELSE tblITEMMF_1.IF_ID END = '" & parent_id & "')"
        Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Return stable
    End Function

    Function load_AV_ITEM(ByVal TopLv_item As String, num_row_item As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_item
        sql &= " IF_ID, IF_PART_NO, IF_DESCRIPTION, IF_CONTRACT, IF_TYPE_CODE, IF_PART_PRODUCT_FAMILY, IF_PLANNER_BUYER, IF_UNIT_MEAS, IF_TYPE_DESIGNATION, IF_LEAD_TIME_CODE, IF_LOT_SIZE, IF_MAX_ORDER_QTY, 
                  IF_MIN_ORDER_QTY, IF_SAFETY_STOCK, IF_PART_STATUS, IF_STANDARD_PACK, IF_PACKING_STANDARD"
        sql &= "    FROM tblITEMMF"
        If TopLv_item <> "" Then sql &= " WHERE (IF_PART_NO Like N'%" & TopLv_item & "%')"
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function

    Function load_losttime(ByVal TopLv_losttime As String, num_row_losttime As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_losttime
        sql &= " Code, LossTimeName, Loss_Time_min, LastUpdate
                            FROM  tblAVLossTimeMaster"
        If TopLv_losttime <> "" Then sql &= " WHERE (Code Like N'%" & TopLv_losttime & "%')"
        'Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function

    Function load_workcenter(ByVal TopLv_workcenter As String, num_row_workcenter As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_workcenter
        sql &= " Resource, description, Site, Line, Pro_Group, Work_Center, Len, Work_Des, WC_UTILIZATION, LastUpdate
                            FROM  tblAVWorkCenter"
        If TopLv_workcenter <> "" Then sql &= " WHERE (Resource Like N'%" & TopLv_workcenter & "%')"
        'Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function

    Function load_curing_mold(ByVal Toplv_curingmold As String, num_row_curingmold As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_curingmold
        sql &= " List_Part_by_Item_or_link_Capacity, Part_Curing_by_Item_MFGno, Part_Curing_by_ItemIFS_no, AVGroup, Mold_Type_set_no, Resource_name, Mold_Qty, Cav, Priority, Size_mold, Volumn_Rubber, Pressure, Molds_Type, 
                  TYPE_MC, Secshot, SecPcs, Cleaning_MoldShift, Time_for_Cleaninghr, LastUpdate
                            FROM   tblCuringMoldMatching"
        If Toplv_curingmold <> "" Then sql &= " WHERE (List_Part_by_Item_or_link_Capacity Like N'%" & Toplv_curingmold & "%')"
        'Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function
    Function load_metal_mc(ByVal Toplv_metalmc As String, num_row_metalmc As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_metalmc
        sql &= " MFG_No, IFS_Code_no, IFS_Code_X_no, For_link_capto_Riouting, Type_part, MC, Supplier_PcsBox, Shot, SecShot, SecPcs, IFS_Code_X_no_ori, For_link_capto_Riouting_ori, AdhProcess_MC_No, Resouce_Code, 
                  Resource_description, AdhProcess1, Adhesive_Type, Ahd_PcsBox, Pcsshot_of_Adh, CT_Sec, MCsecPerpcs, LastUpdate
                            FROM  tblMetalPartMCMatching"
        If Toplv_metalmc <> "" Then sql &= " WHERE (MFG_No Like N'%" & Toplv_metalmc & "%')"
        'Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function
    Function load_assy_mc(ByVal Toplv_assymc As String, num_row_assymc As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_assymc
        sql &= " For_Link_Cap_to_Routing, MFG_by_Item, MFG_No_by_package, IFS_code_by_item, IFS_code_by_package, IFS_code_X_by_package, Process, CT_Assembly_time, Assembly_Cap, Resource_M_C, M_C_description, Main_M_C, 
                  Support_M_C, Priority, LastUpdate
                  FROM tblAssyMCMatching"
        If Toplv_assymc <> "" Then sql &= " WHERE (MFG_by_Item Like N'%" & Toplv_assymc & "%')"
        'Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function
    Function load_moldlist(ByVal Toplv_moldlist As String, num_row_moldlist As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_moldlist
        sql &= " ML_PART_NO, ML_PART_NAME, ML_MFG_NO, ML_NO_Parent, ML_MOLD_NO, ML_PROCESS, ML_CAVITY, ML_CAVITY_PER_MOLD, ML_WIEGHT_KG, ML_PRODUCT_FROM, ML_CLEANING_PERIOD_DAY, ML_CUSTOMER, 
                  ML_RECIVED_DATE, ML_MC_SETTING, ML_WC_CODE, ML_STATUS, ML_ASSET, ML_BOI, ML_REMARK, ML_LASTUPDATE
                  FROM tblMoldList"
        If Toplv_moldlist <> "" Then sql &= " WHERE (ML_PART_NO Like N'%" & Toplv_moldlist & "%')"
        'Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function

    Function load_cuscalendar(ByVal ddlyear As String, ddlyyyymm As String, txt_search As String) As DataTable
        Dim date_search As String = ddlyear & ddlyyyymm
        Dim length As Integer = date_search.Length


        Dim sql As String = "SELECT month,customer_no,customer_name,TOTAL_DAY,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31, file_import, 
                  update_time, update_by
                  FROM tblCustomersCalendar
                  WHERE flag = '1' "
        If length = 7 Then sql &= "AND left(month,4) = '" & ddlyear & "' "
        If length = 6 Then sql &= "AND month = '" & date_search & "' "
        'If ddlyyyymm <> "ALL" And ddlyyyymm <> "" Then sql &= " AND month = '" & ddlyyyymm & "' "
        If txt_search <> "" Then sql &= " AND (customer_no like  '%" & txt_search & "%' OR customer_name like '%" & txt_search & "%')  "
        sql &= " ORDER BY month,customer_no"
        'Dim stable As DataTable = TokaiwsSQL.SelectSQL(sql).Tables(0)
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function

    Function load_customerdata(ByVal Toplv_cusdata As String, num_row_cusdata As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_cusdata
        sql &= " customer_code, customer_name, customer_short_name, file_import, update_by, record_date, created_by, update_time
        From tblCustomersName
                Where flag = '1'"
        If Toplv_cusdata <> "" Then sql &= " AND (customer_code Like N'%" & Toplv_cusdata & "%') Or (customer_name Like N'%" & Toplv_cusdata & "%') or (customer_short_name Like N'%" & Toplv_cusdata & "%')"
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function

    Function load_AV_losstime(ByVal Toplv_losstime As String, num_row_losstime As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_losstime
        sql &= " ltdate, ltmc, ltcode, ltshift, ltdetail, ltcreatby, ltlastupdate
        FROM  tblAVLossTime"
        If Toplv_losstime <> "" Then sql &= " WHERE (ltdate like N'%" & Toplv_losstime & "%')"
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function

    Function load_cusforecast(ByVal Toplv_cusforecast As String, plant_cusforecat As String, num_row_cusforcast As Integer) As DataTable
        Dim sql As String = "SELECT TOP " & num_row_cusforcast
        sql &= " month, file_import, update_by, record_date
        FROM  tblCustomersForecast
                    Where flag = '1'"
        If Toplv_cusforecast <> "" Then sql &= " (customer_no like N'%" & Toplv_cusforecast & "%') Or (customer_name like N'%" & Toplv_cusforecast & "%') Or (part_no like N'%" & Toplv_cusforecast & "%') Or (mfg_no like N'%" & Toplv_cusforecast & "%')"
        If plant_cusforecat <> 0 Then sql &= "AND (plant = '" & plant_cusforecat & "')"
        sql &= " AND import_type = 'MULTI' "
        sql &= "GROUP BY month, file_import, update_by, record_date"
        Dim json As String = TokaiwsSQL.SelectSQL_json(sql)
        Dim stable As DataTable = Newtonsoft.Json.JsonConvert.DeserializeObject(Of DataTable)(json)
        Return stable
    End Function

End Module
