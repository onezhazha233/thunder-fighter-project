live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_effect_lightning
collision_effect_sequence = seq_bullet_effect_lightning_a

track_inst = noone

acceleration = 0

speed = 5

rampage = false

function CollideEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
}

function dd(){
	el = ds_list_create();
	ce = collision_circle_list(x,y,100*image_xscale,enemy_agent,1,1,el,0);
	for(i=0;i<ds_list_size(el);i+=1){
		enemy = el[|i];
		if(instance_exists(enemy)){
			if(enemy.inv_collision = false){
				if(enemy.collision_type = COLLISION_TYPE.SPRITE){
					CollideEnemy(enemy);
				}
			}
		}
	}
	ds_list_destroy(el);
	effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
	effect.sequence = collision_effect_sequence;
	effect.image_xscale = scale_x;
	effect.image_yscale = scale_y;
	instance_destroy();
}