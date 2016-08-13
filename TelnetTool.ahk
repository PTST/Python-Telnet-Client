SetWorkingDir, m:/
;SetWorkingDir, C:\Users\PTST

Gui, Add, Text, x12 y9 w80 h20 +Vertical +Right +, Router IP: 		;Router IP label
Gui, Add, Text, x12 y39 w80 h20 +Right, Root Password: 				;Root Password
Gui, Add, Edit, x102 y9 w170 h20 vrouterIP,			 				;Router IP input
Gui, Add, Edit, x102 y39 w170 h20 vrootPW,							;Root password input
Gui, Add, Button, x282 y9 w160 h20 , Ping 							;Ping knap
Gui, Add, Button, x282 y39 w160 h20 gButtonReset, Reset CPE 		;Reset knap
Gui, Add, Button, x12 y69 w100 h20 , ACS
Gui, Add, Button, x122 y69 w100 h20 gButtonConnectionStats, Connection Stats 		;Connection stats knap
Gui, Add, Button, x232 y69 w100 h20 gButtonFixH, Fix H Firmware 	;Fix H firmware knap
Gui, Add, Button, x342 y69 w100 h20 gButtonPort, Port Forward 		;Port forward knap
Gui, Add, Edit, x12 y129 w430 h530 voutput, 						;output box
Gui, Add, Progress, x12 y99 w430 h20 vprogress, 100 				;Loading bar
Gui, Add, Text, x461 y10 w1 h648 0x7 ;Vertical Line > Black, 		;skillelinje
Gui, Add, Text, x472 y9 w50 h20 +Right, Enheds ip: 					;Enheds ip label
Gui, Add, Edit, x532 y9 w160 h20 vunitIP,							;Enheds ip input
Gui, Add, DropDownList, x532 y39 w160 gportChoice vportChoice, Apple TV|Canal Digital GO|Chromecast|Dankort|Playstation 4|Sonos|Xbox 360|Xbox One 		;dropdown til portvalg
Gui, Add, Edit, x532 y69 w160 h20 vunitName,
Gui, Add, Text, x472 y69 w50 h20 +right, Navn
Gui, Add, Edit, x532 y99 w160 h20 vport1, 							;Inputs før portvalg
Gui, Add, Edit, x532 y129 w160 h20 vport2 ,
Gui, Add, Edit, x532 y159 w160 h20 vport3 ,
Gui, Add, Edit, x532 y189 w160 h20 vport4 ,
Gui, Add, Edit, x532 y219 w160 h20 vport5 ,
Gui, Add, Edit, x532 y249 w160 h20 vport6 ,
Gui, Add, Edit, x532 y279 w160 h20 vport7 ,
Gui, Add, Edit, x532 y309 w160 h20 vport8 ,
Gui, Add, Edit, x532 y339 w160 h20 vport9 ,
Gui, Add, Edit, x532 y369 w160 h20 vport10 ,
Gui, Add, Edit, x532 y399 w160 h20 vport11 ,
Gui, Add, Edit, x532 y429 w160 h20 vport12 ,
Gui, Add, Edit, x532 y459 w160 h20 vport13 ,
Gui, Add, Edit, x532 y489 w160 h20 vport14 ,
Gui, Add, Edit, x532 y519 w160 h20 vport15 ,
Gui, Add, Text, x472 y99 w50 h20 +Right, Port 1 					;Labels til portvalg
Gui, Add, Text, x472 y129 w50 h20 +Right, Port 2
Gui, Add, Text, x472 y159 w50 h20 +Right, Port 3
Gui, Add, Text, x472 y189 w50 h20 +Right, Port 4
Gui, Add, Text, x472 y219 w50 h20 +Right, Port 5
Gui, Add, Text, x472 y249 w50 h20 +Right, Port 6
Gui, Add, Text, x472 y279 w50 h20 +Right, Port 7
Gui, Add, Text, x472 y309 w50 h20 +Right, Port 8
Gui, Add, Text, x472 y339 w50 h20 +Right, Port 9
Gui, Add, Text, x472 y369 w50 h20 +Right, Port 10
Gui, Add, Text, x472 y399 w50 h20 +Right, Port 11
Gui, Add, Text, x472 y429 w50 h20 +Right, Port 12
Gui, Add, Text, x472 y459 w50 h20 +Right, Port 13
Gui, Add, Text, x472 y489 w50 h20 +Right, Port 14
Gui, Add, Text, x472 y519 w50 h20 +Right, Port 15
Gui, Add, Button, x472 y549 w100 h30 , Luk							;Knap til at lukke portvalg
Gui, Add, Button, x592 y549 w100 h30 gButtonPortSet, Sæt Porte 					;knap til at køre portforward kommando
; Generated using SmartGUI Creator 4.0
Gui, Show, h672 w460, TelnetTool
Gui, Add, CheckBox, x642 y639 w50 h20 vdebug, Debug

Return


ButtonFixH:
Gui, Submit, Nohide

SetKeyDelay,-1,10,
SendMode, Input
DetectHiddenWindows On

GuiControl,, progress, 0
if debug=1
	Run %ComSpec% /k ,,,PID1                                ;try this first
Else
	Run %ComSpec% /k ,,hide,PID1                             ;opens DOS hidden

WinWait %ComSpec% ahk_pid %PID1%
WinActivate ahk_pid %PID1%
sleep,500
GuiControl,, progress, 10
ControlSend, ,telnet %routerIP% 23023 -f log.txt,ahk_pid %PID1%, , ,                  ;go to c:\
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,500
GuiControl,, progress, 20
ControlSend, ,support,ahk_pid %PID1%, , ,              ;Brugernavn
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,500
GuiControl,, progress, 30
ControlSend, ,%rootPW%,ahk_pid %PID1%, , ,                ;Root password
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,500
GuiControl,, progress, 40
ControlSend, ,:dns client dnsadd addr=212.242.40.3 port=53,ahk_pid %PID1%, , ,     ;Connection Stats
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 50
sleep,500
ControlSend, ,:dns client dnsadd addr=212.242.40.51 port=53,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 60
sleep,500
GuiControl,, progress, 70
ControlSend, ,:saveall,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
Sleep 2000
GuiControl,, progress, 80
WinClose ahk_pid %PID1%
Process, WaitClose, %PID1%, 5
Sleep 1000
GuiControl,, progress, 90
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,1000
GuiControl,, progress, 95
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
Process, WaitClose, %PID1%, 5


FileRead, outputLog, log.txt
FileDelete, log.txt

output2=%output%
GuiControl, , output, %output2%`r`nFix er nu kørt, forsøger at pinge %routerIP%.
GuiControl Focus, output
send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
GuiControl,, progress, 100

Sleep 2000

loop
{
	Gui, Submit, Nohide
	SetKeyDelay,-1,1,
	SendMode, Input
	DetectHiddenWindows On

	output2=%output%

	GuiControl,, progress, 0
	if debug=1
		Run %ComSpec% /k ,,,PID1                                ;try this first
	Else
		Run %ComSpec% /k ,,hide,PID1                             ;opens DOS hidden

	WinWait %ComSpec% ahk_pid %PID1%
	WinActivate ahk_pid %PID1%
	sleep,500
	GuiControl,, progress, 50
	ControlSend, ,ping %routerIP% -n 1 >> log.txt,ahk_pid %PID1%, , ,                  ;go to c:\
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,100
	ControlSend, ,exit,ahk_pid %PID1%, , ,
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	GuiControl,, progress, 100
	Process, WaitClose, %PID1%, 5

	FileRead, outputLog, log.txt
	FileDelete, log.txt

	If outputLog contains Reply from
		{
			RegExMatch(outputLog, "time=(?P<Time>[0-9]+ms) TTL", pingResponse)
			GuiControl, , output, %output2%`r`nRouter er nu oppe og pinger med %pingResponseTime%`n
			GuiControl Focus, output
			send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
			Break
		}
	Else
		{
			GuiControl, , output, %output2%.
			GuiControl Focus, output
			send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
		}

}

Return

ButtonPortSet:
Gui, Submit, Nohide

SetKeyDelay,-1,10,
SendMode, Input
DetectHiddenWindows On

GuiControl,, progress, 0

if debug=1
	Run %ComSpec% /k ,,,PID1                                ;try this first
Else
	Run %ComSpec% /k ,,hide,PID1                             ;opens DOS hidden

WinWait %ComSpec% ahk_pid %PID1%
WinActivate ahk_pid %PID1%
sleep,500
ControlSend, ,telnet %routerIP% 23023 -f log.txt,ahk_pid %PID1%, , ,                  ;go to c:\
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
ControlSend, ,support,ahk_pid %PID1%, , ,              ;Brugernavn
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
ControlSend, ,%rootPW%,ahk_pid %PID1%, , ,                ;Root password
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
ControlSend, ,:dhcp server lease list,ahk_pid %PID1%, , ,                ;Root password
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100

GuiControl,, progress, 10

ControlSend, ,:upnp config safenat=disabled,ahk_pid %PID1%, , ,     ;Slå extended security
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100

if port1!=
{
	;Port1 telnet
	ControlSend, ,:service host add name=%unitName%1,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%1 protocol=any portrange=%port1%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%1 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 15

if port2!=
{
	;Port2 telnet
	ControlSend, ,:service host add name=%unitName%2,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%2 protocol=any portrange=%port2%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%2 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 20

if port3!=
{
	;Port3 telnet
	ControlSend, ,:service host add name=%unitName%3,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%3 protocol=any portrange=%port3%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%3 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 25

if port4!=
{
	;Port4 telnet
	ControlSend, ,:service host add name=%unitName%4,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%4 protocol=any portrange=%port4%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%4 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 30

if port5!=
{
	;Port5 telnet
	ControlSend, ,:service host add name=%unitName%5,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%5 protocol=any portrange=%port5%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%5 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 35

if port6!=
{
	;Port6 telnet
	ControlSend, ,:service host add name=%unitName%6,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%6 protocol=any portrange=%port6%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%6 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 40

if port7!=
{
	;Port7 telnet
	ControlSend, ,:service host add name=%unitName%7,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%7 protocol=any portrange=%port7%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%7 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 45

if port8!=
{
	;Port8 telnet
	ControlSend, ,:service host add name=%unitName%8,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%8 protocol=any portrange=%port8%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%8 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 50

if port9!=
{
	;Port9 telnet
	ControlSend, ,:service host add name=%unitName%9,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%9 protocol=any portrange=%port9%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%9 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 55

if port10!=
{
	;Port10 telnet
	ControlSend, ,:service host add name=%unitName%10,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%10 protocol=any portrange=%port10%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%10 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 60

if port11!=
{
	;Port11 telnet
	ControlSend, ,:service host add name=%unitName%11,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%11 protocol=any portrange=%port11%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%11 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 65

if port12!=
{
	;Port12 telnet
	ControlSend, ,:service host add name=%unitName%12,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%12 protocol=any portrange=%port12%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%12 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 70

if port13!=
{
	;Port13 telnet
	ControlSend, ,:service host add name=%unitName%13,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%13 protocol=any portrange=%port13%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%13 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 75

if port14!=
{
	;Port14 telnet
	ControlSend, ,:service host add name=%unitName%14,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%14 protocol=any portrange=%port14%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%14 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 80

if port15!=
{
	;Port15 telnet
	ControlSend, ,:service host add name=%unitName%15,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host rule add name=%unitName%15 protocol=any portrange=%port15%,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
	ControlSend, ,:service host assign name=%unitName%15 host=%unitIP% log=disabled,ahk_pid %PID1%, , ,     ;
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,500
}

GuiControl,, progress, 85

ControlSend, ,saveall,ahk_pid %PID1%, , ,     ;
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,10000

GuiControl,, progress, 90

ControlSend, ,nat maplist,ahk_pid %PID1%, , ,     ;
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,3000

GuiControl,, progress, 95

ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,1000
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
Process, WaitClose, %PID1%, 5

FileRead, outputLog, log.txt
FileDelete, log.txt

if port1 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port1 . "\]", port1Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port1, port1Result)

if port2 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port2 . "\]", port2Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port2, port2Result)

if port3 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port3 . "\]", port3Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port3, port3Result)

if port4 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port4 . "\]", port4Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port4, port4Result)

if port5 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port5 . "\]", port5Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port5, port5Result)

if port6 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port6 . "\]", port6Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port6, port6Result)

if port7 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port7 . "\]", port7Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port7, port7Result)

if port8 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port8 . "\]", port8Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port8, port8Result)

if port9 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port9 . "\]", port9Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port9, port9Result)

if port10 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port10 . "\]", port10Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port10, port10Result)

if port11 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port11 . "\]", port11Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port11, port11Result)

if port12 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port12 . "\]", port12Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port12, port12Result)

if port13 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port13 . "\]", port13Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port13, port13Result)

if port14 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port14 . "\]", port14Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port14, port14Result)

if port15 contains -
	RegExMatch(outputlog, unitIP . ":\[" . port15 . "\]", port15Result)
Else
	RegExMatch(outputlog, unitIP . ":" . port15, port15Result)

openPorts:="Der er nu åbnet for"
if port1!=
	openPorts:=openPorts . ", Port " . port1
if port2!=
	openPorts:=openPorts . ", Port " . port2
if port3!=
	openPorts:=openPorts . ", Port " . port3
if port4!=
	openPorts:=openPorts . ", Port " . port4
if port5!=
	openPorts:=openPorts . ", Port " . port5
if port6!=
	openPorts:=openPorts . ", Port " . port6
if port7!=
	openPorts:=openPorts . ", Port " . port7
if port8!=
	openPorts:=openPorts . ", Port " . port8
if port9!=
	openPorts:=openPorts . ", Port " . port9
if port10!=
	openPorts:=openPorts . ", Port " . port10
if port11!=
	openPorts:=openPorts . ", Port " . port11
if port12!=
	openPorts:=openPorts . ", Port " . port12
if port13!=
	openPorts:=openPorts . ", Port " . port13
if port14!=
	openPorts:=openPorts . ", Port " . port14
if port15!=
	openPorts:=openPorts . ", Port " . port15

RegExMatch(outputlog, "ms)" . unitIP . ".*?(?P<MAC2>..:..:..:..:......*?)\s", unit)
unitMAC:=RegExReplace(unitMAC2, "\s")

if debug=1
	Run %ComSpec% /k ,,,PID1                                ;try this first
Else
	Run %ComSpec% /k ,,hide,PID1                             ;opens DOS hidden

WinWait %ComSpec% ahk_pid %PID1%
WinActivate ahk_pid %PID1%
sleep,500
ControlSend, ,telnet %routerIP% 23023,ahk_pid %PID1%, , ,                  ;go to c:\
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
ControlSend, ,support,ahk_pid %PID1%, , ,              ;Brugernavn
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
ControlSend, ,%rootPW%,ahk_pid %PID1%, , ,             ;Root password
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
ControlSend, ,:dhcp server lease add clientid=%unitMAC% pool=LAN_private addr=%unitIP% leasetime=0,ahk_pid %PID1%, , ,               
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,500
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,500
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
Process, WaitClose, %PID1%, 5


output2=%output%
GuiControl, , output, %output2%`r`n%openPorts% til %unitIP%.`n
GuiControl Focus, output
send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
GuiControl,, progress, 100
Return

ButtonLuk:
Gui, Show, h672 w460, TelnetTool
Return

ButtonPort:
Gui, Show, h672 w700, TelnetTool
Return

ButtonPing:
Gui, Submit, Nohide
output2=%output%

SetKeyDelay,-1,1,
SendMode, Input
DetectHiddenWindows On

GuiControl,, progress, 0
if debug=1
	Run %ComSpec% /k ,,,PID1                                ;try this first
Else
	Run %ComSpec% /k ,,hide,PID1                             ;opens DOS hidden

WinWait %ComSpec% ahk_pid %PID1%
WinActivate ahk_pid %PID1%
sleep,500
GuiControl,, progress, 50
ControlSend, ,ping %routerIP% -n 1 >> log.txt,ahk_pid %PID1%, , ,                  ;go to c:\
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 100
Process, WaitClose, %PID1%, 5

FileRead, outputLog, log.txt
FileDelete, log.txt

If outputLog contains Reply from
	{
		RegExMatch(outputLog, "time=(?P<Time>[0-9]+ms) TTL", pingResponse)
		GuiControl, , output, %output2%`r`n%routerIP% Pinger med %pingResponseTime%`n
		GuiControl Focus, output
		send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
	}

Else
	{
		GuiControl, , output, %output2%`r`n%routerIP% pinger ikke`n
		GuiControl Focus, output
		send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
	}

Return

ButtonReset:
Gui, Submit, Nohide

SetKeyDelay,-1,-1,
SendMode, Input
DetectHiddenWindows On

GuiControl,, progress, 0
if debug=1
	Run %ComSpec% /k ,,,PID1                                ;try this first
Else
	Run %ComSpec% /k ,,hide,PID1                             ;opens DOS hidden

WinWait %ComSpec% ahk_pid %PID1%
WinActivate ahk_pid %PID1%
sleep,500
GuiControl,, progress, 20
ControlSend, ,telnet %routerIP% 23023 -f log.txt,ahk_pid %PID1%, , ,                  ;go to c:\
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
GuiControl,, progress, 40
ControlSend, ,support,ahk_pid %PID1%, , ,              ;Brugernavn
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
GuiControl,, progress, 50
ControlSend, ,%rootPW%,ahk_pid %PID1%, , ,                ;Root password
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
GuiControl,, progress, 70
ControlSend, ,system reset,ahk_pid %PID1%, , ,     ;Connection Stats
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 75
sleep,100
ControlSend, ,1,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 80
sleep,1000
GuiControl,, progress, 90
ControlSend, ,1,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
Sleep 2000
GuiControl,, progress, 100
WinClose ahk_pid %PID1%
Process, WaitClose, %PID1%, 5


FileRead, outputLog, log.txt
FileDelete, log.txt

output2=%output%
GuiControl, , output, %output2%`r`nRouter er i gang med at resette.
GuiControl Focus, output
send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn} 
GuiControl,, progress, 100

Sleep 10000

loop
{
	Gui, Submit, Nohide
	SetKeyDelay,-1,1,
	SendMode, Input
	DetectHiddenWindows On

	output2=%output%

	GuiControl,, progress, 0
	if debug=1
		Run %ComSpec% /k ,,,PID1                                ;try this first
	Else
		Run %ComSpec% /k ,,hide,PID1                             ;opens DOS hidden

	WinWait %ComSpec% ahk_pid %PID1%
	WinActivate ahk_pid %PID1%
	sleep,500
	GuiControl,, progress, 50
	ControlSend, ,ping %routerIP% -n 1 >> log.txt,ahk_pid %PID1%, , ,                  ;go to c:\
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	sleep,100
	ControlSend, ,exit,ahk_pid %PID1%, , ,
	ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
	GuiControl,, progress, 100
	Process, WaitClose, %PID1%, 5

	FileRead, outputLog, log.txt
	FileDelete, log.txt

	If outputLog contains Reply from
		{
			RegExMatch(outputLog, "time=(?P<Time>[0-9]+ms) TTL", pingResponse)
			GuiControl, , output, %output2%`r`nRouter er oppe igen og pinger med %pingResponseTime%`n
			GuiControl Focus, output
			send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
			Break
		}
	Else
		{
			GuiControl, , output, %output2%.	
			GuiControl Focus, output
			send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
		}

}

Return

ButtonConnectionStats:
Gui, Submit, Nohide

SetKeyDelay,-1,-1,
SendMode, Input
DetectHiddenWindows On

GuiControl,, progress, 0
if debug=1
	Run %ComSpec% /k ,,,PID1                                ;try this first
Else
	Run %ComSpec% /k ,,hide,PID1                             ;opens DOS hidden

WinWait %ComSpec% ahk_pid %PID1%
WinActivate ahk_pid %PID1%
sleep,500
GuiControl,, progress, 20
ControlSend, ,telnet %routerIP% 23023 -f log.txt,ahk_pid %PID1%, , ,                  ;go to c:\
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
GuiControl,, progress, 40
ControlSend, ,support,ahk_pid %PID1%, , ,              ;Brugernavn
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
GuiControl,, progress, 50
ControlSend, ,%rootPW%,ahk_pid %PID1%, , ,                ;Root password
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
GuiControl,, progress, 70
ControlSend, ,connection stats,ahk_pid %PID1%, , ,     ;Connection Stats
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 75
sleep,100
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 80
sleep,1000
GuiControl,, progress, 90
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 95
Process, WaitClose, %PID1%, 5


FileRead, outputLog, log.txt
FileDelete, log.txt

RegExMatch(outputLog, "Number of active connections\s+: (?P<Connections>[0-9]+)", active)

output2=%output%
GuiControl, , output, %output2%`r`nAktive fobindelser: %activeConnections%`n
GuiControl Focus, output
send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
GuiControl,, progress, 100
Return

ButtonAcs:
Gui, Submit, Nohide

SetKeyDelay,-1,-1,
SendMode, Input
DetectHiddenWindows On

GuiControl,, progress, 0
if debug=1
	Run %ComSpec% /k ,,,PID1                                ;try this first
Else
	Run %ComSpec% /k ,,hide,PID1                             ;opens DOS hidden

WinWait %ComSpec% ahk_pid %PID1%
WinActivate ahk_pid %PID1%
sleep,500
GuiControl,, progress, 5
ControlSend, ,telnet %routerIP% 23023 -f log.txt,ahk_pid %PID1%, , ,                  ;go to c:\
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
GuiControl,, progress, 10
ControlSend, ,support,ahk_pid %PID1%, , ,              ;Brugernavn
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
GuiControl,, progress, 15
ControlSend, ,%rootPW%,ahk_pid %PID1%, , ,                ;Root password
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,100
GuiControl,, progress, 20
ControlSend, ,wireless acs rescan,ahk_pid %PID1%, , ,     ;rescan
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,1000
GuiControl,, progress, 30
sleep,1000
GuiControl,, progress, 40
sleep,1000
GuiControl,, progress, 50
sleep,1000
GuiControl,, progress, 60
sleep,1000
GuiControl,, progress, 70
ControlSend, ,wireless acs scanreport,ahk_pid %PID1%, , ,     ;rescan
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
sleep,1000
GuiControl,, progress, 75
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 80
sleep,1000
GuiControl,, progress, 90
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
ControlSend, ,exit,ahk_pid %PID1%, , ,
ControlSend, ,{enter},ahk_pid %PID1%, , ,              ;enter
GuiControl,, progress, 95
Process, WaitClose, %PID1%, 5


FileRead, outputLog, log.txt
FileDelete, log.txt

RegExMatch(outputLog, "ms)MHz:.*?(?P<ch1>1).*?(?P<ch1Noise>-[0-9]+).*?(?P<ch2>2).*?(?P<ch2Noise>-[0-9]+).*?(?P<ch3>3).*?(?P<ch3Noise>-[0-9]+).*?(?P<ch4>4).*?(?P<ch4Noise>-[0-9]+).*?(?P<ch5>5).*?(?P<ch5Noise>-[0-9]+).*?(?P<ch6>6).*?(?P<ch6Noise>-[0-9]+).*?(?P<ch7>7).*?(?P<ch7Noise>-[0-9]+).*?(?P<ch8>8).*?(?P<ch8Noise>-[0-9]+).*?(?P<ch9>9).*?(?P<ch9Noise>-[0-9]+).*?(?P<ch10>10).*?(?P<ch10Noise>-[0-9]+).*?(?P<ch11>11).*?(?P<ch11Noise>-[0-9]+).*?(?P<ch12>12).*?(?P<ch12Noise>-[0-9]+).*?(?P<ch13>13).*?(?P<ch13Noise>-[0-9]+).*?ACS selected channel.*?(?P<selected>[0-9]+)", acs_)

output2=%output%
GuiControl, , output, %output2%`r`nKanal		Støjtal`n1		%acs_ch1Noise%`n2		%acs_ch2Noise%`n3		%acs_ch3Noise%`n4		%acs_ch4Noise%`n5		%acs_ch5Noise%`n6		%acs_ch6Noise%`n7		%acs_ch7Noise%`n8		%acs_ch8Noise%`n9		%acs_ch9Noise%`n10		%acs_ch10Noise%`n11		%acs_ch11Noise%`n12		%acs_ch12Noise%`n13		%acs_ch13Noise%`n`nACS har valgt kanal %acs_selected%.`n
GuiControl Focus, output
send {PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}{PgDn}
GuiControl,, progress, 100
Return


portChoice:
Gui, Submit, NoHide
If portChoice=Apple TV
	{
		GuiControl, , unitName, atv
		GuiControl, , port1, 80
		GuiControl, , port2, 443
		GuiControl, , port3, 53
		GuiControl, , port4, 5353
		GuiControl, , port5, 123
		GuiControl, , port6, 3689
		GuiControl, , port7, 
		GuiControl, , port8, 
		GuiControl, , port9, 
		GuiControl, , port10, 
		GuiControl, , port11, 
		GuiControl, , port12, 
		GuiControl, , port13, 
		GuiControl, , port14, 
		GuiControl, , port15, 
	}

Else if portChoice=Canal Digital GO
	{
		GuiControl, , unitName, cdg
		GuiControl, , port1, 80
		GuiControl, , port2, 8080
		GuiControl, , port3, 8888
		GuiControl, , port4, 8889
		GuiControl, , port5,
		GuiControl, , port6,
		GuiControl, , port7,
		GuiControl, , port8,
		GuiControl, , port9,
		GuiControl, , port10,
		GuiControl, , port11,
		GuiControl, , port12,
		GuiControl, , port13,
		GuiControl, , port14,
		GuiControl, , port15,
	}

Else if portChoice=Chromecast
	{
		GuiControl, , unitName, chrome
		GuiControl, , port1, 80
		GuiControl, , port2, 1024
		GuiControl, , port3, 1900
		GuiControl, , port4, 8008
		GuiControl, , port5, 8009
		GuiControl, , port6, 32768-61000
		GuiControl, , port7,
		GuiControl, , port8,
		GuiControl, , port9,
		GuiControl, , port10,
		GuiControl, , port11,
		GuiControl, , port12,
		GuiControl, , port13,
		GuiControl, , port14,
		GuiControl, , port15,
	}

Else if portChoice=Dankort
	{
		GuiControl, , unitName, dankort
		GuiControl, , port1, 1900
		GuiControl, , port2, 21
		GuiControl, , port3, 50020
		GuiControl, , port4, 13
		GuiControl, , port5, 80
		GuiControl, , port6, 5214
		GuiControl, , port7, 24000
		GuiControl, , port8,
		GuiControl, , port9,
		GuiControl, , port10,
		GuiControl, , port11,
		GuiControl, , port12,
		GuiControl, , port13,
		GuiControl, , port14,
		GuiControl, , port15,
	}

Else if portChoice=Playstation 4
	{
		GuiControl, , unitName, ps
		GuiControl, , port1, 80
		GuiControl, , port2, 443
		GuiControl, , port3, 465
		GuiControl, , port4, 3478-3480
		GuiControl, , port5, 3658
		GuiControl, , port6, 5223
		GuiControl, , port7, 6000-7000
		GuiControl, , port8, 9293
		GuiControl, , port9, 10070-10080
		GuiControl, , port10, 
		GuiControl, , port11,
		GuiControl, , port12,
		GuiControl, , port13,
		GuiControl, , port14,
		GuiControl, , port15,
	}

Else if portChoice=Sonos
	{	
		GuiControl, , unitName, sonos
		GuiControl, , port1, 80
		GuiControl, , port2, 445
		GuiControl, , port3, 3400
		GuiControl, , port4, 443
		GuiControl, , port5, 4070
		GuiControl, , port6, 136-139
		GuiControl, , port7, 1900
		GuiControl, , port8, 1901
		GuiControl, , port9, 2869
		GuiControl, , port10, 6969
		GuiControl, , port11, 10243
		GuiControl, , port12, 10280-10284
		GuiControl, , port13,
		GuiControl, , port14,
		GuiControl, , port15,
	}

Else if portChoice=Xbox 360
	{
		GuiControl, , unitName, xbox
		GuiControl, , port1, 88
		GuiControl, , port2, 3074
		GuiControl, , port3, 53
		GuiControl, , port4, 80
		GuiControl, , port5,
		GuiControl, , port6,
		GuiControl, , port7,
		GuiControl, , port8,
		GuiControl, , port9,
		GuiControl, , port10,
		GuiControl, , port11,
		GuiControl, , port12,
		GuiControl, , port13,
		GuiControl, , port14,
		GuiControl, , port15,
	}

Else if portChoice=Xbox One
	{
		GuiControl, , unitName, xone
		GuiControl, , port1, 88
		GuiControl, , port2, 3074
		GuiControl, , port3, 53
		GuiControl, , port4, 80
		GuiControl, , port5, 500
		GuiControl, , port6, 3544
		GuiControl, , port7, 4500
		GuiControl, , port8,
		GuiControl, , port9,
		GuiControl, , port10,
		GuiControl, , port11,
		GuiControl, , port12,
		GuiControl, , port13,
		GuiControl, , port14,
		GuiControl, , port15,
	}

Return



GuiClose:
ExitApp
