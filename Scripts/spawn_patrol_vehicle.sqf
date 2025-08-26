// spawnVehiclePatrol.sqf
// Скрипт для спавна группы на технике, патрулирующей по дорогам в заданной области

//[[6179.09,5730.98,0], 500, west, 1, ["rhsgref_cdf_reg_uaz_dshkm","rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_zil131_open", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural_open"], 20] execVM "Scripts\spawn_patrol_vehicle.sqf";

params [
    ["_center", [0,0,0]], // Центр области патрулирования
    ["_radius", 200],     // Радиус поиска дорог (в метрах)
    ["_side", west],      // Сторона группы (east, west, independent, civilian)
    ["_unitCount", 4],    // Количество юнитов в группе
    ["_vehicleType", ["rhsgref_cdf_reg_uaz_dshkm"]], // Тип техники (например, Ifrit для EAST)
    ["_waypoints", 4]     // Количество точек маршрута
];

_unitCount = ceil (((count allPlayers) * random 5) + 1);

// Проверяем корректность параметров
if (_unitCount < 1) exitWith {hint "Ошибка: Количество юнитов должно быть больше 0!";};
if (_radius < 50) exitWith {hint "Ошибка: Радиус патрулирования слишком мал!";};

// Находим ближайшую дорогу для спавна
private _roads = _center nearRoads _radius;
if (count _roads == 0) exitWith {hint "Ошибка: В области нет дорог!";};

// Выбираем случайную дорогу для спавна
private _spawnRoad = selectRandom _roads;
private _spawnPos = getPos _spawnRoad;

// Создаем технику
private _vehicle = createVehicle [selectRandom _vehicleType, _spawnPos, [], 0, "NONE"];
_vehicle enableDynamicSimulation true;
_vehicle setDir (random 360); // Случайное направление

// Создаем группу
private _group = createGroup [_side, true];
_group enableDynamicSimulation true;

// Спавним юнитов и размещаем их в технике
private _driver = _group createUnit ["B_Soldier_F", _spawnPos, [], 0, "NONE"];
_driver enableDynamicSimulation true;
_driver assignAsDriver _vehicle;
_driver moveInDriver _vehicle;
[_driver]call fnc_eqvip_1_streloc_rpg_26;

private _unitCountAdjusted = (_unitCount - 1) min (count (fullCrew [_vehicle, "", true]) - 1); // Ограничиваем по местам в технике
for "_i" from 1 to _unitCountAdjusted do {
    private _unit = _group createUnit ["B_Soldier_F", _spawnPos, [], 0, "NONE"];
    _unit enableDynamicSimulation true;
    if (_vehicle emptyPositions "Gunner" > 0) then {
        _unit assignAsGunner _vehicle;
        _unit moveInGunner _vehicle;
    } else {
        _unit assignAsCargo _vehicle;
        _unit moveInCargo _vehicle;
    };

    // eqvip
    // nac

    _fn_select = [];
    if(random 100 < 60)then{
        _fn_select = fnc_eqvip_1_streloc_rpg_26;
    }else{
        _fn_select = selectRandom[fnc_eqvip_2_sniper, fnc_eqvip_3_pkp];
    }; 
    [_unit]call _fn_select;

    _unit setSkill 0.5;
    sleep 0.2;

};

// Настраиваем поведение группы
_group setBehaviour "SAFE"; // Поведение: безопасное (для патруля по дорогам)
_group setCombatMode "YELLOW"; // Режим боя: открыть огонь при обнаружении
_group setSpeedMode "NORMAL"; // Скорость: нормальная

// Создаем маршрут по дорогам
for "_i" from 1 to _waypoints do {
    private _wpRoad = selectRandom _roads; // Выбираем случайную дорогу
    private _wpPos = getPos _wpRoad;
    private _wp = _group addWaypoint [_wpPos, 0];
    _wp setWaypointType "MOVE";
    _wp setWaypointFormation "COLUMN"; // Формация: колонна
    _wp setWaypointTimeout [5, 10, 15]; // Задержка в точке (секунды)
};

// Добавляем точку цикла для бесконечного патрулирования
private _cycleWp = _group addWaypoint [getPos (selectRandom _roads), 0];
_cycleWp setWaypointType "CYCLE";
