
waitUntil { isServer || !isNull player };

0 = [] execVM "SA_AdvancedTowing\functions\fn_advancedTowingInit.sqf";
player globalChat "advanced towing started";
diag_log format["advanced towing started"];

//Put this in a init of something??
/*0 = ["AIRPORT_SFP","exil","scrap"] execVM "scripts\areadenial.sqf";
player globalChat format["airport denial Started"];
diag_log format["airport denial Started"];
*/	
