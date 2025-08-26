// spawnUnitsInBuildings.sqf
// Скрипт для спавна юнитов внутри зданий в заданной области
//[[6475.43,9271.47,0], 100, east, "dev_o_zombie_scientist2_i", 1, 1,1] execVM "Scripts\spawn_enemy_in_bilding.sqf"
params [
    "_center", // Центр области (координаты)
    "_radius",     // Радиус области (в метрах)
    "_side",      // Сторона юнитов (east, west, independent, civilian)
    "_unitType", // Тип юнита
    "_unitEqvip", // Тип екипировки
    "_unitIsMove", // Будет ли перемещатся юнит
    "_unitCount" // Множитель юнитов
];

if(_unitEqvip == 1)then{_unitCount = (ceil((count allPlayers) * 10 + random 10)* _unitCount)}else{_unitCount = (ceil(count allPlayers * 5)*_unitCount)};
if(_unitEqvip > 100)then{_unitEqvip = 100};


// Находим все здания в заданной области
private _buildings = nearestObjects [_center, ["House", "Building"], _radius];

// Проверяем, есть ли здания
if (count _buildings == 0) exitWith {hint "Нет зданий в указанной области!";};

// Создаем группу для юнитов
private _group = createGroup [_side, true];
_group enableDynamicSimulation true;

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

// Спавним юниты
private _spawnCount = _unitCount min (count _buildingPositions); // Не спавним больше, чем есть позиций
for "_i" from 1 to _spawnCount do {
    private _pos = selectRandom _buildingPositions; // Выбираем случайную позицию
    _buildingPositions = _buildingPositions - [_pos]; // Удаляем позицию из массива, чтобы не использовать повторно
    private _unit = _group createUnit [_unitType, _pos, [], 0, "NONE"];
    _unit setPosATL _pos; // Точно устанавливаем юнита на позицию
    doStop _unit; // Заставляем юнита оставаться на месте
    _unit enableDynamicSimulation true; // динамическая симуляция вкл
    if(_unitIsMove == 0) then{
            _unit disableAI "MOVE"};
    _unit setSkill 0.5;

    // eqvip

    // zombie
    if(_unitEqvip == 1)then{
    _fn_select = [];
    if(random 100 < 85)then{
        _fn_select = fnc_eqvip_4_civilian_zombie;
    }else{
        _fn_select = selectRandom[fnc_eqvip_1_streloc_rpg_26_zombie, fnc_eqvip_2_sniper_zombie, fnc_eqvip_3_pkp_zombie];
    }; 
    [_unit]call _fn_select;
    };

    // nac
    if(_unitEqvip == 2)then{
    _fn_select = [];
    if(random 100 < 60)then{
        _fn_select = fnc_eqvip_1_streloc_rpg_26;
    }else{
        _fn_select = selectRandom[fnc_eqvip_2_sniper, fnc_eqvip_3_pkp];
    }; 
    [_unit]call _fn_select;
    };
    sleep 0.2;
};
