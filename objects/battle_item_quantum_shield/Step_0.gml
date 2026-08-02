live;
event_inherited();

if(!(instance_exists(battle_ui_victory)&&chase == 1)){
	if(x > room_width||x < 0){
		if(x > room_width){
			x = room_width-1;
			hspeed = -abs(hspeed);
		}
		if(x < 0){
			x = 1;
			hspeed = abs(hspeed);
		}
	}
	if(y < 0||y > room_height){
		if(y > room_height){
			y = room_height-1;
			hspeed = -abs(vspeed);
		}
		if(y < 0){
			y = 1;
			hspeed = abs(vspeed);
		}
	}
}

if!(Player_IsBreaktime())duration -= 1;
if(duration = 0)instance_destroy();

if(duration > 0&&duration < 116){
	var cycle_pos = (116 - duration) mod 12;

	if (cycle_pos < 8) {
	    image_alpha = 1 - cycle_pos / 8;
	} else {
	    image_alpha = (cycle_pos - 8) / 4;
	}
}

Sequence_PlayByFrame(ll);