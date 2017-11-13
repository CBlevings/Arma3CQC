/*
	Author: Karel Moricky

	Description:
	Zeus lightning strike

	Parameter(s):
	http://community.bistudio.com/wiki/Arma_3_Modules

	Returns:
	NONE
*/
private["_pos","_bolt","_light","_lightning","_duration","_time"];
_pos = _this param [0,[],[[]]];

if(count _pos < 3) exitWith {};

_bolt = createvehicle ["LightningBolt",_pos,[],0,"can collide"];
_bolt setposatl _pos;
_bolt setdamage 1;

_light = "#lightpoint" createvehicle _pos;
_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
_light setLightDayLight true;
_light setLightBrightness 300;
_light setLightAmbient [0.05, 0.05, 0.1];
_light setlightcolor [1, 1, 2];

sleep 0.1;
_light setLightBrightness 0;
sleep (random 0.1);

_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
_lightning = _class createvehicle [100,100,100];
_lightning setdir (random(360));
_lightning setpos _pos;

_duration = (1 + random 1);

for "_i" from 0 to _duration do {
	_time = time + 0.1;
	_light setLightBrightness (100 + random 100);
	waituntil {
		time > _time
	};
};

deletevehicle _lightning;
deletevehicle _light;