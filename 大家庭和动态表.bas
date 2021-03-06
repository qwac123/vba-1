Attribute VB_Name = "大家庭和动态表"
Dim zuotian
Dim dajiating
Dim dongtaibiao
Sub 开始今天上午的工作()
'v1.2增加了向上滚屏代码
'v1.1 删掉了部分无用代码，现在打开动态表会正确显示在船舶状态表
''v1.0
'打开动态表和大家庭并显示动态表

'
Application.ScreenUpdating = False
Application.DisplayAlerts = False
If Weekday(Date, vbMonday) = 1 Then '如果今天是周一，就打开周五的；否则就打开昨天的
    zuotian = 3
Else
    zuotian = 1
End If
    Set dajiating = Workbooks.Open(Filename:=Format(Date - zuotian, "F:\\工作文档\\动态表（鼎衡大家庭）\\mm月\\动态表（鼎衡大家庭）yyyy-mm-dd.xl\sx"))

    Set dongtaibiao = Workbooks.Open(Filename:= _
        "\\192.168.0.223\\航运在线\\3.2、操作部\\4 船舶动态表\\" & Format(Date - zuotian, "yyyy\\mm月\\船舶动态（yyyy-mm-dd）.xl\sx"))
Sheets(1).Activate
ActiveWindow.SmallScroll Up:=20
Application.ScreenUpdating = 1
Application.DisplayAlerts = 1
Workbooks(Format(Date - zuotian, "船舶动态（yyyy-mm-dd）.xl\sx")).Activate
End Sub
Function 大家庭动态()
'v1.1 预计靠泊时间也写了一个简陋的函数进去
'v1.0
' 处理船舶动态 Macro
' 将船舶动态信息贴在K1格，首尾相接，然后整理到J列并分列，后接/分列去处理rob数据
'

'
If Range("k1") = "" Then
MsgBox "k1格是空的，是不是你已经点过一次了"
Exit Function
End If


Application.ScreenUpdating = False
Application.DisplayAlerts = False

Range("d4:e16").Interior.pattern = xlNone
    With Range("k1:k25") '处理复制过来的船舶动态
    .Replace What:="：", Replacement:=":", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    .Replace What:=" ", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    .Replace What:="鼎衡", Replacement:="DH", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    .Replace What:="建兴", Replacement:="JX", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    .Replace What:="轮", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    .Replace What:="妥", Replacement:="泊", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    End With

For Each rngk In Range("k1:k25")
    j = 4
    i = 0
    If InStr(1, rngk, ":") = 0 Then
        If i > 2 Then
            GoTo endchulidongtai
        End If
        i = i + 1
        GoTo nextrngk
    End If
    xinxi = Mid(rngk.Text, InStr(1, rngk.Text, ":") + 1, 999)
    xinxitou = Mid(rngk.Text, 1, InStr(4, rngk.Text, ":") - 1)
    For Each rnga In Range("a4:a20")
        If xinxitou = rnga Then
            Cells(j, 10) = xinxi
            GoTo nextrngk
        End If
        j = j + 1
    Next rnga
nextrngk:
Next rngk
endchulidongtai:    '动态处理完毕
Range("k1:k35").ClearContents
Range("j4:j15").Copy Range("k4:k15")
Range("a4:a15").Copy Range("j4:j15")
Range("a1") = "上海鼎衡船队动态信息一览表 " & Format(Date, "yyyy年m月d日 aaaa") '更新日期 Range("G1:I1").FormulaR1C1 = "=IF(RC=0,TEXT(NOW(),""yyyy年m月d日 aaaa""),RC)"
    Range("F4:F15").FormulaR1C1 = _
        "=IF(RC[1]<>"""",""开往""&MID(RC[1],5,3),IF(RC[2]<>"""",""锚泊""&MID(RC[2],5,3),IF(COUNT(FIND(""靠泊"",RC[5])),IF(SUM(ISNUMBER(FIND({""张家港"",""连云港"",""鲅鱼圈"",""仙人岛""},RC[5]))*1),MID(RC[5],FIND(""靠泊"",RC[5]),5),MID(RC[5],FIND(""靠泊"",RC[5]),4)),RC[6]&""完货"")))"
    Range("h4:h15").FormulaR1C1 = _
        "=IF(ISTEXT(RC[5]),""预计靠泊""&RC[5],"""")"
    
    

Set djt = ActiveWorkbook
Range("K4:k15").Copy '大家庭船舶动态复制到动态表
Call check_wk船舶动态

    Range("J4").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Range("L4").Select
        
    
djt.Activate
Range("h4").Select

Application.ScreenUpdating = True
Application.DisplayAlerts = True

If Dir(Format(Date, "F:\\工作文档\\动态表（鼎衡大家庭）\\mm月"), 16) = Empty Then
    MkDir Format(Date, "F:\\工作文档\\动态表（鼎衡大家庭）\\mm月")
End If
    ActiveWorkbook.SaveAs Filename:= _
        Format(Date, "F:\\工作文档\\动态表（鼎衡大家庭）\\mm月\\动态表（鼎衡大家庭）yyyy-mm-dd.xl\sx"), FileFormat:= _
        xlOpenXMLWorkbook, CreateBackup:=False
End Function
Function check_wk船舶动态()
'v1.0
On Error Resume Next '如果没这句话，涉及 wkjin 语句会报错
If Weekday(Date, vbMonday) = 1 Then '如果今天是周一，就打开周五的；否则就打开昨天的
    zuotian = 3
Else
    zuotian = 1
End If
Set wkjin = Workbooks(Format(Date, "船舶动态（yyyy-mm-dd）.xl\sx"))
Set wkzuo = Workbooks(Format(Date - zuotian, "船舶动态（yyyy-mm-dd）.xl\sx"))
If Len(wkjin.name) > 0 Then
    If Err.Number = 9 Then '如果wkjin打开了，就激活
        wkjin.Activate
    Else                    '否则就激活另一个
        wkzuo.Activate
    End If
End If
End Function
Function check_wk大家庭动态()
'v1.0
On Error Resume Next '如果没这句话，涉及 wkjin 语句会报错
If Weekday(Date, vbMonday) = 1 Then '如果今天是周一，就打开周五的；否则就打开昨天的
    zuotian = 3
Else
    zuotian = 1
End If
Set wkjin = Workbooks(Format(Date, "动态表（鼎衡大家庭）（yyyy-mm-dd）.xl\sx"))
Set wkzuo = Workbooks(Format(Date - zuotian, "动态表（鼎衡大家庭）（yyyy-mm-dd）.xl\sx"))
If Len(wkjin.name) > 0 Then
    If Err.Number = 9 Then '如果wkjin打开了，就激活
        wkjin.Activate
    Else                    '否则就激活另一个
        wkzuo.Activate
    End If
End If
End Function

Sub bbb动态表ISMSROB()

'v2处理ISMSROB
'v1.1
'删掉了了agent info表里面时间信息前的一个空格
'v1.0
Call check_wk船舶动态
Worksheets("Vessel Status").Activate
Dim i As Integer
Application.ScreenUpdating = False
Application.DisplayAlerts = False
'处理ISMSrob

    Range("o4:o15").Select
    Selection.Replace What:="油", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="重", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="轻", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="滑", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="淡", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="水", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="吨", Replacement:="MT", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    'Selection.Replace What:="轻", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    'Selection.Replace What:="滑", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    'Selection.Replace What:="淡", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False


For i = 4 To 15 Step 1
    ROB = Cells(i, 15).Text 'column "O"
    If InStr(1, ROB, ":") > 0 Then
        Cells(i, 15) = Mid(ROB, 9, InStr(11, ROB, "t") - 8) 'fo
        'Debug.Print Mid(rob, 9, InStr(11, rob, "t") - 8)
      Cells(i, 16) = Mid(ROB, InStr(16, ROB, ":") + 1, InStr(19, ROB, "t") - InStr(16, ROB, ":")) 'do
      'Debug.Print Mid(rob, InStr(16, rob, ":") + 1, InStr(19, rob, "t") - InStr(16, rob, ":")) 'do
      Cells(i, 17) = Mid(ROB, InStr(40, ROB, ":") + 1, InStr(46, ROB, "L") - InStr(40, ROB, ":")) 'lo
      'Debug.Print Mid(rob, InStr(40, rob, ":") + 1, InStr(46, rob, "L") - InStr(40, rob, ":")) 'lo
      Cells(i, 18) = Mid(ROB, InStr(27, ROB, ":") + 1, InStr(30, ROB, "t") - InStr(27, ROB, ":")) 'fw
      'Debug.Print Mid(rob, InStr(27, rob, ":") + 1, InStr(30, rob, "t") - InStr(27, rob, ":")) 'fw
    End If
    
    If InStr(1, ROB, "/") > 0 Then
        '分列rob
        Cells(i, 15).TextToColumns Destination:=Cells(i, 15), DataType:=xlDelimited, _
        TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=True, _
        Semicolon:=False, Comma:=False, Space:=False, Other:=True, OtherChar _
        :="/", FieldInfo:=Array(1, 1), TrailingMinusNumbers:=True
    
        '关闭分列
        Range("o4").TextToColumns Destination:=Range("o4"), DataType:=xlDelimited, _
        TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=True, _
        Semicolon:=False, Comma:=False, Space:=False, Other:=False, OtherChar _
        :="", FieldInfo:=Array(1, 1), TrailingMinusNumbers:=0
    End If
Next i
'恢复rob格式
    Range("O16").Copy
    Range("O4:R16").PasteSpecial Paste:=xlPasteFormats, Operation:=xlNone, _
        SkipBlanks:=False, Transpose:=False
    Application.CutCopyMode = False
    

    Sheets("agent info.").Range("a1").FormulaR1C1 = "船队当前航次代理信息(" & Format(Date, "yyyy年m月d日 aaaa") & ")" '更新日期"=IF(RC=0,TEXT(NOW(),""yyyy年m月d日 aaaa""&"")""),RC)"
    Sheets("coordinate info.").Range("a1").FormulaR1C1 = "业务协调会议内容(" & Format(Date, "yyyy年m月d日 aaaa") & ")"  '更新日期 "=IF(RC=0,TEXT(NOW(),""yyyy年m月d日 aaaa""&"")""),RC)"
'开始处理经纬度
    Windows("PERSONAL.xlsb").Activate
    Sheets("船位数据").Select
If Not Range("k5") = "" Then

    Range("K21:K35").Copy
    Call check_wk船舶动态
    Range("K4").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Workbooks("PERSONAL.xlsb").Sheets("船位数据").Rows("1:17").ClearContents
    Workbooks("PERSONAL.xlsb").Sheets("船位数据").Rows("1:17").ClearFormats
    
    
Else
  Call check_wk船舶动态
MsgBox "还没复制船舶经纬度"
End If

Application.ScreenUpdating = True
Application.DisplayAlerts = True
'保存今天
fileDirNAME = _
"\\192.168.0.223\\航运在线\\3.2、操作部\\4 船舶动态表\\" & Format(Date, "yyyy\\mm月\\船舶动态（yyyy-mm-dd）.xl\sx")
Debug.Print fileDirNAME
If Dir("\\192.168.0.223\\航运在线\\3.2、操作部\\4 船舶动态表\\" & Format(Date, "yyyy\\mm月"), 16) = Empty Then
    MkDir "\\192.168.0.223\\航运在线\\3.2、操作部\\4 船舶动态表\\" & Format(Date, "yyyy\\mm月")
End If

    dongtaibiao.SaveAs Filename:= _
        fileDirNAME, _
        FileFormat:=xlOpenXMLWorkbook, CreateBackup:=False

dajiating.Activate
End Sub
Function 大家庭下航次()
r = ActiveCell.Row
Set loadP = Cells(r, 4)
Set discP = Cells(r, 5)
Set NextV = Cells(r, 9)
Cells(r, 4) = Left(NextV.value, InStr(3, NextV.value, "-") - 1)
Cells(r, 5) = Right(NextV.value, Len(NextV.value) - InStr(3, NextV.value, "-"))
NextV = "待告"
End Function
Sub aaa快速下航次()
'v1.1下下航次能够粘贴回下航次格子
'v1.0
Dim kaishi, jieshu, i As Integer, str, abc As String
Dim r
Dim c
r = ActiveCell.Row
c = ActiveCell.Column
Application.ScreenUpdating = 0
Application.DisplayAlerts = 0
'首先统一航次命令格式
    Cells(r, 2).Select
    Selection.Replace What:="v", Replacement:="V", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Cells(r, 19).Select
    Selection.Replace What:="v", Replacement:="V", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:=Chr(10), Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="【", Replacement:="(", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="】", Replacement:=")", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="—", Replacement:="-", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="--", Replacement:="-", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="  ", Replacement:=" ", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="　", Replacement:=" ", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="，", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:=",", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="吨", Replacement:="MT", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="（", Replacement:="(", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="）", Replacement:=")", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
  '问号会替换整个格子  'Selection.Replace What:="?", Replacement:=" ", LookAt:=xlPart, _
    '    SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
      '  ReplaceFormat:=False
    Selection.Replace What:=" ", Replacement:=" ", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="　", Replacement:=" ", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    Selection.Replace What:="±5%", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False

str = Trim(Cells(r, 19).Text)
If str = "" Then
Exit Sub
End If

If Left(str, 1) <> "V" Then
str = "V" & str
'MsgBox "判断并添加开头V：" & str
End If

If Mid(str, 6, 1) = "&" Then
xiahangci1 = Right(str, Len(str) - 6)
str = Left(str, 5) & Right(str, Len(str) - 10) '如果V1234&有＆就把&后复制挪走
End If
If Len(str) > 49 Then
xiahangci2 = Right(str, Len(str) - InStr(17, str, "V1") + 1)
str = Trim(Left(str, InStr(17, str, "V1") - 1)) '如果太长，说明有两个航次信息，后面的航次信息挪走
End If
If Mid(str, 6, 1) = " " Then
str = Left(str, 5) & Right(str, Len(str) - 6) '去掉V1234 航里面的空格
End If
If Mid(str, 6, 1) <> "航" Then
str = Left(str, 5) & "航次命令" & Right(str, Len(str) - 5) 'v1234装卸货里加上航次命令
End If
If Mid(str, 10, 1) = " " Then
str = Left(str, 9) & Right(str, Len(str) - 10) 'v1234航次命令 装卸 去掉空格
End If
If Mid(str, 10, 1) <> "(" Then
str = Left(str, 9) & "(" & Right(str, Len(str) - 9) 'MsgBox "加入(：" & str
End If
If InStr(9, Left(str, Len(str) - 2), ")") <> 0 Then
str = Left(str, InStr(9, str, ")") - 1) & Right(str, Len(str) - InStr(9, str, ")")) 'MsgBox "删除货量前)：" & str
End If
If Mid(str, InStr(13, str, "T") - 6, 1) <> " " Then
str = Left(str, InStr(13, str, "T") - 6) & " " & Right(str, Len(str) - InStr(13, str, "T") + 6)
'MsgBox "货量前加空格：" & str
End If
If Mid(str, InStr(13, str, "T") + 1, 1) <> " " Then
str = Left(str, InStr(13, str, "T")) & " " & Right(str, Len(str) - InStr(13, str, "T"))
'MsgBox "货种前加空格：" & str
End If

If Right(str, 1) = "令" Then
str = Left(str, Len(str) - 4)
'MsgBox "删掉最后的航次命令：" & str
End If
If Right(str, 1) <> ")" Then
str = str & ")"
'MsgBox "最后加)：" & str
End If
Cells(r, 19) = str
        
 '处理完毕
 
' MsgBox "处理完毕" & i
 
 '航次结束，更新船舶航行计划

str = Cells(r, 19).Text
'MsgBox "s" & i & ":" & Left(str, 5)
'MsgBox "b" & i & ":" & Range("b" & i).Text
'MsgBox Range("b" & i).Text = Left(str, 5)

kao = InStr(10, str, "(", 1) + 1
'MsgBox kao
lenkao = InStr(12, str, "-", 1) - InStr(10, str, "(", 1) - 1

xie = InStr(12, Cells(r, 19), "-", 1) + 1
'MsgBox xie
lenxie = InStr(16, Cells(r, 19), " ", 1) - InStr(13, Cells(r, 19), "-", 1) - 1
'MsgBox lenxie
cargo = InStr(23, Cells(r, 19), " ", 1) + 1
'MsgBox cargo

lencar = InStr(25, Cells(r, 19), ")", 1) - InStr(23, Cells(r, 19), " ", 1) - 1
'MsgBox lencar
quanti = InStr(16, Cells(r, 19), " ", 1) + 1
'MsgBox quanti

Cells(r, 8).Copy Cells(r, 4)

Cells(r, 5) = ""

Cells(r, 6) = Mid(str, kao, lenkao)
Cells(r, 7) = ""
Cells(r, 8) = Mid(Cells(r, 19), xie, lenxie)

Cells(r, 9) = ""
Cells(r, 12) = Cells(r, 6)

Cells(r, 13) = Mid(Cells(r, 19), cargo, lencar)

Cells(r, 14) = Mid(Cells(r, 19), quanti, 6)

Cells(r, 19) = xiahangci1 & xiahangci2
Cells(r, c) = Left(str, 5)
endsub:
'航次更新结束

Cells(r, c).Select
Application.ScreenUpdating = True
Application.DisplayAlerts = True
End Sub
