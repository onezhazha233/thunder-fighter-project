live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

mode = 0//0为开始动画 1为未展开 2为展开中 3为已展开 4为消失
idle = seq_bullet_player_spinblade_cannon_a
edge_intro = seq_bullet_player_spinblade_cannon_a_edge_intro
edge = seq_bullet_player_spinblade_cannon_a_edge

duration = 100
move_duration = 100

animspd = 1

range = 150

enemy_list = ds_list_create()

damage_type = 1
damage_interval = 9

collision_destroy = false

ll = layer_create(depth)
var scrBegin = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_add);
	shader_set(shd_blend_alpha);
	shader_set_uniform_f(shader_get_uniform(shd_blend_alpha,"u_blendColor"),color_get_red(image_blend)/255,color_get_green(image_blend)/255,color_get_blue(image_blend)/255,image_alpha);
}

var scrEnd = function () {
	if (event_number != ev_draw_normal) return;
	shader_reset();
	gpu_set_blendmode(bm_normal)
}

layer_script_begin(ll, scrBegin);
layer_script_end(ll, scrEnd);

damage = 1

function CollideEnemies(){
	for(i=0;i<ds_list_size(enemy_list);i+=1){
		enemy = enemy_list[|i];
		if(instance_exists(enemy)){
			if(enemy.inv_collision = false){
				if(enemy.collision_type = COLLISION_TYPE.SPRITE){
					dirr = point_direction(x,y,enemy_list[|i].x,enemy_list[|i].y);
					find = laser_find_width(x,y,dirr,range*scale_x,1,enemy_list[|i],1,1);
					if(array_length(find) > 0){
						len = find[0][1];
						enemy = find[0][0];
						CollideSingleEnemy(enemy);
					}
				}
			}
		}
	}
	ds_list_clear(enemy_list);
}

function CollideSingleEnemy(enemy){
	if!(ds_map_exists(collision_enemy,enemy)){
		if(instance_exists(enemy)){
			ds_map_add(collision_enemy,enemy,damage_interval);
			enemy.last_bullet = id;
			event_user(0);
			enemy.Hurt();
			effect = instance_create_depth(x+lengthdir_x(len+random_range(0,10)*scale_x,dirr),y+lengthdir_y(len+random_range(0,10)*scale_y,dirr),DEPTH_BATTLE.INSTANCES_UPPER,bullet_effect_xeno);
			effect.image_xscale = scale_x*0.6;
			effect.image_yscale = scale_y*0.6;
		}
	}
}

active = function(){
	mode = 2;
	layer_sequence_destroy(bullet_sequence);
	bullet_sequence = layer_sequence_create(ll,x,y,edge_intro);
	layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
	speed = 0;
}