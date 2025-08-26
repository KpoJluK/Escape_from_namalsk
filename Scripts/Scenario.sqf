sleep 1;

// first mission

//["Task_01", true, [localize"STR_Missions_one_Description",localize"STR_Missions_one_name","respawn_west"], [4345.62,4791.15,0], "ASSIGNED", 5, true, true, "wait", true] call BIS_fnc_setTask;

waitUntil{
	sleep 1;
	1 <= ({alive _x} count allPlayers)
};

sleep 5;

// wather
30 setRain 0;
30 setFog 0;

waitUntil{
    sleep 1;
    rain <= 0.6
};

120 setFog 0;

["Task_01","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;

// add enemys
private _group_start = createGroup [east,true];
private _unit_start = _group_start createUnit ["dev_o_zombie_scientist2_i", [4406.05,4760.89,0], [], 0, "FORM"];
_fn_select_start = selectRandom [fnc_eqvip_1_streloc_rpg_26, fnc_eqvip_2_sniper, fnc_eqvip_3_pkp]; 
[_unit_start]call _fn_select_start;
private _unit_start = _group_start createUnit ["dev_o_zombie_scientist2_i", [4406.05,4760.89,0], [], 0, "FORM"];
_fn_select_start = selectRandom [fnc_eqvip_1_streloc_rpg_26, fnc_eqvip_2_sniper, fnc_eqvip_3_pkp];
[_unit_start]call _fn_select_start;

// 2 mission

["Task_02", true, [localize"STR_Missions_two_Description",localize"STR_Missions_two_name","respawn_west"], getPos Document_1, "ASSIGNED", 5, true, true, "search", true] call BIS_fnc_setTask;

// add action
[[], {
    [
	Document_1,														// Object the action is attached to
	localize "STR_Missions_two_document_action",													// Title of the action
	"a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa",	// Idle icon shown on screen
	"a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 2",									// Condition for the action to be shown
	"_caller distance _target < 2",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ missionComplite_1 = true; publicVariable "missionComplite_1";},							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	10,																// Action duration in seconds
	0,																// Priority
	true,															// Remove on completion
	false															// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, Document_1];				// MP-compatible implementation
}] remoteExec ["call"];


[[4845.6,6176.04,0], 100, east, "dev_o_zombie_scientist2_i", 1, 1, 1] execVM "Scripts\spawn_enemy_in_bilding.sqf";

missionComplite_1 = false;

waitUntil {
    sleep 1;
    missionComplite_1
};


["Task_02","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;

// 3 mission

["Task_03", true, [localize"STR_Missions_three_Description",localize"STR_Missions_three_name","respawn_west"], getPos Terminal_1, "ASSIGNED", 5, true, true, "use", true] call BIS_fnc_setTask;

// add action
[[], {
    [
	Terminal_1,														// Object the action is attached to
	localize "STR_Missions_three_terminal_action",													// Title of the action
	"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_view_article_CA.paa",	// Idle icon shown on screen
	"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_view_article_CA.paa",	// Progress icon shown on screen
	"_this distance _target < 2",									// Condition for the action to be shown
	"_caller distance _target < 2",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ missionComplite_2 = true; publicVariable "missionComplite_2";},							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	10,																// Action duration in seconds
	0,																// Priority
	true,															// Remove on completion
	false															// Show in unconscious state
    ] remoteExec ["BIS_fnc_holdActionAdd", 0, Terminal_1];				// MP-compatible implementation
}] remoteExec ["call"];

[[4181.45,6636.14,0], 50, west, "B_Soldier_F", 2, 0, 1] execVM "Scripts\spawn_enemy_in_bilding.sqf";
[[4181.45,6636.14,0], 100, west, 1, "B_Soldier_F", 2, 10] execVM "Scripts\spawn_patrol.sqf";


missionComplite_2 = false;

waitUntil {
    sleep 1;
    missionComplite_2
};


["Task_03","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;

// 4 mission

["Task_04", true, [localize"STR_Missions_fore_Description",localize"STR_Missions_fore_name","respawn_west"], [7946.11,7600.82,0], "ASSIGNED", 5, true, true, "exit", true] call BIS_fnc_setTask;

[[7835.33,7618.17,0], 50, west, "B_Soldier_F", 2, 0, 1] execVM "Scripts\spawn_enemy_in_bilding.sqf";
[[7835.33,7618.17,0], 100, west, 1, "B_Soldier_F", 2, 10] execVM "Scripts\spawn_patrol.sqf";
// vehicle patrol
[[7259.24,6618.49,0], 500, west, 1, ["rhsgref_cdf_reg_uaz_dshkm","rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_zil131_open", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural_open"], 20] execVM "Scripts\spawn_patrol_vehicle.sqf";
[[7441.11,7694.53,0], 500, west, 1, ["rhsgref_cdf_reg_uaz_dshkm","rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_zil131_open", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural_open"], 20] execVM "Scripts\spawn_patrol_vehicle.sqf";

//zomie sawn
[[7273.81,7955.46,0], 100, 20, east, "dev_o_zombie_scientist2_i", 2, 4] execVM "Scripts\spwn_zomby_cycle.sqf";

player_nearby = false;

waitUntil{
    sleep 10;
    {if(_x inArea [[7946.11,7600.82,0], 250, 250, 45, false])then{player_nearby = true};} forEach allPlayers; 
    player_nearby
};

if(damage heli_1 < 0.2)then{

    // if not destroid heli

// waipoint heli
Group_heli_1 = west createVehicleCrew heli_1;
_wp1 = Group_heli_1 addWaypoint [[5262.06,12589.1,0], 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointSpeed "FULL";

waitUntil{
    sleep 1;
    !isTouchingGround heli_1 or damage heli_1 > 0.2;
};

[]spawn{
    waitUntil{
        sleep 1;
        isTouchingGround heli_1 or heli_1 inArea [[5262.06,12589.1,0], 300, 300, 45, false]
    };
    if(isTouchingGround heli_1)then{
        heli_1 setDamage 1;}
    else{
        deleteVehicleCrew heli_1;
        deleteVehicle heli_1;
    };
};

}else{

    // if heli destroid

    heli_1 setDamage 1;

};




sleep 20;

["Task_04","CANCELED"] call BIS_fnc_taskSetState;

sleep 5;

// 5 mission

["Task_05", true, [localize"STR_Missions_five_Description",localize"STR_Missions_five_name","respawn_west"], getPos Radio_1, "ASSIGNED", 5, true, true, "search", true] call BIS_fnc_setTask;

// add action

[[6469.48,9272.58,0], 100, 10, east, "dev_o_zombie_scientist2_i",10, 4] execVM "Scripts\spwn_zomby_cycle.sqf";
[[6281.6,9373.92,0], 100, east, "dev_o_zombie_scientist2_i", 1, 1, 1] execVM "Scripts\spawn_enemy_in_bilding.sqf";

[[], {
    [
	Radio_1,														// Object the action is attached to
	localize "STR_Missions_five_action_rado",													// Title of the action
	"a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",	// Idle icon shown on screen
	"a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 2",									// Condition for the action to be shown
	"_caller distance _target < 2",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ missionComplite_3 = true; publicVariable "missionComplite_3";},							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	10,																// Action duration in seconds
	0,																// Priority
	true,															// Remove on completion
	false															// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, Radio_1];				// MP-compatible implementation
}] remoteExec ["call"];

[[5730.06,9843.36,0], 50, west, "B_Soldier_F", 2, 0, 1] execVM "Scripts\spawn_enemy_in_bilding.sqf";
[[5730.06,9843.36,0], 100, west, 1, "B_Soldier_F", 2, 10] execVM "Scripts\spawn_patrol.sqf";


missionComplite_3 = false;

waitUntil {
    sleep 1;
    missionComplite_3
};


["Task_05","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;

// 6 mission

["Task_06", true, [localize"STR_Missions_six_Description",localize"STR_Missions_six_name","respawn_west"], [6892.96,11357.9,0], "ASSIGNED", 5, true, true, "scout", true] call BIS_fnc_setTask;

// wait when player in roof
player_in_roof = false;

[[6744.72,11235.4,0], 300, 30, east, "dev_o_zombie_scientist2_i",10, 200, 60] execVM "Scripts\spwn_zomby_cycle.sqf";

waitUntil{
    {if(_x inArea [[6892.96,11357.9,30], 10, 10, 45, false])then{player_in_roof = true}} forEach allPlayers; 
    player_in_roof
};

["Task_06","SUCCEEDED"] call BIS_fnc_taskSetState;

// add iventhendler

[[], {

    player addEventHandler ["fired", {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
        
        // Проверка конкретного оружия
        if (_weapon isEqualto "rhs_weap_rsp30_green") then {
                player_fire_rsp = true;
                publicVariable "player_fire_rsp";
                player removeEventHandler [_thisEvent, _thisEventHandler];
            };
    }]

}] remoteExec ["call"];


sleep 5;

["Task_07", true, [localize"STR_Missions_seven_Description",localize"STR_Missions_seven_name","respawn_west"], [6892.96,11357.9,0], "ASSIGNED", 5, true, true, "rifle", true] call BIS_fnc_setTask;


// wait until player fired with rsp

player_fire_rsp = false;

waitUntil{
    sleep 1;
    player_fire_rsp
};

sleep 5;

["Task_07","SUCCEEDED"] call BIS_fnc_taskSetState;

["Task_08", true, [localize"STR_Missions_eight_Description",localize"STR_Missions_eight_name","respawn_west"], [6892.96,11357.9,0], "ASSIGNED", 5, true, true, "wait", true] call BIS_fnc_setTask;



_heli_2 = "rhsgref_un_Mi8amt" createVehicle [8675.22,9875.94,0];

west createVehicleCrew _heli_2;

_heli_2 engineOn true;

_heli_2 allowDamage true;

_heli_2 setVehicleAmmo 0;
    
[_heli_2] execVM "Scripts\movment_data.sqf";

sleep 50;

Streloc_1 hideObjectGlobal false;

sleep 3;
_heli_2 allowDamage false;

_pos_missle = getPos Streloc_1;
_pos_missle set [2,16];
_missile = createVehicle ["rhs_ammo_9k38",_pos_missle,[],0,"CAN_COLLIDE"];
private _dir = (getPosASL _missile) vectorFromTo (getPosASL _heli_2);
_missile setVectorDirAndUp [_dir, [0, 0, 1]];
_missile setVelocity (_dir vectorMultiply 10);
_missile setMissileTarget _heli_2;


Streloc_1 allowDamage false;

sleep 1;

{_x setDamage 1} forEach Crew _heli_2;

waitUntil{
    isTouchingGround _heli_2 
};

_heli_2 setDamage 0.9;


[_heli_2]spawn{
	params["_heli_2"];

	//  создание огня
	//  SmallDestructionFire - маленький огонь
	//  MediumDestructionFire - средний огонь
	//  BigDestructionFire - большой огонь
	_Fire = "#particlesource" createVehicle [0,0,0];
	_Fire setParticleClass "BigDestructionFire"; 
	_Fire attachTo [_heli_2, [0,0,0]];
	//  создание дыма
	//  SmallDestructionSmoke - маленький дым
	//  MediumDestructionFire - средний дым
	//  BigDestructionSmoke - большой дым
	_Smoke = "#particlesource" createVehicle [0,0,0]; 
	_Smoke setParticleClass "BigDestructionSmoke";
	_Smoke attachTo [_heli_2, [0,0,0]];
	_light = createVehicle ["#lightpoint", [0,0,0], [], 0, "CAN_COLLIDE"];
	_light attachTo [_heli_2, [0,0,0]];
	_light setLightBrightness 1.0;
	_light setLightColor [1,0.85,0.6];
	_light setLightAmbient [1,0.3,0];
	_light setLightIntensity 400;
	_light setLightAttenuation [0,0,0,2];
	_light setLightDayLight true;
	// звук горения
	waituntil{
    sleep 1;
	!alive _heli_2
	};
	// для удаления
	deleteVehicle _Fire;
	deleteVehicle _Smoke;
	deleteVehicle _light;

};

sleep 10;

Streloc_1 enableAI "Move";

_heli_2 setDamage 1;

sleep 5;

["Task_08","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;

["Task_09", true, [localize"STR_Missions_nine_Description",localize"STR_Missions_nine_name","respawn_west"], [4831.5,10838.8,0], "ASSIGNED", 5, true, true, "search", true] call BIS_fnc_setTask;




[[], {
    [
	Oficer_1,														// Object the action is attached to
	localize "STR_Missions_five_action_rado",													// Title of the action
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa",	// Idle icon shown on screen
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 2",									// Condition for the action to be shown
	"_caller distance _target < 2",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ missionComplite_8 = true; publicVariable "missionComplite_8"; Oficer_1 allowDamage false;},							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	10,																// Action duration in seconds
	0,																// Priority
	true,															// Remove on completion
	false															// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, Oficer_1];				// MP-compatible implementation
}] remoteExec ["call"];

[[4827.16,10836.5,0], 50, west, "B_Soldier_F", 2, 0, 1] execVM "Scripts\spawn_enemy_in_bilding.sqf";
[[4827.16,10836.5,0], 100, west, 1, "B_Soldier_F", 2, 10] execVM "Scripts\spawn_patrol.sqf";
[[4827.16,10836.5,0], 100, west, 1, "B_Soldier_F", 2, 10] execVM "Scripts\spawn_patrol.sqf";

missionComplite_8 = false;

waitUntil{
	sleep 1;
	missionComplite_8
};

["Task_09","CANCELED"] call BIS_fnc_taskSetState;

sleep 5;

heli_3 hideObjectGlobal false;
heli_3 allowDamage false;

["Task_10", true, [localize"STR_Missions_ten_Description",localize"STR_Missions_ten_name","respawn_west"], getpos heli_3, "ASSIGNED", 5, true, true, "heli", true] call BIS_fnc_setTask;

[[4464.14,11166.2,0], 50, west, "B_Soldier_F", 2, 0, 1] execVM "Scripts\spawn_enemy_in_bilding.sqf";
[[4464.14,11166.2,0], 100, west, 1, "B_Soldier_F", 2, 10] execVM "Scripts\spawn_patrol.sqf";
[[4464.14,11166.2,0], 100, west, 1, "B_Soldier_F", 2, 10] execVM "Scripts\spawn_patrol.sqf";
[[4464.14,11166.2,0], 100, west, 1, "B_Soldier_F", 2, 10] execVM "Scripts\spawn_patrol.sqf";

heli_3 lock false;

waitUntil{
	sleep 5;
	if(damage heli_3 > 0.3)exitWith{

		["Task_09","FAILED"] call BIS_fnc_taskSetState;
		fnc_end_mission = { 
			playMusic "EventTrack01_F_Curator"; 
			[]spawn{
				waitUntil{
					setAperture ((apertureParams select 0) + 1);
					sleep 0.1;
					false
					};
			};

			timeStart = time + 10;
			waitUntil{ 
				sleep 0.1; 
				timeStart <= time
			}; 
			
			["END2"] remoteExec ["endMission", 0, true]; 
		}; 
			
			publicVariable "fnc_end_mission"; 
			
			[[], {[]spawn fnc_end_mission}] remoteExec ['call',0];

		};
	!(heli_3 inArea general_triger_end_1)
};


["Task_10","SUCCEEDED"] call BIS_fnc_taskSetState;
fnc_end_mission = { 
	playMusic "EventTrack01_F_Curator"; 
	[]spawn{
		waitUntil{
			setAperture ((apertureParams select 0) + 1);
			sleep 0.1;
			false
			};
	};

	timeStart = time + 10;
	waitUntil{ 
		sleep 0.1; 
		timeStart <= time
	}; 
	
	["END1"] remoteExec ["endMission", 0, true]; 
}; 
	
	publicVariable "fnc_end_mission"; 
	
	[[], {[]spawn fnc_end_mission}] remoteExec ['call',0];