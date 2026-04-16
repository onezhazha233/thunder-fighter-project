live;
event_inherited();

SetMoveInfo = function(){
	move_range = [150,250,720-150,350];
	move_distance = [150,250];
	move_duration = [80,120];
	move_interval = [20,30];
}

OnDie = function(){
	Player_AddScore(500);
	var ring_count = 5;
	var per_ring = 36;
	var radius_start = 150;
	var radius_step = 40;
	var total_slots = ring_count * per_ring;
	
	var remaining_score = 500;
	var remaining_type2 = 2;
	
	var slots = array_create(total_slots, 0);
	for(var i=0;i<total_slots;i+=1) slots[i] = i;
	for(var i=0;i<total_slots;i+=1){
		var span = total_slots - i;
		var j = i + floor(random(span));
		var tmp = slots[i];
		slots[i] = slots[j];
		slots[j] = tmp;
	}
	
	function max_possible(_slots, _t2){
		var t2 = min(_slots, _t2);
		return _slots*10 + t2*40;
	}
	
	for(var s=0;s<total_slots;s+=1){
		if(remaining_score <= 0) break;
		
		var slots_left = total_slots - s - 1;
		var max_skip = max_possible(slots_left, remaining_type2);
		var must_place = (remaining_score > max_skip);
		
		if(!must_place){
			if(random(1) < 0.35) continue;
		}
		
		var options = [];
		var weights = [];
		
		if(remaining_type2 > 0 && remaining_score >= 50){
			if(remaining_score - 50 <= max_possible(slots_left, remaining_type2-1)){
				array_push(options, 2);
				array_push(weights, 0.05);
			}
		}
		if(remaining_score >= 10){
			if(remaining_score - 10 <= max_possible(slots_left, remaining_type2)){
				array_push(options, 1);
				array_push(weights, 0.25);
			}
		}
		if(remaining_score >= 5){
			if(remaining_score - 5 <= max_possible(slots_left, remaining_type2)){
				array_push(options, 0);
				array_push(weights, 0.70);
			}
		}
		
		if(array_length(options) = 0) continue;
		
		var total_w = 0;
		for(var w=0;w<array_length(weights);w+=1) total_w += weights[w];
		var pick = random(total_w);
		var t = options[0];
		var acc = 0;
		for(var w=0;w<array_length(weights);w+=1){
			acc += weights[w];
			if(pick <= acc){
				t = options[w];
				break;
			}
		}
		
		var idx = slots[s];
		var r = idx div per_ring;
		var k = idx mod per_ring;
		var radius = radius_start + r*radius_step;
		var ang = k*(360/per_ring) + r*7;
		var tx = x + lengthdir_x(radius, ang);
		var ty = y + lengthdir_y(radius, ang);
		
		var c = MakeCrystal(x,y,t,false);
		c.auto_destroy = false;
		c.detect_range = 0;
		Anim_Create(c,"x",0,0,c.x,tx-c.x,30);
		Anim_Create(c,"y",0,0,c.y,ty-c.y,30);
		Anim_Create(c,"chase",0,0,0,1,0,30,function(){
			chase = 1;
			gravity = 0;
			Anim_Create(id,"speed",0,0,5,chase_speed_max-5,10);
		});
		
		if(t = 2) remaining_type2 -= 1;
		if(t = 2) remaining_score -= 50;
		else if(t = 1) remaining_score -= 10;
		else remaining_score -= 5;
	}
}

SetIdle = function(){
	if(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_uncover)||layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_uncover_attack)){
		SetSequence(seq_enemy_boss_mini_0_cover);
	}
	else if!(layer_sequence_get_sequence(enemy_sequence) = sequence_get(seq_enemy_boss_mini_0_cover)){
		SetState(ENEMY_STATE.IDLE);
	}
}