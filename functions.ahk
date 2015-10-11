#include <classMemory>

if (_ClassMemory.__Class != "_ClassMemory")
	msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
; "PROCESS_QUERY_INFORMATION": 0x0400
; "PROCESS_VM_READ": 0x0010
ReadInteger(addr, program)
{
	proc := new _ClassMemory(program, 0x0410, hProcessCopy)
	
	if (!isObject(proc))
		MsgBox % "Failed to open process"
	if (!hProcessCopy)
		MsgBox % "Failed to open handle. Error code: "  %hProcessCopy%
		
	value := proc.read(addr, "UInt")
	return value
}

ReadString(addr, program, length := 0, encoding := "utf-8")
{
	proc := new _ClassMemory(program, 0x0410, hProcessCopy)
	
	if (!isObject(proc))
		MsgBox % "Failed to open process"
	if (!hProcessCopy)
		MsgBox % "Failed to open handle. Error code: " %hProcessCopy%
		
	value := proc.readString(addr, length, encoding)
	return value
}










;g_addrMapName := 0x00814290
;g_addrCharName := 0x0083E674
;g_addrCHP 	:= 0x0083E1B4

currentHP := ReadInteger(0x0083E1B4, "ahk_exe Damage-RO.exe")
charName := ReadString(0x0083E674, "ahk_exe Damage-RO.exe", 23)
mapName := ReadString(0x00814290, "ahk_exe Damage-RO.exe", 23)

ListVars
MsgBox