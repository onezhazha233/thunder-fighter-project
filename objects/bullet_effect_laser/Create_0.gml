live;
ring = spr_buller_effect_laser_ab_ring
lightball = spr_buller_effect_laser_ab_lightball

ballnum = choose(4,5)
dir = random(360)
bl = 0
for(i=0;i<ballnum;i+=1){
	balldir[i] = dir + (360/ballnum)*i + random_range(-30,30);
	balllen[i] = random_range(0.5,1);
	ballimg[i] = choose(0,1);
}

scale_x = 1
scale_y = 1

Anim_Create(id,"image_xscale",0,0,0,3,6)
Anim_Create(id,"image_yscale",0,0,0,3,6)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,2.5,1.5,9,7)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,2.5,1.5,9,7)
Anim_Create(id,"image_alpha",0,0,1,-1,8,8)
Anim_Create(id,"bl",0,0,0,80,10,6)
time = 0
alarm[0] = 16