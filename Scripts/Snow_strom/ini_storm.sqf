// by ALIAS
// SNOW STORM SCRIPT DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons

/*
================================================================================================================================
>>>>> SNOW STORM Parameters =======================
================================================================================================================================
null = ["_snowfall","_duration_storm","_ambient_sounds_al","_breath_vapors","_snow_burst","_effect_on_objects","_vanilla_fog","_no_snow_indoor","_local_fog","_intensifywind","_unitsneeze"] execvm "AL_snowstorm\al_snow.sqf";

snowfall			- boolean, if true snowflakes made out of particles will be created
duration_storm		- number, life time of the SNOW STORM expressed in seconds
ambient_sounds_al	- seconds/number, a random number will be generated based on your input value and used to set the frequency for played ambient sounds
					- if is negative NO custom ambient sounds will be played
breath_vapors		- boolean, if true you will see breath vapors for all units, however if you have many units in your mission you should set this false to diminish the impact on frames
snow_burst			- seconds/number, if higher than 0 burst of snow will be generated at intervals based on your value
effect_on_objects	- boolean, if is true occasionally a random object will be pushed by the wind during the snow burst if the later is enabled
vanilla_fog			- boolean, vanilla fog will be managed by the script if true, otherwise the values you set in editor will be used 
local_fog			- boolean, if true particles will be used to create sort of waves of fog and snow
intensifywind		- boolean, if is true the wind will blow with force otherwise default value from Eden or other script will be used
unitsneeze			- boolean, if is true the at random units will sneeze/caugh and will shiver when snow burst occurs


>>>>>>>>>> EXAMPLE
null = ["_snowfall","_duration_storm","_ambient_sounds_al","_breath_vapors","_snow_burst","_effect_on_objects","_vanilla_fog","_no_snow_indoor","_local_fog","_intensifywind","_unitsneeze"] execvm "AL_snowstorm\al_snow.sqf";
[true,3000,15,true,5,true,true,false,false,true] execvm "Scripts\Snow_strom\AL_snowstorm\al_snow.sqf";


//"_snowfall","_duration_storm","_ambient_sounds_al","_breath_vapors","_snow_burst","_effect_on_objects","_vanilla_fog","_local_fog","_intensifywind","_unitsneeze"
[true,           300,                15,                    true,           10,             false, 			false,         false,        true,          true] execvm "AL_snowstorm\al_snow.sqf";

*/

//[50,0] execVM "Scripts\Snow_strom\ini_storm.sqf"

params["_time_snow_storm", "_sleep"];




60 setRain 1;
forceWeatherChange;
60 setRain 1;

[]spawn{
	_fog = fog;
	waitUntil{
		_fog = _fog + 0.001;
		0 setFog [_fog];
		sleep 0.1;
		_fog >= 1;
		}
};

[]spawn{
	waitUntil{
		sleep 1;
		rain > 0.5
	};

	hint localize "STR_snow_storm";
};




sleep _sleep;


[true,_time_snow_storm,15,true,10,false,true,true,true,true] execvm "Scripts\Snow_strom\AL_snowstorm\al_snow.sqf";


waitUntil{

    // проверка в заднии ли игрок
    _startPos = getPosASL player; 
    _endPos = [_startPos select 0, _startPos select 1, (_startPos select 2) + 20]; // Проверяем выше игрока 
    _intersections = lineIntersectsWith [_startPos, _endPos, player]; 
    if ((count _intersections <= 0) and !(vehicle player != player)) then { 
        player setDamage (getDammage player + 0.01); hint localize"STR_snow_storm_hint";
    } else {
		hint "";
	};
	sleep 1;
	_time_snow_storm = _time_snow_storm - 1;
	_time_snow_storm <= 0
};


60 setRain random 0.4;
forceWeatherChange;
60 setRain random 0.4;

[]spawn{
	_fog = 1;
	waitUntil{
		_fog = _fog - 0.0010;
		0 setFog [_fog];
		sleep 0.1;
		_fog <= 0.4;
		}
};