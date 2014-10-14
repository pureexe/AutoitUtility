#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=console1x32.Exe
#AutoIt3Wrapper_Outfile_x64=console1.Exe
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.10.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include<Process.au3>
#include<WinHttp.au3>
$hInternet = _WinHttpOpen()
$hConnect = _WinHttpConnect($hInternet, '203.113.115.151')
$total = 9999
ConsoleWrite("Phrapathom Wittayalai : Login server "&@CRLF&"-------------------------------------------------------------------------------"&@CRLF)
If $CMDLINE[0] < 1 Then
	ConsoleWrite("Sorry,please use syntax 'pt-regis.exe <count> <prefix>'")
	While True
	WEnd
EndIf
If $CMDLINE[1] > 9999 Then
	ConsoleWrite("Sorry, Can't Excute more than 9999 times")
	While True
	WEnd
EndIf
IF $CMDLINE[0] > 1 Then
	$prefix = $CMDLINE[2]
	$total = $CMDLINE[1]
Else
	$prefix = ""
	$total = $CMDLINE[1]
EndIf
For $i = 0 to $total
	$id = $prefix & word($i)
	_RunDos("cls")
	ConsoleWrite("Phrapathom Wittayalai : Login server "&@CRLF&"-------------------------------------------------------------------------------"&@CRLF)
	ConsoleWrite("Registering : "&$id)
	$sPost = "dep_id=0000000000000&group=Student@3&user="&$id&"&pass="&$id&"&pass2="&$id&"&name=me&address=house&e-mail=me@pt-lms.com&tel=0000000000&faculty=6"
	$sResult = _WinHttpSimpleRequest($hConnect, "POST", '/phrapathom/ipassport/register/show.php', '', $sPost)
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