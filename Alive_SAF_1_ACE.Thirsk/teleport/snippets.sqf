this addAction  
[ 
    if (locked this < 2) then {"Lock"} else {"Unlock"}, 
 { 
  params ["_target", "_caller", "_actionId", "_arguments"]; 
    
  if (locked _target < 2) then 
  { 
   _target lock 2; 
   _target setUserActionText [_actionId, "Unlock"]; 
  } 
  else 
  { 
   _target lock 0; 
   _target setUserActionText [_actionId, "Lock"]; 
  }  
 } 
];
this addaction[if(isNull(crew this select 2))then{"Move In Commander"}else if (isNull(crew this select 1))then{"Move In Gunner"}else if(isNull(crew this select 0))then{"Move In Driver"},{params ["_target", "_caller", "_actionId", "_arguments"];if(isNull(crew _target select 2))then{_caller moveInCommander _target}else if(isNull(crew _target select 1))then{{hint format ["Option 2"]};_caller moveInGunner _target}else if(isNull(crew _target select 0))then{{hint format ["Option 3"]};_caller moveInDriver _target}};]
	
		
