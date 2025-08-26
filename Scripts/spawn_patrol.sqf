// Скрипт для спавна группы юнитов, которые патрулируют заданную область



//[[6179.09,5730.98,0], 100, west, 1, "B_Soldier_F", 10] execVM "Scripts\spawn_patrol.sqf";

params [
    ["_center", [0,0,0]], // Центр области патрулирования
    ["_radius", 100],     // Радиус патрулирования (в метрах)
    ["_side", east],      // Сторона группы (east, west, independent, civilian)
    ["_unitCount", 4],    // Количество юнитов в группе
    ["_unitType", "B_Soldier_F"], // Тип юнита
    ["_waypoints", 4]     // Количество точек маршрута для патруля
];

_unitCount = ceil ((count allPlayers) * random 5);

// Проверяем корректность параметров
if (_unitCount < 1) exitWith {hint "Ошибка: Количество юнитов должно быть больше 0!";};
if (_radius < 10) exitWith {hint "Ошибка: Радиус патрулирования слишком мал!";};

// Создаем группу
private _group = createGroup [_side, true];
_group enableDynamicSimulation true;

// Спавним юниты в центре области
private _spawnPos = _center getPos [random 20, random 360];
for "_i" from 1 to _unitCount do {
    private _unit = _group createUnit [_unitType, _spawnPos, [], 5, "FORM"];
    _unit enableDynamicSimulation true; // динамическая симуляция вкл

    // eqvip

    // nac
    _fn_select = [];
    if(random 100 < 60)then{
        _fn_select = fnc_eqvip_1_streloc_rpg_26;
    }else{
        _fn_select = selectRandom[fnc_eqvip_2_sniper, fnc_eqvip_3_pkp];
    }; 
    [_unit]call _fn_select;

    _unit setRank "PRIVATE";
    _unit setSkill 0.5;
    sleep 0.2;
};

// Настраиваем поведение группы
_group setBehaviour "AWARE"; // Поведение: настороженное
_group setCombatMode "YELLOW"; // Режим боя: открыть огонь при обнаружении
_group setSpeedMode "LIMITED"; // Скорость: нормальная (ходьба)

// Создаем случайные точки маршрута для патрулирования
for "_i" from 1 to _waypoints do {
    private _wpPos = _center getPos [random _radius, random 360];
    private _wp = _group addWaypoint [_wpPos, 0];
    _wp setWaypointType "MOVE";
    _wp setWaypointFormation "STAG COLUMN"; // Формация: колонна с разбросом
    _wp setWaypointTimeout [5, 10, 15]; // Задержка в точке (секунды)
};

// Добавляем последнюю точку цикла (CYCLE) для бесконечного патрулирования
private _cycleWp = _group addWaypoint [_center, 0];
_cycleWp setWaypointType "CYCLE";

