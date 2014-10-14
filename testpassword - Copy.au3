#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.10.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here


#include<WinHttp.au3>
$hInternet = _WinHttpOpen()
$hConnect = _WinHttpConnect($hInternet, '203.113.115.151')
$total = 9999
ConsoleWrite("Prefix : ")
$b = ConsoleRead()
MsgBox(0,"",$b)
For $i = 0 to $total
_RunDOS( "cls" )
ConsoleWrite($i & " / " & $total)
$id = word($i)

$sPost = "dep_id=0000000000000&group=Student@3&user="&$id&"&pass=000000&pass2=000000&name=h&address=house&e-mail=a@a.com&tel=0000000000&faculty=6"
;$sResult = _WinHttpSimpleRequest($hConnect, "POST", '/phrapathom/ipassport/register/show.php', '', $sPost)
Sleep(1000)
Next
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hInternet)
Sleep(10000)

Func word($i)
	$len =StringLen($i);
	if($len = 1) Then
		Return "000"&$i
	ElseIf($len = 2) Then
		Return "00"&$i
	ElseIf($len = 3) Then
		Return "0"&$i
	Else
		return $i
	EndIf

EndFunc