
[]spawn{
	setPlayerRespawnTime 5;
	myRespawn_player = [independent, [4344.26,4790.66,0], "Start"] call BIS_fnc_addRespawnPosition;
	waitUntil{
		sleep 1;
		alive player
	};

	setPlayerRespawnTime 20;

	waitUntil{
		if(alive player)then{
			
			myRespawn_player call BIS_fnc_removeRespawnPosition;
			myRespawn_player = [independent, getPos player, localize "STR_Name_respawn_point"] call BIS_fnc_addRespawnPosition;

		};
		sleep 60;
		false
	};
	
};





player addEventHandler [
	"Killed",
	{
		params ["_unit"];
		[player, [missionNamespace, "playerInventory"]] call BIS_fnc_saveInventory;
		missionNamespace setVariable ["Pos_player",getPos player];

		// перенос одежды на зомби
		[getDir player, getPos player, vest player, uniform player, backpack player, headgear player, goggles player, _unit]spawn{

			params["_dir","_pos","_vest","_uniform", "_backpack", "_headgear", "_goggles", "_player"];
			if(time < 30) exitWith {};
			sleep random 30;
			deleteVehicle _player;
			private _group = createGroup [east, true];
			private _unit = _group createUnit ["dev_o_zombie_scientist2_i", [0,0,0], [], 0, "NONE"];
			_unit setDir _dir;
			_unit setPos _pos;

			removeVest _unit;
			removeUniform _unit;

			_unit addVest _vest;
			_unit addUniform _uniform;
			_unit addbackpack _backpack;
			_unit addGoggles _goggles;
			_unit addHeadgear _headgear;

			deleteVehicle _player;
		};

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

// затемние в подвале
0 spawn{
	while {true} do {
		if(!isNil "fnc_end_mission")exitWith{true};
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


waitUntil{
	sleep 1;
	alive player
};

[ 
	[ 
		[localize "STR_start_mission", nil, 30] 
	], 
		0, safeZoneY + safeZoneH / 1.2
] spawn BIS_fnc_typeText;


// Атмосферный звук

waitUntil{time > 170};


[]spawn{
	waitUntil{
		playSound "Atmisfere_sound_1";
		sleep 3300;
		false
	};
};





