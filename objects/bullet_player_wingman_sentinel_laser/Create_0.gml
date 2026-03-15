live;
event_inherited();

up = 0
down = 0
left = 0
right = 0

collision_destroy = false

laser_sprite = spr_bullet_player_sentinel_laser
laser_stripe_offset = 0
laser_stripe_speed = 150

damage = 0.125

range = 1500

fire_image = 0

rampage = false

image_xscale = 0

duration = 36
Anim_Create(id,"image_xscale",ANIM_TWEEN.SINE,ANIM_EASE.OUT,0,1,6);
for(i=0;i<2;i+=1){
	Anim_Create(id,"image_xscale",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,1,-0.1,5,6+i*10);
	Anim_Create(id,"image_xscale",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,0.9,0.1,5,6+i*10+5);
}
Anim_Create(id,"image_xscale",ANIM_TWEEN.SINE,ANIM_EASE.IN,1,-1,10,26);

image_angle = 90