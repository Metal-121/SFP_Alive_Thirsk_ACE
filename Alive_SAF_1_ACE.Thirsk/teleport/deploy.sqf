    //Mobile Container HQ
    // 0 = [this] execVM "scriptName.sqf"; <--- Put in containers INIT

    sillyflip_fnc_deployHQ = {
        private ["_HQ","_caller","_id","_remove","_add","_camocover","_supply"];
        _HQ = _this select 0;
        _caller = _this select 1;
        _id = _this select 2;
        _remove = [[_HQ,3,_id],"sillyflip_fnc_addActionHQ",true,true] call BIS_fnc_MP;
        _add = [[_HQ,1],"sillyflip_fnc_addActionHQ",true,true] call BIS_fnc_MP;
        _camocover = "CamoNet_BLUFOR_big_F" createVehicle ([ (getPos _HQ select 0)+0.05, (getPos _HQ select 1), (getPos _HQ select 2)+200] );
        _camocover attachTo [_HQ, [0,0,0]];
        detach _camocover;
        _supply = "B_supplyCrate_F" createVehicle ([ (getPos _HQ select 0), (getPos _HQ select 1),(getPos _HQ select 2)+200] );
        _supply attachTo [_HQ, [-0.5,-0.2,0.1]];
        detach _supply;
        true;
    };

    sillyflip_fnc_packHQ = {
        private ["_HQ","_caller","_id","_camocover","_supply","_remove","_add"];
        _HQ = _this select 0;
        _caller = _this select 1;
        _id = _this select 2;
        _camocover = getPos _HQ nearestObject "CamoNet_BLUFOR_big_F";
        _supply = getPos _HQ nearestObject "B_supplyCrate_F";
        _remove = [[_HQ,3,_id],"sillyflip_fnc_addActionHQ",true,true] call BIS_fnc_MP;
        _add = [[_HQ,2],"sillyflip_fnc_addActionHQ",true,true] call BIS_fnc_MP;    
        deleteVehicle _camocover;
        deleteVehicle _supply;
        true;
    };

    sillyflip_fnc_addActionHQ = {
        private ["_civ","_case","_ID","_this"];
        _HQ = _this select 0;
        _case = _this select 1;
        _ID = if (count _this > 2) then {_this select 2} else {nil};
        switch (_case) do {
            case 1: {_HQ addaction ["<t color='#ff1111'>RePackage HQ</t>",sillyflip_fnc_packHQ];};
            case 2: {_HQ addaction ["<t color='#ff1111'>Deploy HQ</t>",sillyflip_fnc_deployHQ];};
            case 3: {_HQ removeAction _ID;};
        };
        _case;
    };

    (_this select 0) addAction ["<t color='#ff1111'>Deploy HQ</t>",sillyflip_fnc_deployHQ]; 

Quick reply to this message Reply   Reply With Quote Reply With Quote   Multi-Quote This Message        