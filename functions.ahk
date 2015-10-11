#include <classMemory>


if (_ClassMemory.__Class != "_ClassMemory")
	msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
	
currentHP := new _ClassMemory("ahk_exe Damage-RO.exe", "", hProcessCopy) 

if !isObject(currentHP)
	msgbox failed to open a handle
if !hProcessCopy
	msgbox failed to open a handle. Error Code = %hProcessCopy%
 
 
value := currentHP.read(0x0083E1B4, "UInt")

Msgbox current hp: %value%
