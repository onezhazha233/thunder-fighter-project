live;
event_inherited();

collision_destroy = false

image_speed = 0
start_sprite = spr_bullet_player_mega_b_start
laser_sprite = spr_bullet_player_mega_b

scale_x = 1
scale_y = 1

length = 1500
width = 15*1.1

damage = 0.125

surf = surface_create(sprite_get_width(start_sprite),1500)

image_alpha = 0.8
image_xscale = 1.1
Anim_Create(id,"image_alpha",0,0,0.8,0.2,2)
Anim_Create(id,"image_alpha",0,0,1,-1,6,16)
Anim_Create(id,"image_xscale",0,0,image_xscale,-image_xscale,20,2)
Anim_Create(id,"width",0,0,width,-width,20,2)
Anim_Create(id,"image_index",0,0,0,1,0,8)
Anim_Create(id,"image_index",0,0,1,1,0,16)

alarm[1] = 22

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
}