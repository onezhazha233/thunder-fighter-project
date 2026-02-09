function Swarm_IsEnabled(){
	return battle_swarm_manager.enabled;
}

function Swarm_SetEnabled(enabled){
	if(instance_exists(battle_swarm_manager)){
		battle_swarm_manager.enabled = enabled;
	}
}

function Swarm_GetInterval(){
	if(instance_exists(battle_swarm_manager)){
		return battle_swarm_manager.interval;
	}
}
	
function Swarm_SetInterval(interval){
	if(instance_exists(battle_swarm_manager)){
		battle_swarm_manager.interval = interval;
	}
}

function Swarm(swarm,number,interval,xoff,yoff) constructor{
	swarm_obj = swarm;
	nn = number;
	ii = interval;
	xo = xoff;
	yo = yoff;
	
	Create = function(){
		s = instance_create_depth(0,0,0,swarm_obj);
		s.number = nn;
		s.interval = ii;
		s.offset_x_step = xo;
		s.offset_y_step = yo;
		s.alarm[0] = 1;
	}
	
}