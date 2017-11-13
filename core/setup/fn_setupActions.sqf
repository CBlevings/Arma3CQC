/*
	File: fn_setupActions.sqf

	Description:
	Master file handler for all client-based actions. DESCRIPTIONEND
*/
private["_obj_main"];
_obj_main = player;

waitUntil{alive player};
sleep 3;

player setCustomAimCoef 0.45;
player enableStamina false;

/*

switch (playerSide) do
{
	case west: {
		{
			CQC_actions = CQC_actions + [_obj_main addAction["Open Arsenal",{["Open",true] call BIS_fnc_arsenal},"",20,false,false,"",format['(vehicle player == player) && ((player distance2d %1) < 15)',_x]]];
		}foreach (CQC_winningLocation select 3);//blufor
	};
	
	case east: {
		{
			CQC_actions = CQC_actions + [_obj_main addAction["Open Arsenal",{["Open",true] call BIS_fnc_arsenal},"",20,false,false,"",format['(vehicle player == player) && ((player distance2d %1) < 15)',_x]]];
		}foreach (CQC_winningLocation select 4);//opfor
	};
	
	default {
		{
			CQC_actions = CQC_actions + [_obj_main addAction["Open Arsenal",{["Open",true] call BIS_fnc_arsenal},"",20,false,false,"",format['(vehicle player == player) && ((player distance2d %1) < 15)',_x]]];
		}foreach (CQC_winningLocation select 4);//opfor
	};
};

{
	CQC_actions = CQC_actions + [_obj_main addAction["Open Arsenal",{["Open",true] call BIS_fnc_arsenal},"",20,false,false,"",format['(vehicle player == player) && ((player distance2d %1) < 15)',_x]]];
}foreach (CQC_winningLocation select 5);//capturable

*/