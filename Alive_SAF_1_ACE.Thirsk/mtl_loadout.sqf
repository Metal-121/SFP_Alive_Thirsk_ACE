//by Metal MTL_
// v.1.02.1
/*
This scrip utilizing the BIS_function setUnitLoadout, the array used is the one coming from ACE arsenal. If you want to use this script on non ace loadouts the array is 1 deeper than the one you get from normal arsenal and inside the first /outermost) array I use the units classname. So you need to set up your arrays and name them after the class name for this script to work. Also my sorting for sfp_ need to be changed to the prfix on the units you want to make changes on. The skillsetting for the "other" units is totaly optional and can be deleted so it only have {}; left. exampel for sorting prefix, C_IDAP sorts all idap units, C_Man all default civilians.
TODO: this script can in a fairly easy way be a dressup for the whole mission/s by making some randomization of the gear. Maybe when im in the mode I'll develop this to a onestop need for randomization of the missions units except the one u realy want the control for. 
Mads aka Metal 2021-04-13 
The script is free to use under GNU and this text except the first 2 rows and this row can be removed.
*/
params ["_unit"];
if (isPlayer _unit) exitwith {}; //player unit do not run
if (not Local _unit) exitwith {};
//Not having any loadout option or other for enemy unit, exit with a custom skillset for enemy. 
//This will be the default skillset for all other factions units when they spawn. Script that changes the skillset after that will still do their changes
private _cunit = (typeOf _unit); // get the classname
if (!("sfp_" in _cunit)) exitwith {
		_unit setskill ["aimingaccuracy", (0.15 + ( random 0.2))];// get this and aimingshake higher if you don't like the prolonged firefights
		_unit setskill ["aimingshake", (0.1 +( random 0.2))];
		_unit setskill ["aimingspeed", (0.1 +( random 0.2))]; // time it takes for them to get their aim into focus, seperate it for snipers if you want them be better at first shot
		_unit setskill ["spotdistance", (0.1 +( random 0.2))]; //To high and they see you way to easy. Still see you if you fire at them but not instantly spot you 1000m away
		_unit setskill ["spottime", (0.1 +( random 0.2))];
		_unit setskill ["courage", (0.6 +( random 0.2))];// to low and they always flee
		_unit setskill ["reloadspeed", (0.4 +( random 0.2))];
		_unit setskill ["commanding", (0.6 +( random 0.2))]; // u want this fairly high or AI get stupid
		_unit setskill ["general", (0.25 +( random 0.2))];
};

	//debug comment off before release
	diag_log format["The Class = %1",_cunit];
	comment "klä av enheten";
_unit setUnitLoadout (configFile >> "EmptyLoadout");
//	removeAllWeapons _unit;
//	removeAllItems _unit;
//	removeAllAssignedItems _unit;
//	removeUniform _unit; //gör detta för att kunna använda andra uniformer som öken etc.
//	removeVest _unit;
//	removeBackpack _unit;
//	removeHeadgear _unit;
//	removeGoggles _unit;
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemRadio";     // Which radio will be given is defined via TFAR CBA Settings
	_unit linkItem "ItemWatch";     // give watch or microDAGR not both
	//_unit linkItem "TFAR_microdagr";
	private _sfp_ar=[];
	_sfp_ar = call compile preprocessFileLineNumbers "sfp_full_loadout_list.sqf";
	waitUntil {(count _sfp_ar >  0)};
	private _i = (count _sfp_ar);
	private _j = 0;
	private _l = "";
	private _bunit="";
	while {(_j<_i)} do {
	_bunit = ((_sfp_ar #_j)#0);
	if (_bunit isEqualTo _cunit) then 
		{
		_unit setUnitLoadout ((_sfp_ar #_j)#1);
	// run a custom skillset on the units
		_unit setskill ["aimingaccuracy", (0.75 +( random 0.2))];
		_unit setskill ["aimingshake", (0.7 +( random 0.2))];
		_unit setskill ["aimingspeed", (0.7 +( random 0.2))];
		_unit setskill ["spotdistance", (0.8 +( random 0.2))];
		_unit setskill ["spottime", (0.8 +( random 0.2))];
		_unit setskill ["courage", (0.8 +( random 0.2))];
		_unit setskill ["reloadspeed", (0.7 +( random 0.2))];
		_unit setskill ["commanding", (0.7 +( random 0.2))];
		_unit setskill ["general", (0.7 +( random 0.2))];
/*
	Super AI if this set is used, either on opfor or Bluefor or both
	Just copy paste to appropiate place above overwriting default
		_unit setskill ["aimingaccuracy", 0.9];
		_unit setskill ["aimingshake", 0.9];
		_unit setskill ["aimingspeed", 0.9];
		_unit setskill ["spotdistance", 0.9];
		_unit setskill ["spottime", 1.0];
		_unit setskill ["courage", 0.9];
		_unit setskill ["reloadspeed", 0.9];
		_unit setskill ["commanding", 0.9];
		_unit setskill ["general", 0.9];
*/	
		_j=_i;
		}else
		{ 
		_j =(_j+1);
		};
	};
