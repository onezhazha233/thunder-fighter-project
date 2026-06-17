live;
depth = DEPTH_BATTLE.EFFECTS;
Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,-100,26);

image_xscale = 0.3;
image_yscale = 0.1;
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.3,1,16);
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.1,1.2,16);
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.3,-0.45,10,16);

Anim_Create(id,"image_alpha",0,0,0,0.6,16);
Anim_Create(id,"image_alpha",0,0,0.6,-0.6,10,16,function(){
	instance_destroy();
});

r = 255;
Anim_Create(id,"r",0,0,255,218-255,10,16);
g = 255;
Anim_Create(id,"g",0,0,g,99-255,16);
Anim_Create(id,"g",0,0,99,-99,10,16);
b = 0;
Anim_Create(id,"b",0,0,g,4,16);
Anim_Create(id,"b",0,0,4,-4,10,16);

mark = noone