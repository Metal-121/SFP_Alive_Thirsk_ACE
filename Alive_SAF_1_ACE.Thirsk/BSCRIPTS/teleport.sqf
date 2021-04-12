

// 	Vehicle teleport script
// 	by dj otacon
// 	only for debug 
//	Added teleport vehicle functionality
//  	Based on:
//	Datei:		mapClickTeleport.sqf
//	Mission:	EditingHelper
//	Author:		R0T

/* DECLARE VARIABLES AND FUNCTIONS */

	private ["_textSelect","_textDone"];

/* SET KEY VARIABLES */

	f_telePositionSelected = false;
	_textSelect = "Select on a position on the map";
	_textDone = "Teleport done";

/* TELEPORT FUNCTIONALITY */

	titletext [_textSelect,"plain", 0.4];
	openMap true;
	onMapSingleClick "vehicle player setPos _pos; f_telePositionSelected = true";
	waitUntil {f_telePositionSelected};
	titletext [_textDone,"plain", 0.3];
	openMap false;



