[ 
 [ 
  [localize "STR_start_mission", nil, 30] 
 ], 
 0, safeZoneY + safeZoneH / 1.2] spawn BIS_fnc_typeText;


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


0 spawn{
	while {true} do {
		if(player inArea Podval) then{setAperture 100} else{setAperture 0};
		sleep 2;
	};
};



// Зимниий цветофильтр
_coldEffect = ppEffectCreate ["colorCorrections", 1500];   
_coldEffect ppEffectEnable true;   
_coldEffect ppEffectAdjust [   
    1,     // Яркость   
    1.1,   // Контраст   
    0.02,  // Компенсация   
    [0.2, 0.2, 0.4, -0.1],  // Цветовой баланс (увеличиваем синий)   
    [0.8, 0.9, 1.0, 0.5],   // Усиление синего и ослабление красного   
    [0.2, 0.2, 0.2, 0]      // Лёгкая дымка   
];   
_coldEffect ppEffectCommit 0;

[] execVM "Scripts\Eqvip_player.sqf";

waitUntil{time > 170};
playSound "Atmisfere_sound_1";
sleep 3300;
playSound "Atmisfere_sound_1";


