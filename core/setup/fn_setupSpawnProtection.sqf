/*
	Author: Poseidon
	
	Description: Sets up spawn protection client side.
*/


{
	_protectionZone = "ProtectionZone_F" createVehicleLocal _x;
	_protectionZone setPos [(_x select 0), (_x select 1), ((_x select 2) - 26.4)];
	_protectionZone setVectorUp [0,0,-1];
	_protectionZone enableSimulation false;
	
	if(playerside == west) then {
		_protectionZone setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0.75,0.07)"];
	}else{
		_protectionZone setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0.75,0,0,0.07)"];
	};
	
	
	
}foreach (CQC_winningLocation select 3);

{
	_protectionZone = "ProtectionZone_F" createVehicleLocal _x;
	_protectionZone setPos [(_x select 0), (_x select 1), ((_x select 2) - 26.4)];
	_protectionZone setVectorUp [0,0,-1];
	_protectionZone enableSimulation false;
	
	if(playerside == west) then {
		_protectionZone setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0.75,0,0,0.07)"];
	}else{
		_protectionZone setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0.75,0.07)"];
	};
	
}foreach (CQC_winningLocation select 4);