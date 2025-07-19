sleep 1;

// first mission

["Task_01", true, [localize"STR_Missions_one_Description",localize"STR_Missions_one_name","respawn_west"], [4345.62,4791.15,0], "ASSIGNED", 5, true, true, "wait", true] call BIS_fnc_setTask;


// wather
30 setRain 0;
30 setFog 0.5;

waitUntil{
    sleep 1;
    rain <= 0.6
};

120 setFog 0;

["Task_01","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;

// 2 mission

["Task_02", true, [localize"STR_Missions_two_Description",localize"STR_Missions_two_name","respawn_west"], getPos Document_1, "ASSIGNED", 5, true, true, "search", true] call BIS_fnc_setTask;

// add action
[[], {
    [
	Document_1,														// Object the action is attached to
	localize "STR_Missions_three_document_action",													// Title of the action
	"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_view_article_CA.paa",	// Idle icon shown on screen
	"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_view_article_CA.paa",	// Progress icon shown on screen
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

missionComplite_1 = false;

waitUntil {
    sleep 1;
    missionComplite_1
};


["Task_02","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;

// 3 mission

["Task_03", true, [localize"STR_Missions_two_Description",localize"STR_Missions_two_name","respawn_west"], getPos Terminal_1, "ASSIGNED", 5, true, true, "use", true] call BIS_fnc_setTask;

// add action
[[], {
    [
	Terminal_1,														// Object the action is attached to
	localize "STR_Missions_three_document_action",													// Title of the action
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

missionComplite_2 = false;

waitUntil {
    sleep 1;
    missionComplite_2
};


["Task_03","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;

// 4 mission

["Task_04", true, [localize"STR_Missions_two_Description",localize"STR_Missions_two_name","respawn_west"], [7946.11,7600.82,0], "ASSIGNED", 5, true, true, "exit", true] call BIS_fnc_setTask;

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

["Task_03","CANCELED"] call BIS_fnc_taskSetState;

sleep 5;

// 5 mission

["Task_05", true, [localize"STR_Missions_two_Description",localize"STR_Missions_two_name","respawn_west"], getPos Radio_1, "ASSIGNED", 5, true, true, "exit", true] call BIS_fnc_setTask;

// add action

[[], {
    [
	Radio_1,														// Object the action is attached to
	localize "STR_Missions_three_document_action",													// Title of the action
	"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_view_article_CA.paa",	// Idle icon shown on screen
	"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_view_article_CA.paa",	// Progress icon shown on screen
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


waitUntil {
    sleep 1;
    missionComplite_3
};


["Task_05","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;

// 6 mission

["Task_06", true, [localize"STR_Missions_two_Description",localize"STR_Missions_two_name","respawn_west"], [6892.96,11357.9,0], "ASSIGNED", 5, true, true, "exit", true] call BIS_fnc_setTask;

// wait when player in roof
player_in_roof = false;

waitUntil{
    {if(_x inArea [[6892.96,11357.9,30], 10, 10, 45, false])then{player_nearby = true};} forEach allPlayers; 
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

["Task_07", true, [localize"STR_Missions_two_Description",localize"STR_Missions_two_name","respawn_west"], [6892.96,11357.9,0], "ASSIGNED", 5, true, true, "rifle", true] call BIS_fnc_setTask;


// wait until player fired with rsp

player_fire_rsp = false;

waitUntil{
    sleep 1;
    player_fire_rsp
};

["Task_07","SUCCEEDED"] call BIS_fnc_taskSetState;