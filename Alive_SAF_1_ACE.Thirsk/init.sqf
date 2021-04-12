///////////////////--Basic--///////////////////        -----> https://community.bistudio.com/wiki/enableSaving
waitUntil { isServer || !isNull player };
waitUntil {player == player};

//////////  --Check if HC--  ////////////////
If (!hasInterface && !isDedicated) then {
headlessClients=[];
headlessClients set [(count headlessClients),player];
publicVariable "headlessClients";
isHC = true;
};

#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif
////// -- CLENT -- ///////////
//execNow "functions\zlt_fieldrepair.sqf";
execNow "SA_AdvancedTowing\functions\fn_advancedTowingInit.sqf";
sleep 0.4;
execNow "variables.sqf";

diag_log format["Pre Initialisation Completed"];
	

/////////////////////////////////// SERVER  ////////////////////////////////////////////////////////////////////////

if(isServer) then {
	// -------------------------------------------------------------------------------------------------------------
	// override default data 
	// see script/staticData.sqf
	["MISSION INIT - Waiting"] call ALIVE_fnc_dump;
 
	waitUntil {!isNil "ALiVE_STATIC_DATA_LOADED"};
 
	["MISSION INIT - Continue"] call ALIVE_fnc_dump;
 	// override static data settings
	sleep 0.3
	execNow "staticData.sqf";
	sleep 0.3
 
	["MISSION INIT - Static data override loaded"] call ALIVE_fnc_dump;
diag_log format["staticdata Completed"];

waituntil {!isnil "ALIVE_autoGeneratedTasks"};

// -->> complete list of created tasks -->> ALIVE_autoGeneratedTasks = ["MilAssault","MilDefence","CivAssault","Assassination","TransportInsertion","DestroyVehicles","DestroyInfantry","SabotageBuilding","InsurgencyPatrol","InsurgencyDestroyAssets","Rescue","CSAR"];

ALIVE_autoGeneratedTasks = ["MilAssault","MilDefence","CivAssault","Assassination","DestroyVehicles","DestroyInfantry","InsurgencyPatrol","InsurgencyDestroyAssets","Rescue","CSAR"];

SA_TOW_RULES_OVERRIDE =
	[
		["Tank", "CAN_TOW", "Tank"],
		["Tank", "CAN_TOW", "Truck"],
		["Tank", "CAN_TOW", "Car"],
		["Tank", "CAN_TOW", "Air"],
		["Tank", "CAN_TOW", "ship"],
		["Truck", "CAN_TOW", "Tank"],
		["Truck", "CAN_TOW", "Truck"],
		["Truck", "CAN_TOW", "Car"],
		["Truck", "CAN_TOW", "Air"],
		["Truck", "CAN_TOW", "ship"],
		["Car", "CANT_TOW", "Tank"],
		["Car", "CAN_TOW", "Truck"],
		["Car", "CAN_TOW", "Car"],
		["Car", "CAN_TOW", "Air"],
		["Car", "CAN_TOW", "ship"],
		["ship", "CANT_TOW", "Tank"],
		["ship", "CANT_TOW", "Truck"],
		["ship", "CANT_TOW", "Car"],
		["ship", "CANT_TOW", "Air"],
		["ship", "CAN_TOW", "ship"],
		["Air", "CANT_TOW", "Tank"],
		["Air", "CANT_TOW", "Truck"],
		["Air", "CANT_TOW", "Car"],
		["Air", "CAN_TOW", "Air"],
		["Air", "CANT_TOW", "ship"]
];


