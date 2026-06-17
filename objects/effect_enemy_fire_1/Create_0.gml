live;
depth = DEPTH_BATTLE.EFFECTS
y -= 8
Anim_Create(id,"y",0,0,y,-46,16);

image_xscale = 0.25;
image_yscale = 0.4;
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.25,0.45,8);
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,0.7,-0.56,8,8);
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.4,0.8,8);
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.2,-0.8,8,8);

Anim_Create(id,"image_alpha",0,0,0,1,8)
Anim_Create(id,"image_alpha",0,0,1,-1,8,8,function(){
	instance_destroy();
})

g = 0
Anim_Create(id,"g",0,0,g,177,8)
Anim_Create(id,"g",0,0,177,-177,8,8)

fy = y+8
Anim_Create(id,"fy",0,0,fy,-40,16);
fsx = 0.38
fsy = 0.3
Anim_Create(id,"fsx",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.38,0.12,8);
Anim_Create(id,"fsx",ANIM_TWEEN.QUAD,ANIM_EASE.IN,0.5,-0.2,8,8);
Anim_Create(id,"fsy",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.3,0.2,8);
fa = 0
Anim_Create(id,"fa",0,0,0,1,4)
Anim_Create(id,"fa",0,0,1,-1,12,4)

mark = noone