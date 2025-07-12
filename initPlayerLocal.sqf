[ 
 [ 
  [localize "STR_Mission_hint_start_start", nil, 30] 
 ], 
 0, safeZoneY + safeZoneH / 1.2] spawn BIS_fnc_typeText;


//[] execVM "scripts\eqvip.sqf";

player addEventHandler [
	"Killed",
	{
		[player, [missionNamespace, "playerInventory"]] call BIS_fnc_saveInventory;
		missionNamespace setVariable ["Pos_player",getPos player];
		true
	}
];

player addEventHandler [
	"Respawn",
	{
		[player, [missionNamespace, "playerInventory"]] call BIS_fnc_loadInventory;
		_last_pos = missionNamespace getVariable "Pos_player";
		_pos_from_respawn = [_last_pos, 2, 15, 1, 0, 0.9, 0] call BIS_fnc_findSafePos;
		player setPos _pos_from_respawn;
		true
	}
];

/*
0 spawn{
	while {true} do {
		if(player inArea Podval or player inArea Save_zone) then{setAperture 15} else{setAperture 0};
		sleep 1;
	};
};
*/

waitUntil{time > 170};
playSound "Atmisfere_sound_1";