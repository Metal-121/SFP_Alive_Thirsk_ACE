     
 
 
disableserialization;  
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;; Config_Items_Change_To_Fit_Your_Server ;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
     
MapWidthX = 12500; 
MapHeightY = 12500; 
 
resetCounterConfig = 30; ;;; how_Long_Do_you_want_to_give_players_to_board_the_plane_before_it_despawns ;;;;;;; 
         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
 
MapCenter = [(MapWidthX/2),(MapHeightY/2),0]; 
 
NSpawn  = [(MapCenter select 0),((MapCenter select 1) + (MapCenter select 1)) + 250];     
SSpawn = [(MapCenter select 0),((MapCenter select 1) - (MapCenter select 1)) - 250]; 
     
ESpawn = [((MapCenter select 1) + (MapCenter select 1)) +250 ,(MapCenter select 0)];      
WSpawn = [((MapCenter select 1)  - (MapCenter select 1)) - 250,(MapCenter select 0)];  
 
 
MarkerIconLength = (MapWidthX * .50); 
 
 
 
 
 
 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  
;;;;;;;;;;;;;;;;;;;;;;;; VectorApproach ;;;;;;;;;;;;;;;;;;;;;;;;                    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
             
 resetcheck = 0; 
   
this addAction ["<t color='#04ff00'>-Select North Approach</t>",  
{                      
 ["<t color='#14CE22' size = '.8'>Northern Approach Selected<br /> <t color='#ff0000' size = ' .8'>Assemble Your Crew inside the Yellow Box and Board the Plane!!</t>",-1,1,6,0,0,789] spawn BIS_fnc_dynamicText;              
  
 
 switch (true) do 
 { 
  case (resetCheck == 1): 
  { 
   deleteMarker N_Marker; 
   deleteVehicle HaloJoinPos;      
   deleteVehicle HaloJoinPosW;      
   deleteVehicle HaloJoinPosE;      
   deleteVehicle HaloJoinPosN;      
   deleteVehicle HaloJoinPosS;  
   deleteVehicle SpawnLOC;  
  }; 
  case (resetCheck == 2): 
  { 
   deleteMarker S_Marker; 
   deleteVehicle HaloJoinPos;      
   deleteVehicle HaloJoinPosW;      
   deleteVehicle HaloJoinPosE;      
   deleteVehicle HaloJoinPosN;      
   deleteVehicle HaloJoinPosS;  
   deleteVehicle SpawnLOC;  
  }; 
  case (resetCheck == 3): 
  { 
   deleteMarker E_Marker; 
   deleteVehicle HaloJoinPos;      
   deleteVehicle HaloJoinPosW;      
   deleteVehicle HaloJoinPosE;      
   deleteVehicle HaloJoinPosN;      
   deleteVehicle HaloJoinPosS; 
 deleteVehicle SpawnLOC;    
  }; 
  case (resetCheck == 4): 
  { 
   deleteMarker W_Marker; 
   deleteVehicle HaloJoinPos;      
   deleteVehicle HaloJoinPosW;      
   deleteVehicle HaloJoinPosE;      
   deleteVehicle HaloJoinPosN;      
   deleteVehicle HaloJoinPosS;  
   deleteVehicle SpawnLOC;  
  }; 
 }; 
    
     
   
 N_Marker = createMarkerLocal ["N_Marker", [NSpawn select 0, NSpawn select 1]];   
 "N_Marker" setMarkerColor "ColorBlue"; 
 "N_Marker" setMarkerShapeLocal "RECTANGLE"; 
 "N_Marker" setMarkerSizeLocal [500, MarkerIconLength]; 
 "N_Marker" setMarkerDirLocal 90; 
     
 _MinSpawn = (NSpawn select 0) - (MarkerIconLength * .5); 
 _NorthVect = _MinSpawn + round (random MarkerIconLength);              
 _SpawnLOC = createVehicle ["HeliHEmpty", [_NorthVect, NSpawn select 1 , 500], [], 0, "NONE"];                         
 _SpawnLOC setVehicleVarName "SpawnLOC"; SpawnLOC = _SpawnLOC;            
    
 _HaloJoinPos = createVehicle ["VR_Area_01_circle_4_yellow_F", getPos player, [] , 0, "CAN_COLLIDE"];        
    
 _HaloJoinPosW = createVehicle ["xcam_Line_short_F", [(getPos player select 0) -10, (getPos player select 1) +0], [] , 0, "CAN_COLLIDE"];        
 _HaloJoinPosE = createVehicle ["xcam_Line_short_F", [(getPos player select 0) +10, (getPos player select 1) +0], [] , 0, "CAN_COLLIDE"];       
 _HaloJoinPosN = createVehicle ["xcam_Line_short_F", [(getPos player select 0) -0, (getPos player select 1) +10], [] , 0, "CAN_COLLIDE"];      
 _HaloJoinPosS = createVehicle ["xcam_Line_short_F", [(getPos player select 0) +0, (getPos player select 1) -10], [] , 0, "CAN_COLLIDE"];      
    
 _HaloJoinPosW setDir 90;      
 _HaloJoinPosE setDir 90;      
 _HaloJoinPosN setDir 0;      
 _HaloJoinPosS setDir 0;      
    
 HaloJoinPos = _HaloJoinPos;      
    
 HaloJoinPosW = _HaloJoinPosW;       
 HaloJoinPosE = _HaloJoinPosE;       
 HaloJoinPosN = _HaloJoinPosN;       
 HaloJoinPosS = _HaloJoinPosS;       
   
   
 resetcheck = 1; 
 
 resetCounter = resetCounterConfig; 
 
 if (resetcheck > 0) then 
 { 
	resetCounter = resetCounterConfig; 
	while {resetCounter > 0  && (player distance2d HaloJoinPos) < 50} do 
	{ 
		hint format ["%1 until the DYNAMIC HALO resets", resetCounter]; 
		resetCounter = resetCounter - 1; 
		sleep 1;    
	}; 
   
	hint format [""]; 
  
  switch (true) do 
  { 
   case (resetCheck == 1): 
   { 
    deleteMarker N_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
   resetcheck = 0; 
   }; 
   case (resetCheck == 2): 
   { 
    deleteMarker S_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
     
    resetcheck = 0; 
   }; 
   case (resetCheck == 3): 
   { 
    deleteMarker E_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
   }; 
   case (resetCheck == 4): 
   { 
    deleteMarker W_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
 
   }; 
    
    
  }; 
 };   
}];            
     
this addAction ["<t color='#04ff00'>-Select South Approach</t>", {                      
["<t color='#14CE22' size = '.8'>Southern Approach Selected<br /> <t color='#ff0000' size = ' .8'>Assemble Your Crew inside the Yellow Box and Board the Plane!!</t>",-1,1,6,0,0,789] spawn BIS_fnc_dynamicText;        
  
switch (true) do 
{ 
 case (resetCheck == 1): 
 { 
  deleteMarker N_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS;  
  deleteVehicle SpawnLOC; 
  resetcheck = 0;   
 }; 
 case (resetCheck == 2): 
 { 
  deleteMarker S_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS;  
  deleteVehicle SpawnLOC; 
  resetcheck = 0; 
 }; 
 case (resetCheck == 3): 
 { 
  deleteMarker E_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS; 
  deleteVehicle SpawnLOC;  
  resetcheck = 0; 
   
 }; 
 case (resetCheck == 4): 
 { 
  deleteMarker W_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS;  
  deleteVehicle SpawnLOC; 
  resetcheck = 0; 
 }; 
}; 
     
  
S_Marker = createMarkerLocal ["S_Marker", [SSpawn select 0, SSpawn select 1]];   
"S_Marker" setMarkerColor "ColorBlue"; 
"S_Marker" setMarkerShapeLocal "RECTANGLE"; 
"S_Marker" setMarkerSizeLocal [500, MarkerIconLength]; 
"S_Marker" setMarkerDirLocal 90;    
 
_MinSpawn = (SSpawn select 0) - (MarkerIconLength * .5); 
 
_SouthVect = _MinSpawn  + round (random MarkerIconLength);            
_SpawnLOC = createVehicle ["HeliHEmpty", [_SouthVect,SSpawn select 1, 500], [], 0, "NONE"];                        
_SpawnLOC setVehicleVarName "SpawnLOC"; SpawnLOC = _SpawnLOC;            
     
_HaloJoinPos = createVehicle ["VR_Area_01_circle_4_yellow_F", getPos player, [] , 0, "CAN_COLLIDE"];      
_HaloJoinPosW = createVehicle ["xcam_Line_short_F", [(getPos player select 0) -10, (getPos player select 1) +0], [] , 0, "CAN_COLLIDE"];        
_HaloJoinPosE = createVehicle ["xcam_Line_short_F", [(getPos player select 0) +10, (getPos player select 1) +0], [] , 0, "CAN_COLLIDE"];       
_HaloJoinPosN = createVehicle ["xcam_Line_short_F", [(getPos player select 0) -0, (getPos player select 1) +10], [] , 0, "CAN_COLLIDE"];      
_HaloJoinPosS = createVehicle ["xcam_Line_short_F", [(getPos player select 0) +0, (getPos player select 1) -10], [] , 0, "CAN_COLLIDE"];      
   
_HaloJoinPosW setDir 90;      
_HaloJoinPosE setDir 90;      
_HaloJoinPosN setDir 0;      
_HaloJoinPosS setDir 0;      
   
HaloJoinPos = _HaloJoinPos;   
HaloJoinPosW = _HaloJoinPosW;       
HaloJoinPosE = _HaloJoinPosE;       
HaloJoinPosN = _HaloJoinPosN;       
HaloJoinPosS = _HaloJoinPosS;  
 
 
resetCheck = 2; 

resetCounter = resetCounterConfig; 
 
 if (resetcheck > 0) then 
 { 
	resetCounter = resetCounterConfig; 
	while {resetCounter > 0  && (player distance2d HaloJoinPos) < 50} do 
	{ 
	hint format ["%1 until the DYNAMIC HALO resets", resetCounter]; 
	resetCounter = resetCounter - 1; 
	sleep 1; 
    
	}; 
   
	hint format [""]; 
  
  switch (true) do 
  { 
   case (resetCheck == 1): 
   { 
    deleteMarker N_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
   resetcheck = 0; 
   }; 
   case (resetCheck == 2): 
   { 
    deleteMarker S_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
     
    resetcheck = 0; 
   }; 
   case (resetCheck == 3): 
   { 
    deleteMarker E_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
   }; 
   case (resetCheck == 4): 
   { 
    deleteMarker W_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
 
   }; 
    
    
  }; 
 };   
      
}];            
     
this addAction ["<t color='#04ff00'>-Select East Approach</t>", {                      
["<t color='#14CE22' size = '.8'>Eastern Approach Selected<br /> <t color='#ff0000' size = ' .8'>Assemble Your Crew inside the Yellow Box and Board the Plane!!</t>",-1,1,6,0,0,789] spawn BIS_fnc_dynamicText;        
  
 
switch (true) do 
{ 
 case (resetCheck == 1): 
 { 
  deleteMarker N_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS;  
  deleteVehicle SpawnLOC; 
  resetcheck = 0; 
 }; 
 case (resetCheck == 2): 
 { 
  deleteMarker S_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS;  
  deleteVehicle SpawnLOC; 
  resetcheck = 0; 
 }; 
 case (resetCheck == 3): 
 { 
  deleteMarker E_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS; 
  deleteVehicle SpawnLOC;  
  resetcheck = 0; 
 }; 
 case (resetCheck == 4): 
 { 
  deleteMarker W_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS;  
  deleteVehicle SpawnLOC; 
  resetcheck = 0; 
 }; 
}; 
 
 
E_Marker = createMarkerLocal ["E_Marker", [ESpawn select 0, ESpawn select 1]];   
"E_Marker" setMarkerColor "ColorBlue"; 
"E_Marker" setMarkerShapeLocal "RECTANGLE"; 
"E_Marker" setMarkerSizeLocal [500, MarkerIconLength]; 
"E_Marker" setMarkerDirLocal 0;   
 
_MinSpawn = (ESpawn select 1) - (MarkerIconLength * .5); 
   
_EastVect = _MinSpawn + round (random MarkerIconLength);             
_SpawnLOC = createVehicle ["HeliHEmpty", [ESpawn select 0, _EastVect, 500], [], 0, "NONE"];                         
_SpawnLOC setVehicleVarName "SpawnLOC"; SpawnLOC = _SpawnLOC;            
 
_HaloJoinPos = createVehicle ["VR_Area_01_circle_4_yellow_F", getPos player, [] , 0, "CAN_COLLIDE"];        
   
_HaloJoinPosW = createVehicle ["xcam_Line_short_F", [(getPos player select 0) -10, (getPos player select 1) +0], [] , 0, "CAN_COLLIDE"];        
_HaloJoinPosE = createVehicle ["xcam_Line_short_F", [(getPos player select 0) +10, (getPos player select 1) +0], [] , 0, "CAN_COLLIDE"];       
_HaloJoinPosN = createVehicle ["xcam_Line_short_F", [(getPos player select 0) -0, (getPos player select 1) +10], [] , 0, "CAN_COLLIDE"];      
_HaloJoinPosS = createVehicle ["xcam_Line_short_F", [(getPos player select 0) +0, (getPos player select 1) -10], [] , 0, "CAN_COLLIDE"];      
   
_HaloJoinPosW setDir 90;      
_HaloJoinPosE setDir 90;      
_HaloJoinPosN setDir 0;      
_HaloJoinPosS setDir 0;      
   
HaloJoinPos = _HaloJoinPos;     
HaloJoinPosW = _HaloJoinPosW;       
HaloJoinPosE = _HaloJoinPosE;       
HaloJoinPosN = _HaloJoinPosN;       
HaloJoinPosS = _HaloJoinPosS;  
 
resetCheck = 3; 
 
resetCounter = resetCounterConfig; 
 
 if (resetcheck > 0) then 
 { 
	resetCounter = resetCounterConfig; 
	while {resetCounter > 0  && (player distance2d HaloJoinPos) < 50} do 
	{ 
	hint format ["%1 until the DYNAMIC HALO resets", resetCounter]; 
	resetCounter = resetCounter - 1; 
	sleep 1; 
    
	}; 
   
	hint format [""]; 
  
  switch (true) do 
  { 
   case (resetCheck == 1): 
   { 
    deleteMarker N_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
   resetcheck = 0; 
   }; 
   case (resetCheck == 2): 
   { 
    deleteMarker S_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
     
    resetcheck = 0; 
   }; 
   case (resetCheck == 3): 
   { 
    deleteMarker E_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
   }; 
   case (resetCheck == 4): 
   { 
    deleteMarker W_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
 
   }; 
    
    
  }; 
 };    
}];            
     
this addAction ["<t color='#04ff00'>-Select West Approach</t>", {                      
["<t color='#14CE22' size = '.8'>Western Approach Selected<br /> <t color='#ff0000' size = ' .8'>Assemble Your Crew inside the Yellow Box and Board the Plane!!</t>",-1,1,6,0,0,789] spawn          
BIS_fnc_dynamicText;        
  
 
   
    
   
 
switch (true) do 
{ 
 case (resetCheck == 1): 
 { 
  deleteMarker N_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS; 
  deleteVehicle SpawnLOC;   
  resetcheck = 0; 
 }; 
 case (resetCheck == 2): 
 { 
  deleteMarker S_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS; 
  deleteVehicle SpawnLOC;   
  resetcheck = 0; 
 }; 
 case (resetCheck == 3): 
 { 
  deleteMarker E_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS;
  deleteVehicle SpawnLOC;   
  resetcheck = 0; 
 }; 
 case (resetCheck == 4): 
 { 
  deleteMarker W_Marker; 
  deleteVehicle HaloJoinPos;      
  deleteVehicle HaloJoinPosW;      
  deleteVehicle HaloJoinPosE;      
  deleteVehicle HaloJoinPosN;      
  deleteVehicle HaloJoinPosS;
  deleteVehicle SpawnLOC;     
  resetcheck = 0; 
 }; 
}; 
 
 
W_Marker = createMarkerLocal ["W_Marker", [WSpawn select 0, WSpawn select 1]];   
"W_Marker" setMarkerColor "ColorBlue"; 
"W_Marker" setMarkerShapeLocal "RECTANGLE"; 
"W_Marker" setMarkerSizeLocal [500, MarkerIconLength]; 
"W_Marker" setMarkerDirLocal 0; 
    
 
_MinSpawn = (WSpawn select 1) - (MarkerIconLength * .5);    
   
_WestVect = _MinSpawn + round (random MarkerIconLength);              
_SpawnLOC = createVehicle ["HeliHEmpty", [WSpawn select 0, _WestVect, 500], [], 0, "NONE"];                         
_SpawnLOC setVehicleVarName "SpawnLOC"; SpawnLOC = _SpawnLOC;            
     
SpawnLOCTest = 1;      
  
    
_HaloJoinPos = createVehicle ["VR_Area_01_circle_4_yellow_F", getPos player, [] , 0, "CAN_COLLIDE"];     
_HaloJoinPosW = createVehicle ["xcam_Line_short_F", [(getPos player select 0) -10, (getPos player select 1) +0], [] , 0, "CAN_COLLIDE"];        
_HaloJoinPosE = createVehicle ["xcam_Line_short_F", [(getPos player select 0) +10, (getPos player select 1) +0], [] , 0, "CAN_COLLIDE"];       
_HaloJoinPosN = createVehicle ["xcam_Line_short_F", [(getPos player select 0) -0, (getPos player select 1) +10], [] , 0, "CAN_COLLIDE"];      
_HaloJoinPosS = createVehicle ["xcam_Line_short_F", [(getPos player select 0) +0, (getPos player select 1) -10], [] , 0, "CAN_COLLIDE"];      
   
_HaloJoinPosW setDir 90;      
_HaloJoinPosE setDir 90;      
_HaloJoinPosN setDir 0;      
_HaloJoinPosS setDir 0;      
   
HaloJoinPos = _HaloJoinPos;      
   
HaloJoinPosW = _HaloJoinPosW;       
HaloJoinPosE = _HaloJoinPosE;       
HaloJoinPosN = _HaloJoinPosN;       
HaloJoinPosS = _HaloJoinPosS; 
 
resetCheck = 4; 

resetCounter = resetCounterConfig; 
 
 if (resetcheck > 0) then 
 { 
	resetCounter = resetCounterConfig; 
	while {resetCounter > 0  && (player distance2d HaloJoinPos) < 50} do 
	{ 
	hint format ["%1 until the DYNAMIC HALO resets", resetCounter]; 
	resetCounter = resetCounter - 1; 
	sleep 1; 
    
	}; 
   
	hint format [""]; 
  
  switch (true) do 
  { 
   case (resetCheck == 1): 
   { 
    deleteMarker N_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
   resetcheck = 0; 
   }; 
   case (resetCheck == 2): 
   { 
    deleteMarker S_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
     
    resetcheck = 0; 
   }; 
   case (resetCheck == 3): 
   { 
    deleteMarker E_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
   }; 
   case (resetCheck == 4): 
   { 
    deleteMarker W_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
 
   }; 
    
    
  }; 
 };    
 
}];          
  
  
  
  
 
 this addAction ["<t color='#C37B2B'>Reset HALO Spawn</t>",   
 {     
   
   
  switch (true) do 
  { 
   case (resetCheck == 1): 
   { 
    deleteMarker N_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
   resetcheck = 0; 
   }; 
   case (resetCheck == 2): 
   { 
    deleteMarker S_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
     
    resetcheck = 0; 
   }; 
   case (resetCheck == 3): 
   { 
    deleteMarker E_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
   }; 
   case (resetCheck == 4): 
   { 
    deleteMarker W_Marker; 
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;  
    deleteVehicle SpawnLOC;  
    
    resetcheck = 0; 
 
	}; 
};	
      
 }];   
  
     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   
;;;;;;;;;;;;;;;;;;;;;  MOVE_IN_PLANE  ;;;;;;;;;;;;;;;;                    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                    
         
        
this addAction ["<t color='#0040ff'>----------------------------------------<br /> Board Plane</t>",  {                    
  
  
If (resetCheck < 1) exitwith 
{ 
 ["<t color='#14CE22' size = '.8'>No Vector Location Selected.<br /> <t color='#ff0000' size = ' .8'>You cannot board the plane without a flight plane!!</t>",-1,-1,6,0,0,789] spawn BIS_fnc_dynamicText;              
}; 
  
  
  
  
 _randomPlane = selectRandom [      
             
         "B_SwedenArmy_TP_84_Hercules_Transport_WDL_01"                
        ];   
 
  
_WPoint = createVehicle ["HeliHEmpty",MapCenter, [], 0, "NONE"];            
_WPoint setVehicleVarName "WPoint"; WPoint = _WPoint;              
   
sleep 1;          
   
               
_planeSW = createVehicle [_randomPlane, getpos SpawnLOC, [], 0, "FLY"];           
    
_planeSW setVehicleVarName "planeSW"; planeSW =  _planeSW;                         
publicVariable "planeSW";                     
  
  
  
createVehicleCrew _planeSW;      
    
   
_planeSW setBehaviour "CARELESS";                     
_planeSW setCaptive true;          
     
_planeSW move position WPoint;           
   
sleep 1;    
 
removeallActions _planeSW;        
  
Switch (true) do {            
   
case  (resetCheck == 1):             
 {_planeSW setDir 180};            
    
case   (resetCheck == 2):            
 {_planeSW setDir 0};            
    
case   (resetCheck == 3):            
 {_planeSW setDir 270};              
     
case   (resetCheck == 4):            
 {_planeSW setDir 90};            
   
};            
   
     
   
_planeSW flyInHeight 2000;                        
_planeSW setVelocityModelSpace [0, 400, 0];                      
_planeSW setVehicleVarName "planeSW"; planeSW = _planeSW;                         
publicVariable "planeSW";          
  
  
   
{if (!isPlayer _x)  then  
{        
 removeBackpack _x;      
 _x addBackpack "B_Parachute";     
 _x moveInCargo planeSW;      
}; 
} foreach units group player;         
  
sleep 1;        
  
   
{ 
 if ((isPlayer _x) && (_x distance2d HaloJoinPos) < 30) then  
 {  
 removeBackpack _x;      
 _x addBackpack "B_Parachute";     
  _x moveInCargo planeSW;    
 }; 
} foreach allPlayers;        
  
  
  
player moveInCargo planeSW;    
   
  
  
   
deleteVehicle HaloJoinPos;      
   
deleteVehicle HaloJoinPosW;      
deleteVehicle HaloJoinPosE;      
deleteVehicle HaloJoinPosN;      
deleteVehicle HaloJoinPosS;     
 
 
  switch (true) do 
  { 
   case (resetCheck == 1): 
   { 
    deleteMarker N_Marker; 
   }; 
   case (resetCheck == 2): 
   { 
    deleteMarker S_Marker; 
   }; 
   case (resetCheck == 3): 
   { 
    deleteMarker E_Marker; 
   }; 
   case (resetCheck == 4): 
   { 
    deleteMarker W_Marker; 
   }; 
  }; 
   
resetCheck = 0; 
  
 
   
if (isNil "MarkerWPCheck") then 
{ 
MarkerWPCheck = 0; 
};  
    
 
                   
      
["<t color='#14CE22' size = '.8'>Enjoy the flight.<br /> <t color='#ff0000' size = ' .8'>Watch the terrain, adjust your height as necessary</t>",-1,1,3,1,0,789] spawn          
BIS_fnc_dynamicText;              
    
_planeSW addAction ["<t color='#00ffa6'>Select Your Flight Destination</t>",                       
{openMap true;                  
 
   
    
["<t color='#14CE22' size = '.8'>CLICK on the map to select your Destination</t>",-1,1,5,0,0,789] spawn BIS_fnc_dynamicText;        
onMapSingleClick {   
 
if (MarkerWPCheck == 1) then 
{ 
deleteMarker WP_Marker; 
};  
            
deleteVehicle WPoint;            
onMapSingleClick {};                            
_WPoint = createVehicle ["HeliHEmpty", _pos, [], 0, "NONE"];              
_WPoint setVehicleVarName "WPoint"; WPoint = _WPoint;    
 
WP_Marker = createMarkerLocal ["WP_Marker", _pos];   
"WP_Marker" setMarkerColor "ColorYellow"; 
"WP_Marker" setMarkerTypeLocal "mil_objective"; 
 
MarkerWPCheck = 1; 
 
          
   
["<t color='#14CE22' size = '.8'>Destination Selected<br /> <t color='#ff0000' size = ' .8'>Plotting New Course Now.</t>",-1,-1,5,0,0,789] spawn BIS_fnc_dynamicText;                          
openMap false;                          
true;  
 
	switch (true) do  
	{ 
		case (planeSW iskindof "B_T_VTOL_01_infantry_F"): 
		{ 
			planeSW removeaction 0; 
		}; 
		default 
		{ 
			planeSW removeAction 1; 
		}; 
    }; 
                         
};            
  
sleep 3;          
planeSW move position WPoint;           
["<t color='#14CE22' size = '.8'>Making Requested Course Adjustments</t>",-1,-1,4,0,0,789] spawn BIS_fnc_dynamicText;          
    
}];     
  
 
_planeSW addAction ["<t color='#E4EE22'>Return to Course<br />--------------------------------------------------------------------</t>", {                 
planeSW move position WPoint;                        
}];      
 
     
_planeSW addAction ["<t color='#FF0000'>-75m High Impact Risk </t>", {                        
planeSW flyInHeight 75;                        
}];                   
   
_planeSW addAction ["<t color='#DF7401'>-150m Slight Impact Risk</t>", {                        
planeSW flyInHeight 150;                       
}];                         
   
_planeSW addAction ["<t color='#04ff00'>-300m</t>", {                        
planeSW flyInHeight 300;                       
}];                                                
     
_planeSW addAction ["<t color='#04ff00'>-500m<br />--------------------------------------------------------------------</t>", {                        
planeSW flyInHeight 500;                       
}];
            
_planeSW addAction ["<t color='#04ff00'>-2000m<br />--------------------------------------------------------------------</t>", {                        
planeSW flyInHeight 2000;                       
}];            
   
  
_planeSW addAction ["<t color='#35A340'> **Command ONLY AI to JUMP**</t>", {       
   
    
{ 
 if (!(isplayer _x) && (_x distance2d planeSW) < 25) then  
 {      
   _x allowDamage false;    
   _x action ["getout", planeSW];    
 }; 
} foreach units group player;       
   
  
{ 
 if (!(isplayer _x) && (_x distance2d planeSW) > 300)  then  
 {     
  waitUntil {istouchingGround _x};    
  _x allowDamage true;    
 }; 
} foreach units group player;  
      
}];        
   
   
   
_planeSW addAction ["<t color='#D9BD3B'> **Command ALL AI and PLAYERS to JUMP**</t>", {         
  
{ 
 if (!(isplayer _x) && (_x distance2d planeSW) < 25) then  
 {       
  _x allowDamage false;     
  _x action ["getout", planeSW];    
 }; 
} foreach units group player;    
 
 
sleep 2; 
{ 
if ((isplayer _x) && (_x distance2d planeSW) < 25) then  
 {      
  _x action ["eject", planeSW];    
 }; 
} foreach allPlayers;       
  
  
{if (!(isplayer _x) && (_x distance2d planeSW) > 300)  then {     
   
waitUntil {istouchingGround _x};    
_x allowDamage true;    
  
};} foreach units group player;   
 
if (MarkerWPCheck == 1) then 
{ 
deleteMarker WP_Marker; 
MarkerWPCheck = 0;  
};           
  
  
sleep 5;      
["<t color='#14CE22' size = '.8'>All Soldiers Have Jumped!!!<br /> <t color='#ff0000' size = ' .8'>Good Luck and Give'em Hell!!.</t>",-1,-1,4,0,0,789] spawn          
BIS_fnc_dynamicText;        
  
}];           
  
  
  
      
_meters = _planeSW distance2d _WPoint;                 
       
       
while {(_meters > 300) && (((getPos Player) distance2d planeSW) < 50)} do                 
       
{                 
_meters = _planeSW distance2d WPoint;                 
    
   
if (_meters > 6800 && _meters < 7000) then {                 
   
["<t color='#14CE22' size = '.8'>Jump Point 7000 Meters<br /> <t color='#ff0000' size = ' .8'>Watch out for SAMS/AAA Defenses</t>",-1,1,4,0,0,789] spawn BIS_fnc_dynamicText;              
   
};                 
    
    
if (_meters > 5800 && _meters < 6000) then {                     
   
["<t color='#14CE22' size = '.8'>Jump Point 6000 Meters</t>",-1,1,4,0,0,789] spawn BIS_fnc_dynamicText;              
   
};               
   
     
if (_meters > 4800 && _meters < 5000) then {                 
    
["<t color='#14CE22' size = '.8'>Jump Point 5000 Meters<br /> <t color='#ff0000' size = ' .8'>Check your gear!!</t>",-1,1,4,0,0,789] spawn BIS_fnc_dynamicText;              
     
};                 
    
if (_meters > 3800 && _meters < 4000) then  {               
    
 ["<t color='#14CE22' size = '.8'>Jump Point 4000 Meters<br /> <t color='#ff0000' size = ' .8'>AI will Jump Automatically over Selected HALO Point!!</t>",-1,1,4,0,0,789] spawn BIS_fnc_dynamicText;             
     
};                  
   
if (_meters > 2800 && _meters < 3000) then {                
    
 ["<t color='#14CE22' size = '.8'>Jump Point 3000 Meters<br /> <t color='#ff0000' size = ' .8'>Doors Opening, Perpare to Jump!!</t>",-1,1,4,0,0,789] spawn BIS_fnc_dynamicText;      
   
   
_planeSW animate ["back_ramp", 1];                 
               
_planeSW animate ["back_ramp_st", 1];                 
    
_planeSW animate ["back_ramp_p", 1];                  
_planeSW animate ["back_ramp_p_2", 1];                  
_planeSW animate ["back_ramp_door_main", 1];                  
   
_planeSW animate ["ramp_top", 1];                 
_planeSW animate ["ramp_bottom", 1];                 
    
_planeSW animate ["CUP_Mi17_Cargo02", 1];  
     
_planeSW animate ["Compartment1", 1];   
_planeSW animate ["Compartment2", 1];  
     
_planeSW animate ["CUP_C130_Cargo02", 1];     
       
_planeSW animateDoor ["Compartment1", 1];   
_planeSW animateDoor ["Compartment2", 1];  
  
_planeSW animateDoor ["CUP_Mi17_Cargo02", 1];   
    
  
};                 
  
  
if (_meters > 1800 && _meters < 2000) then {                
    
["<t color='#14CE22' size = '.8'>Jump Point 2000 Meters<br /> <t color='#ff0000' size = ' .8'>Drop Point in sight</t>",-1,1,4,0,0,789] spawn BIS_fnc_dynamicText;              
  
};                 
  
If (_meters > 800 && _meters < 1000) then {               
    
["<t color='#14CE22' size = '.8'>Jump Point 1000 Meters</t>",-1,1,4,0,0,789] spawn BIS_fnc_dynamicText;     
  
  
  
[_planeSW, "CMFlareLauncher"] call BIS_fnc_fire;  
[_planeSW, "CMFlareLauncher_Triples"] call BIS_fnc_fire;  
  
sleep .2;  
  
[_planeSW, "CMFlareLauncher"] call BIS_fnc_fire;  
[_planeSW, "CMFlareLauncher_Triples"] call BIS_fnc_fire;  
  
sleep .2;  
   
[_planeSW, "CMFlareLauncher"] call BIS_fnc_fire;  
[_planeSW, "CMFlareLauncher_Triples"] call BIS_fnc_fire;  
  
sleep .2;  
   
[_planeSW, "CMFlareLauncher"] call BIS_fnc_fire;  
[_planeSW, "CMFlareLauncher_Triples"] call BIS_fnc_fire;  
              
   
};                 
    
If (_meters > 400 && _meters < 600) then  
{              
 ["<t color='#14CE22' size = '.8'>Jump Point 500 Meters<br /> <t color='#ff0000' size = ' .8'>Jump when Ready</t>",-1,1,4,0,0,789] spawn BIS_fnc_dynamicText;                 
};           
   
If (_meters < 350) then {                
    
["<t color='#14CE22' size = '.8'>JUMP, JUMP, JUMP<br /> <t color='#ff0000' size = ' .8'>the plane will despawn in 120 seconds.</t>",-1,-1,4,0,0,789] spawn BIS_fnc_dynamicText;    
  
{ 
 if (!(isplayer _x) && (_x distance2d planeSW) < 25) then  
 {     
  _x allowDamage false;       
  _x action ["getout", planeSW];    
 }; 
} foreach units group player;    
 
sleep 2; 
{ 
 if ((isplayer _x) && (_x distance2d planeSW) < 25) then  
 {    
  _x action ["eject", planeSW];    
 }; 
} foreach allPlayers;      
  
  
{if (!(isplayer _x) && (_x distance2d planeSW) > 300)  then {     
   
waitUntil {istouchingGround _x};    
_x allowDamage true;    
  
};} foreach units group player;   
 
if (MarkerWPCheck == 1) then 
{ 
deleteMarker WP_Marker; 
MarkerWPCheck = 0;  
};    
        
   
     
sleep 3;       
["<t color='#14CE22' size = '.8'>Thank you for Using Ketanna's DYNAMIC HALO JUMP.<br /> <t color='#ff0000' size = ' .8'>All Soldiers have Jumped!!.</t>",-1,-1,4,0,0,789] spawn BIS_fnc_dynamicText;         
     
_planeSW animate ["back_ramp", 1];                 
                    
_planeSW animate ["back_ramp_st", 0];                 
    
_planeSW animate ["back_ramp_p", 0];                  
_planeSW animate ["back_ramp_p_2", 0];                  
_planeSW animate ["back_ramp_door_main", 0];                  
    
_planeSW animate ["ramp_top", 0];                 
_planeSW animate ["ramp_bottom", 0];                 
    
_planeSW animate ["CUP_Mi17_Cargo02", 0];  
     
_planeSW animate ["Compartment1", 0];   
_planeSW animate ["Compartment2", 0];  
     
_planeSW animate ["CUP_C130_Cargo02", 0];     
            
_planeSW animateDoor ["Compartment1", 0];   
_planeSW animateDoor ["Compartment2", 0];  
  
_planeSW animateDoor ["CUP_Mi17_Cargo02", 0];   
 
planeSW move position SpawnLoc;  
 
   
{if (!(isplayer _x) && (_x distance2d planeSW) > 300)  then {     
    
 waitUntil {istouchingGround _x};    
_x allowDamage true;    
   
};} foreach units group player;       
  
};                 
};      
  
  
     
sleep 120;                   
        
 
  switch (true) do 
  { 
   case (resetCheck == 1): 
   { 
    deleteMarker N_Marker; 
    deleteVehicle SpawnLOC; 
      
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;   
     
     
    { _planeSW deleteVehicleCrew _x } forEach crew _planeSW;                     
    deleteVehicle _planeSW;                     
    deleteVehicle _WPoint;            
    deleteVehicle WPoint;          
     
    resetCheck == 0; 
     
     
   }; 
   case (resetCheck == 2): 
   { 
    deleteMarker S_Marker;       
     
    resetCheck == 0; 
   }; 
   case (resetCheck == 3): 
   { 
    deleteMarker E_Marker;     
     
    resetCheck == 0; 
   }; 
   case (resetCheck == 4): 
   { 
    deleteMarker W_Marker; 
    deleteVehicle SpawnLOC;   
     
     
    resetCheck == 0;  
   }; 
    
    deleteVehicle SpawnLOC; 
      
    deleteVehicle HaloJoinPos;      
    deleteVehicle HaloJoinPosW;      
    deleteVehicle HaloJoinPosE;      
    deleteVehicle HaloJoinPosN;      
    deleteVehicle HaloJoinPosS;   
     
     
    { _planeSW deleteVehicleCrew _x } forEach crew _planeSW;                     
    deleteVehicle _planeSW;                     
    deleteVehicle _WPoint;            
    deleteVehicle WPoint;      
    
    
  }; 
   
 
 if (MarkerWPCheck == 1) then 
 { 
  deleteMarker WP_Marker; 
  MarkerWPCheck = 0;  
 };   
     
        
}];  
