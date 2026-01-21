live;
//induction shield
graze_enabled = false
graze_radius = 60
graze_list = ds_list_create()
graze_effects = [];
graze_ratings = []

effect_life_max = 20; // 寿命(帧)
effect_spd_min = 4;   // 最小扩散速度
effect_spd_max = 7;   // 最大扩散速度

graze_amount = 0
graze_rank = [300,500,800,1200,1700,2300]
triggered = [0,0,0,0,0,0]
graze_current_rating = 0
graze_clear_time = 30

ArmorAbility = function(type,exarg=0){
	if(type = 0){
		var _total_heat_gain_this_frame = 0;
		
	    var px = player.x;
	    var py = player.y;
	    var p_vx = px - player.xprevious;
	    var p_vy = py - player.yprevious;

	    var _count = collision_circle_list(px, py, graze_radius, bullet_enemy, true, false, graze_list, false);

	    if (_count > 0) {
	        for (var i = 0; i < _count; i++) {
	            var _bullet = graze_list[| i];

	            var b_vx = _bullet.x - _bullet.xprevious;
	            var b_vy = _bullet.y - _bullet.yprevious;

	            var rel_vx = p_vx - b_vx;
	            var rel_vy = p_vy - b_vy;
            
	            var _rel_spd_sqr = (rel_vx * rel_vx) + (rel_vy * rel_vy);
            
	            if (_rel_spd_sqr > 25) {
	                var _rel_spd = sqrt(_rel_spd_sqr);

	                ArmorAbility(2, _rel_spd);
					
	                var _part_num = max(1,_rel_spd/5);

	                repeat(_part_num) {
	                    var _dir = random(360);//point_direction(b_vx,b_vy,p_vx,p_vy)+random_range(-5,5)
	                    var _spd_val = random_range(effect_spd_min, effect_spd_max);

	                    array_push(graze_effects, {
	                        lx: 0,
	                        ly: 0,
	                        hsp: lengthdir_x(_spd_val, _dir),
	                        vsp: lengthdir_y(_spd_val, _dir),
	                        life: effect_life_max,
	                        max_life: effect_life_max
	                    });
	                }
	            }
				else{
					/*graze_clear_time -= 1;
					if(graze_clear_time <= 0){
						graze_amount = 0;
						graze_current_rating = 0;
						triggered = [0,0,0,0,0,0];
					}*/
					graze_clear_time -= 1;
					if(graze_clear_time <= 0){
						graze_amount = floor(graze_amount/2);
						graze_current_rating = floor(graze_current_rating/2);
						triggered = [0,0,0,0,0,0];
						for(i=0;i<graze_current_rating;i+=1){
							triggered[i] = 1;
						}
						graze_clear_time = 30;
					}
				}
	        }
	    } 
	    else {
	        graze_clear_time -= 1;
			if(graze_clear_time <= 0){
				graze_amount = floor(graze_amount/2);
				graze_current_rating = floor(graze_current_rating/2);
				triggered = [0,0,0,0,0,0];
				for(i=0;i<graze_current_rating;i+=1){
					triggered[i] = 1;
				}
				graze_clear_time = 30;
			}
	    }

	    ds_list_clear(graze_list);
	}
	if(type = 1){
		return exarg;
	}
	if(type = 2){
		graze_amount += exarg;
		graze_clear_time = 30;
		for(i=0;i<array_length(graze_rank);i+=1){
			if(graze_amount >= graze_rank[i]&&graze_current_rating = i&&triggered[i] = false){
				CreateGrazeText(i);
				triggered[i] = true;
				graze_current_rating = i + 1;
				if (i = array_length(graze_rank) - 1) {
		            graze_amount = graze_rank[i-1];
					triggered[i] = false;
					graze_current_rating = i;
		        }
				break;
			}
		}
		Player_AddScore(exarg);
	}
}

CreateGrazeText = function(rating){
	scores = [10,20,30,40,50,60];
	Player_AddScore(scores[rating]);
	var rt = {image: rating,ox: 0,oy: 0,alpha: 1,duration: 60};
	Anim_Create(rt,"ox",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,100,10);
	Anim_Create(rt,"oy",ANIM_TWEEN.QUAD,ANIM_EASE.IN,0,-30,10);
	Anim_Create(rt,"alpha",0,0,1,-1,40,20);
	array_push(graze_ratings,rt);
}