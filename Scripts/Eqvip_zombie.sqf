/*
_fn_select = [];
if(random 100 < 85)then{
    _fn_select = fnc_eqvip_4_civilian_zombie;
}else{
    _fn_select = selectRandom[fnc_eqvip_1_streloc_rpg_26_zombie, fnc_eqvip_2_sniper_zombie, fnc_eqvip_3_pkp_zombie];
}; 
[this]call _fn_select;

*/


fnc_eqvip_1_streloc_rpg_26_zombie = { 
 
    params["_this"]; 
 
    removeAllWeapons _this; 
    removeAllItems _this; 
    removeAllAssignedItems _this; 
    removeUniform _this; 
    removeVest _this; 
    removeBackpack _this; 
    removeHeadgear _this; 
    removeGoggles _this; 
 
    comment "Add weapons"; 
    private _firs_weapon = selectRandom["rhs_weap_ak105_zenitco01_b33", "rhs_weap_ak74mr_gp25", "", "", "", ""]; 
    _this addWeapon _firs_weapon; 
    _this addPrimaryWeaponItem selectRandom ["rhs_acc_tgpa" , ""]; 
    _this addPrimaryWeaponItem "rhs_acc_perst3_2dp_light_h"; 
    _this addPrimaryWeaponItem selectRandom ["rhsusf_acc_eotech_552","rhsusf_acc_su230"]; 
    _this addPrimaryWeaponItem "rhs_30Rnd_545x39_7N10_AK"; 
    _this addPrimaryWeaponItem "rhs_acc_grip_rk6"; 
    _this addWeapon selectRandom ["rhs_weap_rpg26", "", "", "", "", "", ""]; 
    _this addWeapon selectRandom ["rhs_weap_pya", "", "", "", ""]; 
 
    comment "Add containers"; 
    _this forceAddUniform "rhsgref_uniform_gorka_1_f"; 
    _this addVest selectRandom ["rhs_6b45_rifleman","rhs_6b45_off"]; 
    private _bacpack = selectRandom ["I_HMG_01_A_weapon_F","B_FieldPack_oli","B_Kitbag_sgg","rhs_rk_sht_30_olive", "","","", "", ""]; 
    _this addBackpack _bacpack; 
    if(_bacpack isNotEqualto "" and _firs_weapon isEqualto "rhs_weap_ak74mr_gp25")then{ 
        for "_i" from 1 to random 10 do {_this addItemToBackpack "rhs_mag_an_m8hc";}; 
        for "_i" from 1 to random 5 do {_this addItemToBackpack "rhs_mag_rgd5";}; 
        for "_i" from 1 to random 4 do {_this addItemToBackpack "rhs_mag_f1";}; 
        for "_i" from 1 to random 4 do {_this addItemToBackpack "rhs_VOG25";}; 
        for "_i" from 1 to random 4 do {_this addItemToBackpack "rhs_VOG25P";}; 
        for "_i" from 1 to random 2 do {_this addItemToBackpack "rhs_VG40OP_white";}; 
        for "_i" from 1 to random 2 do {_this addItemToBackpack "rhs_GRD40_White";}; 
        for "_i" from 1 to random 2 do {_this addItemToBackpack "rhs_VG40MD";}; 
    }; 
 
    comment "Add binoculars"; 
    _this addWeapon "Binocular"; 
 
    comment "Add items to containers"; 
    for "_i" from 1 to (1 + random 1) do {_this addItemToUniform "FirstAidKit";}; 
    _this addItemToUniform "dev_enzymeCapsule"; 
    for "_i" from 1 to (4 + random 1) do {_this addItemToVest "rhs_30Rnd_545x39_7N10_plum_AK";}; 
    for "_i" from 1 to random 1 do {_this addItemToVest "rhs_mag_9x19_17";}; 
    _this addItemToVest "rhs_mag_f1"; 
    _this addHeadgear "rhsusf_opscore_bk"; 
    _this addGoggles selectRandom ["rhsusf_shemagh_grn",
     "rhsusf_shemagh2_grn",
      "rhsusf_shemagh_od", 
      "rhsusf_shemagh2_od", 
      "rhsusf_shemagh_gogg_od",
      "rhsusf_shemagh2_gogg_tan",
      "rhsusf_shemagh_gogg_tan"
      ]; 
 
    comment "Add items"; 
    _this linkItem "ItemMap"; 
    _this linkItem "ItemCompass"; 
    _this linkItem "ItemWatch"; 
    _this linkItem "ItemRadio"; 
    _this linkItem "ItemGPS"; 
    _this linkItem selectRandom["rhsusf_ANPVS_15", "","",""]; 
 
}; 
 
fnc_eqvip_2_sniper_zombie = { 
 
    params["_this"]; 
 
    removeAllWeapons _this; 
    removeAllItems _this; 
    removeAllAssignedItems _this; 
    removeUniform _this; 
    removeVest _this; 
    removeBackpack _this; 
    removeHeadgear _this; 
    removeGoggles _this; 
 
    comment "Add weapons"; 
    comment "Add weapons"; 
    _this addWeapon selectRandom ["rhs_weap_svdp_wd", "", "", "", ""]; 
    _this addPrimaryWeaponItem "rhs_acc_pso1m2"; 
    _this addPrimaryWeaponItem "rhs_10Rnd_762x54mmR_7N1"; 
    _this addWeapon selectRandom ["rhs_weap_pya", "", "","", ""]; 
    _this addHandgunItem "rhs_mag_9x19_17"; 
 
    comment "Add containers"; 
    _this forceAddUniform "rhsgref_uniform_gorka_1_f"; 
    _this addVest selectRandom ["rhs_6b45_rifleman","rhs_6b45_off"]; 
    private _bacpack = selectRandom ["I_HMG_01_A_weapon_F","B_FieldPack_oli","B_Kitbag_sgg","rhs_rk_sht_30_olive", "", "", "", "", "", "", "", ""]; 
    _this addBackpack _bacpack; 
 
    comment "Add binoculars"; 
    _this addWeapon "Binocular"; 
 
    comment "Add items to containers"; 
    for "_i" from 1 to 3 do {_this addItemToUniform "FirstAidKit";}; 
    for "_i" from 1 to 2 do {_this addItemToUniform "dev_enzymeCapsule"}; 
    for "_i" from 1 to 10 do {_this addItemToVest "rhs_10Rnd_762x54mmR_7N1";}; 
    for "_i" from 1 to 8 do {_this addItemToVest "rhs_mag_9x19_17";}; 
    for "_i" from 1 to 8 do {_this addItemToBackpack "rhssaf_tm200_mag";}; 
    for "_i" from 1 to 8 do {_this addItemToBackpack "rhssaf_mine_pma3_mag";}; 
    for "_i" from 1 to 8 do {_this addItemToVest "rhs_mag_f1";}; 
    for "_i" from 1 to 8 do {_this addItemToVest "rhs_mag_an_m8hc";}; 
    _this addHeadgear "rhsusf_opscore_bk"; 
    _this addGoggles selectRandom ["rhsusf_shemagh_grn", "rhsusf_shemagh2_grn", "rhsusf_shemagh_od", "rhsusf_shemagh2_od", "rhsusf_shemagh_gogg_od","rhsusf_shemagh2_gogg_tan","rhsusf_shemagh_gogg_tan"]; 
 
    comment "Add items"; 
    _this linkItem "ItemMap"; 
    _this linkItem "ItemCompass"; 
    _this linkItem "ItemWatch"; 
    _this linkItem "ItemRadio"; 
    _this linkItem "ItemGPS"; 
    _this linkItem selectRandom["rhsusf_ANPVS_15", "","","", "","","", "","","", "","",""]; 
 
}; 


fnc_eqvip_3_pkp_zombie = { 
 
    params["_this"]; 
 
    removeAllWeapons _this; 
    removeAllItems _this; 
    removeAllAssignedItems _this; 
    removeUniform _this; 
    removeVest _this; 
    removeBackpack _this; 
    removeHeadgear _this; 
    removeGoggles _this; 
 
    comment "Add weapons"; 
    comment "Add weapons"; 
    _this addWeapon selectRandom ["rhs_weap_pkp", "","","", "","",""];
    _this addPrimaryWeaponItem "rhs_100Rnd_762x54mmR_7BZ3";
    _this addWeapon selectRandom["rhs_weap_pya", "","","", "","",""]; 
    _this addHandgunItem "rhs_mag_9x19_17"; 
 
    comment "Add containers"; 
    _this forceAddUniform "rhsgref_uniform_gorka_1_f"; 
    _this addVest "rhs_6b45_mg";
    private _bacpack = selectRandom ["I_HMG_01_A_weapon_F","B_FieldPack_oli","B_Kitbag_sgg","rhs_rk_sht_30_olive", "","","", "","",""]; 
    _this addBackpack _bacpack; 
 
    comment "Add binoculars"; 
    _this addWeapon "Binocular"; 
 
    comment "Add items to containers"; 
    for "_i" from 1 to 8 do {_this addItemToUniform "FirstAidKit";}; 
    for "_i" from 1 to 8 do {_this addItemToUniform "dev_enzymeCapsule"}; 
    for "_i" from 1 to 8 do {_this addItemToBackpack "rhs_100Rnd_762x54mmR_7BZ3";};
    _this addHeadgear "rhsusf_opscore_bk"; 
    _this addGoggles selectRandom ["rhsusf_shemagh_grn", "rhsusf_shemagh2_grn", "rhsusf_shemagh_od", "rhsusf_shemagh2_od", "rhsusf_shemagh_gogg_od","rhsusf_shemagh2_gogg_tan","rhsusf_shemagh_gogg_tan"]; 
 
    comment "Add items"; 
    _this linkItem "ItemMap"; 
    _this linkItem "ItemCompass"; 
    _this linkItem "ItemWatch"; 
    _this linkItem "ItemRadio"; 
    _this linkItem "ItemGPS"; 
    _this linkItem selectRandom["rhsusf_ANPVS_15", "","","", "","","", "","",""]; 
 
};

fnc_eqvip_4_civilian_zombie = { 
 
    params["_this"]; 
 
    removeAllWeapons _this; 
    removeAllItems _this; 
    removeAllAssignedItems _this; 
    removeUniform _this; 
    removeVest _this; 
    removeBackpack _this; 
    removeHeadgear _this; 
    removeGoggles _this; 
 
    comment "Add weapons"; 

    _this addWeapon selectRandom["rhs_weap_pya", "","","", "","","", "","","", "","","", "","",""]; 
    _this addHandgunItem "rhs_mag_9x19_17"; 
 
    comment "Add containers"; 
    _this forceAddUniform selectRandom [
        "U_BG_Guerrilla_6_1",
        "U_BG_Guerilla3_1",
        "U_BG_leader",
        "U_C_HunterBody_grn",
        "U_B_GEN_Commander_F", 
        "U_I_E_Uniform_01_sweater_F",
        "U_C_E_LooterJacket_01_F",
        "rhs_uniform_omon",
        "U_C_ConstructionCoverall_Black_F",
        "U_C_ConstructionCoverall_Blue_F",
        "U_C_ConstructionCoverall_Red_F",
        "U_C_ConstructionCoverall_Vrana_F",
        "U_C_Paramedic_01_F",
        "U_C_FormalSuit_01_black_F",
        "U_C_FormalSuit_01_gray_F"
    ]; 
    private _bacpack = selectRandom ["I_HMG_01_A_weapon_F",
        "B_FieldPack_oli",
        "B_Kitbag_sgg",
        "rhs_rk_sht_30_olive",
        "","","", "","","", "","","", "","","", "","","","","","", "","","", "","","", "","","", "","",""
    ]; 
    _this addBackpack _bacpack; 
 
    comment "Add binoculars"; 
    _this addWeapon selectRandom ["Binocular", "", "", "", "", "", "", "", "", "", "", "", ""]; 
 
    comment "Add items to containers"; 
    for "_i" from 1 to (ceil(random 1)) do {_this addItemToUniform "FirstAidKit";};

    _this addHeadgear selectRandom["H_HeadBandage_clean_F",
        "rhs_beanie_green",
        "rhs_beanie",
        "rhs_ushanka", 
        "H_HeadBandage_stained_F",
        "","", "", "", "", ""
    ];
    _this addGoggles selectRandom ["rhsusf_shemagh_grn", 
        "rhsusf_shemagh2_grn",
        "rhsusf_shemagh_od", 
        "rhsusf_shemagh2_od",
        "rhsusf_shemagh_gogg_od",
        "rhsusf_shemagh2_gogg_tan",
        "rhsusf_shemagh_gogg_tan", 
        "", "", "", "", "","", "", "", "", "","", "", "", "", ""
    ]; 

    comment "Add items"; 
    _this linkItem  selectRandom["ItemMap", "", "", "", "", "", "", "", "", "", "", "", ""]; 
    _this linkItem  selectRandom["ItemCompass", "", "", "", "", "", "", "", "", "", "", "", ""]; 
    _this linkItem selectRandom["ItemWatch", "", "", "", "", "", "", "", "", "", "", "", ""]; 
    _this linkItem selectRandom["ItemRadio", "", "", "", "", "", "", "", "", "", "", "", ""]; 
    _this linkItem selectRandom["ItemGPS", "", "", "", "", "", "", "", "", "", "", "", ""]; 
 
};

 

 
