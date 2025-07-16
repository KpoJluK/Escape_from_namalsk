

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon selectRandom [
    "rhs_weap_ak74mr",
    "rhs_weap_ak74",
    "rhs_weap_ak105",
    "rhs_weap_ak105_zenitco01",
    "rhs_weap_ak74m",
    "rhs_weap_ak74m_fullplum"
    ];
player addPrimaryWeaponItem "rhs_acc_dtk";
player addPrimaryWeaponItem "rhs_acc_2dpZenit_ris";
player addPrimaryWeaponItem "rhs_acc_1p87";
player addPrimaryWeaponItem "rhs_30Rnd_545x39_7N10_AK";
player addWeapon "rhs_weap_makarov_pm";
player addHandgunItem "rhs_mag_9x18_8_57N181S";

comment "Add containers";
player forceAddUniform selectRandom[
    "rhs_uniform_gorka_r_g_gloves",
    "rhs_uniform_gorka_r_y_gloves",
    "rhs_uniform_gorka_1_a",
    "rhs_uniform_afghanka_winter_moldovan_ttsko",
    "rhs_uniform_afghanka_winter_spetsodezhda",
    "rhs_uniform_afghanka_winter_ttsko",
    "rhs_uniform_afghanka_winter_vsr",
    "rhs_uniform_afghanka_winter_vsr_2",
    "rhs_uniform_afghanka_winter_vsr_3"
    ];
player addVest selectRandom[
    "rhs_6b3_AK_2",
    "rhs_6b3_AK",
    "rhs_6b3_AK_2",
    "rhs_6b3_AK_3"
];

comment "Add binoculars";
player addWeapon "Binocular";

comment "Add items to containers";
for "_i" from 1 to 4 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
player addHeadgear selectRandom[
    "rhs_beanie_green",
    "H_Watchcap_blk",
    "H_Watchcap_camo",
    "H_Watchcap_khk"
];
player addGoggles selectRandom[
"rhsusf_shemagh_od",
"rhsusf_shemagh2_od",
"rhsusf_shemagh2_grn"
];

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
