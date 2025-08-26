

["Task_01", true, [localize"STR_Missions_one_Description",localize"STR_Missions_one_name","respawn_west"], [4345.62,4791.15,0], "ASSIGNED", 5, true, true, "wait", true] call BIS_fnc_setTask;

/// Vehicle in fire
[
    true, // будут ли возгоратся машины (true - да false - нет)
    true,   // будут ли возгоратся Танки/БПМ (true - да false - нет)
    false,   // будут ли возгоратся воздушная техника (true - да false - нет) работает не всегда коректно 
    true, // наносить ли урон экипажу в горящей машине
    true,   // убитьвать ли экипаж машины если она сгорает (true - да false - нет)
    [60,90,120] // время за которое машина сгорит минимальное/среднее/максимальное (в сек) 
]execVM "Scripts\Vehicle_in_fire.sqf";

[]execVM "Scripts\loot.sqf";


[] execVM "Scripts\Scenario.sqf";


enableDynamicSimulationSystem true;

// Snow storm trigger
[]spawn{
    waitUntil {

        sleep 10; 
        (1 <= (count(allPlayers inAreaArray Snow_storm_trigger)))

    };
    [50,60] execVM "Scripts\Snow_strom\ini_storm.sqf"

};

// Vibros trigger
[]spawn{
    waitUntil {

        sleep 10; 
        (1 <= (count(allPlayers inAreaArray Vibros_trigger)))
        
    };
    [160] execVM "Scripts\vibros.sqf"

};