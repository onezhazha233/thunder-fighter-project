live;
event_inherited();

if(!(instance_exists(battle_ui_victory) && chase == 1)){
	if(x > room_width||x < 0){
		if(x > room_width)x = room_width;
		if(x < 0)x = 0;
		if(direction >= 0&&direction < 180){
			direction = 180 - direction;
		}
		else{
			direction = -180 - direction;
		}
	}
	if(y < 0||y > room_height){
		if(y > room_height)y = room_height;
		if(y < 0)y = 0;
		direction *= -1;
	}
}

if(Player_IsEnabled())if(player.equipment.enabled = true)duration -= 1;
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