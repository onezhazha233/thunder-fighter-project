live;
event_inherited();

idle = seq_splitter_a

collision_type = COLLISION_TYPE.SPRITE

small_sequence = seq_splitter_a_small
collision_effect = seq_bullet_effect_dawn_a

track_inst = noone

speed = 3

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
	xx = x+lengthdir_x(18,direction+90);
	yy = y+lengthdir_x(18,direction+90);
	
	MakeEffect(xx,yy,collision_effect,scale_x,scale_y);
	
	small = MakePlayerBullet(x,y,bullet_player_splitter_small,small_sequence);
	small.direction = 90;
	e = find_priority_enemy(bullet_player_splitter_small);
	if(instance_exists(e)){
		small.direction = point_direction(xx,yy,e.x,e.y);
	}
	small.image_angle = small.direction - 90;
	small.speed = speed/2;
	small.track_inst = e;
	small.damage = damage/3*2;
	
	xx = x+lengthdir_x(18,direction-90);
	yy = y+lengthdir_x(18,direction-90);
	small = MakePlayerBullet(xx,yy,bullet_player_splitter_small,small_sequence);
	small.direction = 90;
	e = find_priority_enemy(bullet_player_splitter_small);
	if(instance_exists(e)){
		small.direction = point_direction(xx,yy,e.x,e.y);
	}
	small.image_angle = small.direction - 90;
	small.speed = speed/2;
	small.track_inst = e;
	small.damage = damage/3*2;
}