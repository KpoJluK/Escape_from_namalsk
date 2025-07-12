params["_time_to_end"];

time_to_end = _time_to_end;

// sound
0 spawn{
    for "_i" from 0 to ceil(time_to_end / 30) - 1 do 
    {
        Speeker_1 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_2 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_3 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_4 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_5 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_6 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_7 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_9 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_10 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_11 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_12 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_13 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_14 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_15 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_16 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_17 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        Speeker_18 say3D ["Sound_nonification_sirena", 500, 1, false, 0];
        sleep 31;
    };
    
};

["ColorCorrections", 1500, [1, 0.4, 0, [0, 0, 0, 0], [1, 0, 0, 0], [1, 1, 1, 0]]] spawn 
{ 
 params ["_name", "_priority", "_effect", "_handle"]; 
 while { 
  _handle = ppEffectCreate [_name, _priority]; 
  _handle < 0 
 } do { 
  _priority = _priority + 1; 
 }; 
 _handle ppEffectEnable true; 
 _handle ppEffectAdjust _effect; 
 _handle ppEffectCommit time_to_end;
};

waitUntil{
    sleep 1;
    time_to_end = time_to_end - 1;
    if(time_to_end == 120 or time_to_end == 60 or time_to_end == 30 or time_to_end == 15 or time_to_end == 0)then{[4] spawn BIS_fnc_earthquake;};
    {
        if(((insideBuilding _x) isEqualTo 0) and time_to_end <= 30) then{_x setDamage (getDammage _x + 0.01)}
    } forEach allPlayers;
    time_to_end <= 0
};



{
if((insideBuilding _x) isEqualTo 0) then{_x setDamage 1}
} forEach allPlayers;

["ColorCorrections", 1500, [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]]] spawn  
{  
 params ["_name", "_priority", "_effect", "_handle"];  
 while {  
  _handle = ppEffectCreate [_name, _priority];  
  _handle < 0  
 } do {  
  _priority = _priority + 1;  
 };  
 _handle ppEffectEnable true;  
 _handle ppEffectAdjust _effect;  
 _handle ppEffectCommit 120;  
};