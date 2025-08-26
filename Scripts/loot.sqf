if(isServer)then{
// Заменить nil на нужный параметр, по умолчанию лут появится по всей карте и будет состоять из винтовки и гранат
// 1) [0,0,0] - центр поиска зданий для спауна лута
// 2) ["house"],  - типы зданий в которых будет появлятся лут
// 3) 50,  -  радиус поиска зданий от центра

//4) [["arifle_MXC_F",100,1],["HandGrenade",100,3]] -  класс нейм, шанс в % появления, количество 
//Альтернативный - [["arifle_MXC_F",100,ceil (random 3)],["HandGrenade",100,ceil (random 3)]] - в таком случаи количество предметов будет рандомное от 0 до 3

    [    
        nil,
        nil,
        nil, 
        nil 
    ] spawn {
        params [
            ["_centr_poiska", [worldSize / 2, worldSize / 2]],
            ["_type_bilding", ["house"]],
            ["_rarius_poiska", worldSize * sqrt 2 / 2],
            ["_wite_list",
            [ 
            
                ["rhs_30Rnd_545x39_7N10_AK",10,ceil (random 10)],
                ["rhs_100Rnd_762x54mmR_7BZ3",10,ceil (random 19)],
                ["rhs_10Rnd_762x54mmR_7N1",10,ceil (random 10)],
                ["HandGrenade",5,ceil (random 2)]
                
            ]
        ]
        ];

        private _Arry_redy_bildings = []; 

        // поиск зданий который имеют позиции
        { 
            If(!isNil {[_x] call BIS_fnc_buildingPositions select 0}) then {_Arry_redy_bildings pushBack _x} 
        } forEach nearestTerrainObjects
            [
                _centr_poiska,
                _type_bilding,
                _rarius_poiska,
                false
            ];
        

        {  

            for "_i" from 0 to (count ([_x] call BIS_fnc_buildingPositions) - 1) do 
            {
                _select_item = selectRandom _wite_list;
                // создание предмета
                if(random 100 <= _select_item select 1)then
                {
                    private _pos = (([_x] call BIS_fnc_buildingPositions) select _i);
                    _container = "GroundWeaponHolder_Scripted" createVehicle _pos;
                    _container setVehiclePosition [_pos, [], 0, "CAN_COLLIDE"];
                    _container addItemCargoGlobal [_select_item select 0, _select_item select 2]
                    
                };
            };
        } forEach _Arry_redy_bildings; 

    };
};


[[], {
    if(!isDedicated && hasInterface)then{
        player addEventHandler ["Take", {
            params ["_unit", "_container", "_item"];
            if(typeOf _container == "GroundWeaponHolder_Scripted" and (count (itemCargo _container) == 0))then{
                deleteVehicle _container;
            };
        }];
    };
}] remoteExec ["call"];