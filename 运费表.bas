Attribute VB_Name = "运费表"
Sub 运费表()
Attribute 运费表.VB_ProcData.VB_Invoke_Func = " \n14"
'
' 运费表 Macro
'

'

Set Loco = ActiveCell

Application.ScreenUpdating = 0
Application.DisplayAlerts = 0
    Rows("1:1").Delete Shift:=xlUp '删除标题
    
    Range("B:B,D:e").Delete Shift:=xlToLeft '删除开票日期B和船+币D和发票号码


    Columns("H:H").Select
    Selection.NumberFormatLocal = "0.00_);[红色](0.00)"
    Selection.FormatConditions.Add Type:=xlExpression, Formula1:="=A1=""USD"""
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .color = 5296274
        .TintAndShade = 0
    End With
    
    Selection.FormatConditions(1).StopIfTrue = True
    With Selection
        .HorizontalAlignment = xlGeneral
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Columns("D:D").Select
    Selection.NumberFormatLocal = "0.00_);[红色](0.00)"
    Columns("E:E").Select
    Selection.Cut
    Columns("D:D").Select
    Selection.Insert Shift:=xlToRight
    Columns("E:E").Select
    Selection.Cut
    Columns("G:G").Select
    Selection.Insert Shift:=xlToRight
    Columns("G:G").Select
    Selection.Cut
    Range("E1").Select
    Selection.Insert Shift:=xlToRight
    Selection.ColumnWidth = 27


    Columns("D:D").Select '航线调整
    Selection.Replace What:="-", Replacement:="/", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="－", Replacement:="/", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="上海", Replacement:="shanghai", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="青峙", Replacement:="qingzhi", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="惠州", Replacement:="HUIZHOU", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="马尾", Replacement:="mawei", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="高雄", Replacement:="kaohsiung", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="麦寮", Replacement:="mailiao", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="海", Replacement:="hai", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="北", Replacement:="bei", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="港", Replacement:="gang", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="张家", Replacement:="zhangjia", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="珠", Replacement:="zhu", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="宁波", Replacement:="ningbo", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="连云", Replacement:="lianyun", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="钦州", Replacement:="qinzhou", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="茂名", Replacement:="maoming", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="漕泾", Replacement:="caojing", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="南京", Replacement:="nanjing", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="营口", Replacement:="yingkou", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="中山", Replacement:="zhongshan", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="江阴", Replacement:="jiangyin", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="大连", Replacement:="dalian", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="泉州", Replacement:="quanzhou", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="南", Replacement:="nan", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="通", Replacement:="tong", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="天津", Replacement:="tianjin", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="大丰", Replacement:="dafeng", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="东莞", Replacement:="dongguan", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="东营", Replacement:="dongying", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="厦门", Replacement:="xiamen", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="岚山", Replacement:="lanshan", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="台中", Replacement:="taichung", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="鲅鱼圈", Replacement:="bayuquan", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="嘉兴", Replacement:="jiaxing", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="汕头", Replacement:="shantou", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="青岛", Replacement:="qingdao", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="吴泾", Replacement:="wujing", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="州", Replacement:="zhou", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="浦", Replacement:="pu", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="常", Replacement:="chang", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="洋", Replacement:="yang", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="八所", Replacement:="basuo", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="揭阳", Replacement:="jieyang", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="温", Replacement:="wen", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="莱", Replacement:="lai", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="大榭", Replacement:="daxie", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="山", Replacement:="shan", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="舟", Replacement:="zhou", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="镇", Replacement:="zhen", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="烟台", Replacement:="yantai", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="熟", Replacement:="shu", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="乍", Replacement:="zha", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="仪征", Replacement:="yizheng", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="小虎岛", Replacement:="xiaohudao", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="麦廖", Replacement:="mailiao", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="江", Replacement:="jiang", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="门", Replacement:="men", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="潍坊", Replacement:="weifang", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="天健", Replacement:="tianjin", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="广", Replacement:="guang", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="京唐", Replacement:="jingtang", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="石井", Replacement:="shijing", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="泰兴", Replacement:="taixing", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="锦", Replacement:="jin", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="三水", Replacement:="guangdong", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="如东", Replacement:="RUDONG, JIANGSU", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False




'公司
    Columns("E:E").Select
    Selection.Replace What:="SOPO INTERNATIONAL LIMITED", Replacement:="SOPO INTERNATIONAL LTD", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="舟山市和兴船务有限公司嘉善分公司", Replacement:="ZHOUSHAN HEXING SHIPPING CO.,LTD.", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="惠州惠菱化成有限公司", Replacement:="Huizhou MMA Co.,Ltd", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="扬子石化 -巴斯夫有限责任公司", Replacement:="扬子石化-巴斯夫有限责任公司", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
        
        
        
'货名
    Columns("F:F").Select
    Selection.Replace What:="冰醋酸", Replacement:="Acetic acid", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="醋酸乙烯", Replacement:="VINYL ACETATE", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="丙烯腈", Replacement:="AN", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="二甲基甲酰胺", Replacement:="Dimethylformamide", LookAt _
        :=xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False _
        , ReplaceFormat:=False
    Selection.Replace What:="纯苯", Replacement:="BENZENE", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="苯酚", Replacement:="Phenol", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="混合二甲苯", Replacement:="MIX XYLENE", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="对二甲苯", Replacement:="PARAXYLENE", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="二甲苯", Replacement:="Xylenes", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="甲苯", Replacement:="TOLUENE", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="碳9", Replacement:="C-9", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="碳九", Replacement:="C-9", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="C9", Replacement:="C-9", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="苯乙烯", Replacement:="STYRENE MONOMER", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="丙酮", Replacement:="Acetone", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="act", Replacement:="Acetone", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="甲醇", Replacement:="Methanol", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="乙醇", Replacement:="ethanol", LookAt:=xlWhole, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="辛醇", Replacement:="Octanol (all isomers)", LookAt _
        :=xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False _
        , ReplaceFormat:=False
    Selection.Replace What:="乙二醇", Replacement:="Ethylene glycol", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="正丁醇", Replacement:="n-Butyl alcohol", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="异壬醇", Replacement:="ISONONYL ALCOHOL", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="AN", Replacement:="AN(acrylonitrile)", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=True, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="丙烯晴", Replacement:="AN(acrylonitrile)", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=True, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="混二甲苯", Replacement:="MIX XYLENE", LookAt:= _
        xlWhole, SearchOrder:=xlByRows, MatchCase:=True, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="甲甲酯", Replacement:="Methyl methacrylate", LookAt _
        :=xlWhole, SearchOrder:=xlByRows, MatchCase:=True, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="甲基丙烯酸甲酯", Replacement:="Methyl methacrylate", LookAt _
        :=xlWhole, SearchOrder:=xlByRows, MatchCase:=True, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="乙酸乙酯", Replacement:="acetic ether", LookAt _
        :=xlWhole, SearchOrder:=xlByRows, MatchCase:=True, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="乙酸乙烯酯", Replacement:="VINYL ACETATE", LookAt _
        :=xlWhole, SearchOrder:=xlByRows, MatchCase:=True, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="工业用乙酸乙烯酯", Replacement:="VINYL ACETATE", LookAt _
        :=xlWhole, SearchOrder:=xlByRows, MatchCase:=True, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="甲基叔丁基醚", Replacement:="Methyl tert butyl ether", LookAt _
        :=xlWhole, SearchOrder:=xlByRows, MatchCase:=True, SearchFormat:=False, _
        ReplaceFormat:=False


Application.ScreenUpdating = 1
Application.DisplayAlerts = 1
Loco.Select
End Sub
Sub 清空收入清单()
Attribute 清空收入清单.VB_ProcData.VB_Invoke_Func = " \n14"
'
' Macro6 Macro
'

'
    ActiveWorkbook.Worksheets("收入清单2017").AutoFilter.Sort.SortFields.Clear
    ActiveWorkbook.Worksheets("收入清单2017").AutoFilter.Sort.SortFields.Add Key:= _
        Range("C1:C614"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption _
        :=xlSortNormal
    With ActiveWorkbook.Worksheets("收入清单2017").AutoFilter.Sort
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
    ActiveWorkbook.Worksheets("收入清单2017").AutoFilter.Sort.SortFields.Clear
    ActiveWorkbook.Worksheets("收入清单2017").AutoFilter.Sort.SortFields.Add Key:= _
        Range("B1:B614"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption _
        :=xlSortNormal
    With ActiveWorkbook.Worksheets("收入清单2017").AutoFilter.Sort
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub

Sub 拆分运费表()
Attribute 拆分运费表.VB_ProcData.VB_Invoke_Func = " \n14"
'
'

'
Application.ScreenUpdating = 0
Application.DisplayAlerts = 0
Sheets("收入清单2017").Select
kaitou = 2
weiba = Range("a1").End(xlDown).Row
For i = 2 To weiba
    If Cells(i, 2) <> Cells(i + 1, 2) Then
        Sheets.Add After:=Sheets(Sheets.Count)
        Sheets(Sheets.Count).Name = Sheets("收入清单2017").Cells(i, 2).Text
        Sheets("收入清单2017").Rows("1:1").Copy Sheets(Sheets.Count).Rows("1:1")
        Sheets("收入清单2017").Rows(kaitou & ":" & i).Copy Sheets(Sheets.Count).Range("a2")
        kaitou = i + 1
        Sheets(Sheets.Count).Range("A1").AutoFilter
        Sheets("收入清单2017").Select
        
    End If
Next i
Application.ScreenUpdating = 1
Application.DisplayAlerts = 1
End Sub
Sub 另存或保存()
Attribute 另存或保存.VB_ProcData.VB_Invoke_Func = " \n14"
'


'
 
If Dir("F:\工作文档\动态表(鼎衡大家庭）\10月\2.xlsx") Then
    ActiveWorkbook.Save
Else: ActiveWorkbook.SaveAs Filename:="F:\工作文档\动态表(鼎衡大家庭）\10月\1.xlsx", _
        FileFormat:=xlOpenXMLWorkbook, CreateBackup:=False
End If
End Sub
