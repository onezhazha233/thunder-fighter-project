live;
depth = DEPTH_BATTLE.EFFECTS;
Anim_Create(id,"y",0,0,y,-100,10);

image_xscale = 1;
image_yscale = 0.3;
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.3,0.4,4);
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,0.7,-0.43,4,6);

Anim_Create(id,"image_alpha",0,0,0,1,4);
Anim_Create(id,"image_alpha",0,0,1,-1,6,4,function(){
	instance_destroy();
});

r = 98
g = 11
b = 179
Anim_Create(id,"r",0,0,r,255-r,6);
Anim_Create(id,"g",0,0,g,14-g,6);
Anim_Create(id,"b",0,0,b,14-g,6);
Anim_Create(id,"r",0,0,255,219-255,4,6);
Anim_Create(id,"g",0,0,14,100,4,6);
Anim_Create(id,"b",0,0,14,-14,4,6);

mark = noone