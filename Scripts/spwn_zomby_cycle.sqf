
// [[6469.48,9272.58,0], 100, 10, east, "dev_o_zombie_scientist2_i",10, 4] execVM "Scripts\spwn_zomby_cycle.sqf";

params[
"_center",//: центр поиска.
"_radius", // радиус поиска
"_unitCount",//: желаемое количество юнитов.
"_unitSide",//: сторона юнитов.
"_unitType",//: массив классов юнитов.
"_checkInterval",//: интервал проверки (в секундах).
"_countCuicle" // количество цыклов
];

_group = createGroup [_unitSide, true];
_group enableDynamicSimulation true; // динамическая симуляция вкл

// Основной цикл 
while {_countCuicle >= 0} do { // Подсчитываем живых юнитов в группе
_countCuicle = _countCuicle - 1;

private _currentUnits = units _group select {alive _x};

// Находим все здания в заданной области
private _buildings = nearestObjects [_center, ["House", "Building"], _radius];

// Проверяем, есть ли здания
if (count _buildings == 0) exitWith {hint "Нет зданий в указанной области!";};

// Массив для хранения всех доступных позиций в зданиях
private _buildingPositions = [];

// Собираем позиции внутри зданий
{
    private _building = _x;
    private _positions = _building buildingPos -1; // Получаем все позиции в здании
    {
        _buildingPositions pushBack _x;
    } forEach _positions;
} forEach _buildings;

// Проверяем, есть ли доступные позиции
if (count _buildingPositions == 0) exitWith {hint "Нет доступных позиций в зданиях!";};

//  фильтрует позиции что бы убрать позиции в высотных зданий
_buildingPositions = _buildingPositions select {_x select 2 <= 2};

// Проверяем, нужно ли спавнить новых юнитов
if (count _currentUnits < _unitCount) then {
    private _unitsToSpawn = _unitCount - count _currentUnits;
    
    // Спавним необходимое количество юнитов в ту же группу
    for "_i" from 1 to _unitsToSpawn do {
        
        // Создаем юнит в группе
        private _unit = _group createUnit [_unitType, selectRandom _buildingPositions, [], 0, "NONE"];
        _unit enableDynamicSimulation true;

        _fn_select = [];
        if(random 100 < 85)then{
            _fn_select = fnc_eqvip_4_civilian_zombie;
        }else{
            _fn_select = selectRandom[fnc_eqvip_1_streloc_rpg_26_zombie, fnc_eqvip_2_sniper_zombie, fnc_eqvip_3_pkp_zombie];
        }; 
        [_unit]call _fn_select;

    };
};

// Ждем до следующей проверки
sleep _checkInterval;

};