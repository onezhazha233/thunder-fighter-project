live;
event_inherited();

collision_destroy = false

image_speed = 0
start_sprite = spr_bullet_player_mega_a_start
laser_sprite = spr_bullet_player_mega_a

scale_x = 1
scale_y = 1

length = 1500
range = 1500
width = 15

damage = 1

surf = surface_create(sprite_get_width(start_sprite),1500)

Anim_Create(id,"image_xscale",0,0,image_xscale,-0.4,4)
Anim_Create(id,"image_index",0,0,0,1,0,4)
Anim_Create(id,"image_xscale",0,0,image_xscale-0.4,0.4,2,4)
Anim_Create(id,"image_index",0,0,1,-1,0,6)

alarm[1] = 6

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
}