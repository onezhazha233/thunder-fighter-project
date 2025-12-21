live;
depth = DEPTH_BATTLE.EXPLOSION
image_speed = 0
Anim_Create(id,"image_index",0,0,0,7,24)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_xscale,image_xscale/5,24)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_yscale,image_yscale/5,24)
smoke_line_number = choose(4,5)
d = random(360)
for(i=0;i<smoke_line_number;i+=1){
	smoke_number = irandom_range(4,6);
	dir = d + 360/smoke_line_number*i+random_range(-30,30);
	for(j=0;j<smoke_number;j+=1){
		a = instance_create_depth(x+lengthdir_x(40*(j+1),dir),y+lengthdir_y(40*(j+1),dir),depth+2,effect_explosion_big_smoke);
		a.delay = j+5;
	}
}
dir = random(360);
for(i=0;i<3;i+=1){
	if(i < 2){
		a = instance_create_depth(x,y,depth-1,effect_explosion_big_small);
		a.direction = dir + 360/3*i + random_range(-40,40);
		a.speed = 8;
		a.sound = false;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed,24);
	}
	else{
		a = instance_create_depth(x,y,depth-1,effect_explosion_big_small);
		a.sprite_index = spr_effect_explosion_big
		a.direction = dir + 360/3*i + random_range(-40,40);
		a.speed = 8;
		a.sound = false;
	}
}
Anim_Create(a,"speed",0,0,a.speed,-a.speed,24)
Anim_Destroy(a,"image_xscale")
Anim_Destroy(a,"image_yscale")
Anim_Create(a,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,0.5,24)
Anim_Create(a,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,0.5,24)
bges = 0
bgea = 0.5
Anim_Create(id,"bges",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,16)
Anim_Create(id,"bgea",0,0,0.5,-0.5,12,12)
Anim_Create(id,"image_alpha",0,0,1,-1,8,16)
a = instance_create_depth(x,y,depth+2,effect_explosion_smoke)
Anim_Create(a,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,2,30)
Anim_Create(a,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,2,30)
a.delay = 10

alarm[0] = 24

audio_play_sound(snd_explosion,0,0)