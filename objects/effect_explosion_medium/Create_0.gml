live;
depth = DEPTH_BATTLE.EXPLOSION
image_speed = 0
Anim_Create(id,"image_index",0,0,0,7,24)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_xscale,image_xscale/5,24)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_yscale,image_yscale/5,24)
alarm[0] = 24
line_number = choose(3,4)
for(i=0;i<line_number;i+=1){
	a = instance_create_depth(x,y,depth+1,effect_explosion_line);
	a.delay = random_range(0,3);
	a.image_angle = 360/line_number*i+random_range(-30,30);
	Anim_Create(a,"direction",0,0,0,a.image_angle,0,a.delay);
	Anim_Create(a,"speed",0,0,0,random_range(8,12),0,a.delay);
}
bges = 0
bgea = 0.5
Anim_Create(id,"bges",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,16)
Anim_Create(id,"bgea",0,0,0.5,-0.5,12,12)
Anim_Create(id,"image_alpha",0,0,1,-1,8,16)
a = instance_create_depth(x,y,depth+2,effect_explosion_smoke)
a.image_xscale = image_xscale*2
a.image_yscale = image_yscale*2
a.delay = 10