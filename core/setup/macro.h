#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) //Quick macro for creating a constant variable
#define __GETC__(var) (call var) //Quick clean macro for getting a value of a constant / compileFinal variable. i.e if(__GETC__(numberone) == 1) then {}
#define __SUB__(var1,var2) var1 = var1 - var2
#define fileName (__FILE__ select [29, count __FILE__ - 33])
#define scriptAvailable(cooldownTime) (cooldownTime call {_zindex = life_scriptCooldowns find fileName; _zret = false;if(_zindex != -1) then {if((life_scriptCooldowns select (_zindex + 1)) > (time - _this)) then {_zret = true;}else{life_scriptCooldowns set [(_zindex + 1),time];}}else{life_scriptCooldowns pushBack fileName;life_scriptCooldowns pushBack time;};_zret})

//Control Macros
#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

//Player based quick macros
#define grpPlayer group player
#define steamid getPlayerUID player