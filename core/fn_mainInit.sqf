/*
	Author: Poseidon
	
	Description: Main init file for players
*/
[profilename, 0] spawn CQC_fnc_cameraStandby;

waitUntil{!isNull player && {player == player}};

player allowDamage false;
player enableSimulation false;
player setCustomAimCoef 0.45;
player enableStamina false;

waitUntil{!isNil "CQC_votingEndTime"};

sleep (3 + random(4));

if(!CQC_votingFinished) then {
	if(!CQC_votingStarted) then {
		[[serverTime + 60],"CQC_fnc_startVoting",false,false] spawn CQC_fnc_MP;
	};
};

waitUntil{CQC_votingStarted};

if(!CQC_votingFinished) then {
	createDialog "CQC_votingMenu";
};

waitUntil{CQC_votingFinished};
waitUntil{CQC_gameReady};
waitUntil{!isNil "CQC_winningLocation"};

[(CQC_winningLocation select 2)] spawn CQC_fnc_gameArea;
[] spawn CQC_fnc_setupSpawnProtection;

player setVariable ["#rev_enabled",false];
player enableSimulation true;
player allowDamage true;
forceRespawn player;

sleep 6;

if(CQC_revivesAllowed) then {
	player setVariable ["#rev_enabled",true];
};

[] spawn CQC_fnc_setupEVH;
[] spawn CQC_fnc_setupActions;
[] spawn CQC_fnc_playerTags;

waitUntil{!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call CQC_fnc_keyHandler"];