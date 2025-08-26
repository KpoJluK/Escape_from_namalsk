// [60] execVM "Scripts\vibros.sqf"

params["_time_to_end"];


[2] spawn BIS_fnc_earthquake;

hint localize "STR_warning_vibros";

// sound
[_time_to_end] spawn{
    params["_time_to_end"];
    for "_i" from 0 to (ceil((_time_to_end / 30) - 1)) do 
    {
        Speeker_1 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_2 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_3 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_4 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_5 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_6 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_7 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_9 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_10 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_11 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_12 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_13 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_14 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_15 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_16 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_17 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        Speeker_18 say3D ["Sound_nonification_sirena", 1500, 1, false, 0];
        sleep 31;
    };
    
};

["ColorCorrections", 1500, [1, 0.4, 0, [0, 0, 0, 0], [1, 0, 0, 0], [1, 1, 1, 0]],0, _time_to_end] spawn 
{ 
 params ["_name", "_priority", "_effect", "_handle", "_time_to_end"]; 
 while { 
  _handle = ppEffectCreate [_name, _priority]; 
  _handle < 0 
 } do { 
  _priority = _priority + 1; 
 }; 
 _handle ppEffectEnable true; 
 _handle ppEffectAdjust _effect; 
 _handle ppEffectCommit _time_to_end;
};

waitUntil{
    sleep 1;
    _time_to_end = _time_to_end - 1;
    if(_time_to_end == 120 or _time_to_end == 60 or _time_to_end == 30 or _time_to_end == 15 or _time_to_end == 0)then{[4] spawn BIS_fnc_earthquake;};

    // проверка в заднии ли игрок
    _startPos = getPosASL player; 
    _endPos = [_startPos select 0, _startPos select 1, (_startPos select 2) + 20]; // Проверяем выше игрока 
    _intersections = lineIntersectsWith [_startPos, _endPos, player]; 
    if (count _intersections <= 0 and _time_to_end <= 30) then { 
        player setDamage (getDammage player + 0.01); hint "Во время выброса нужно быть в здании в ином случаи Вы погибните!(нуженн перевод!)";
    };

    _time_to_end <= 0
};


// проверка в заднии ли игрок
_startPos = getPosASL player; 
_endPos = [_startPos select 0, _startPos select 1, (_startPos select 2) + 20]; // Проверяем выше игрока 
_intersections = lineIntersectsWith [_startPos, _endPos, player]; 
if (count _intersections <= 0) then { 
    player setDamage 1; 
};


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
 _handle ppEffectCommit 60;
 sleep 60;
 ppEffectDestroy _handle;  
};

sleep 60;

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


