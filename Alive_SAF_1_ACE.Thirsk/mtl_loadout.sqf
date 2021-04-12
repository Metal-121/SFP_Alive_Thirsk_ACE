//by Metal MTL_
params ["_unit"];
private _cunit = (typeOf _unit);
if (!("sfp_" in _cunit)) exitWith {};// wrong mod unit not for this file to run
private _file = "sfp_loadouts.sqf"; //default
private _hv = "sfp_hv_loadouts.sqf";
private _sog = "sfp_sog_loadouts.sqf";
//private _hv = false;
//private _regular = false;
//private _sog = false;
if ("_hv" in _cunit) then {_file =  _hv};
if (("_sog" in _cunit)||("_diver" in _cunit)) then {_file = _sog};
//debug
diag_log format["The Class = %1",_cunit];
comment "klä av enheten";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit; //gör detta för att kunna använda andra uniformer som öken etc.
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";     // Which radio will be given is defined via TFAR CBA Settings
_unit linkItem "ItemWatch";     // give watch or microDAGR not both
//_unit linkItem "TFAR_microdagr";
//if (_hv) then {
	private _sfp_ar=[];
	diag_log format ["filename %1",_file];
	_sfp_ar = call _file;
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
		_j=_i;
		}else
		{ 
		_j =(_j+1);
		};
	};
//};
/*if (_regular) then {
	private _sfp_ar=[];
	_sfp_ar = call compile preprocessFileLineNumbers "sfp_loadouts.sqf";
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
		_j=_i;
		}else
		{ 
		_j =(_j+1);
		};
	};
};
if (_sog)then
	{
	_sfp_ar = call compile preprocessFileLineNumbers "sfp_sog_loadouts.sqf";
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
		_j=_i;
		}else
		{ 
		_j =(_j+1);
		};
	};
};
*/