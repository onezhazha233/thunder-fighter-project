live;
depth = DEPTH_BATTLE.EFFECTS
Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,-80,26)

image_xscale = 0.15
image_yscale = 0.25
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_xscale,0.6-image_xscale,8)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_yscale,1-image_yscale,8)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,0.6,-0.6,18,8)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1,-1,18,8)

Anim_Create(id,"image_alpha",0,0,0,1,8)
Anim_Create(id,"image_alpha",0,0,1,-1,18,8,function(){
	instance_destroy();
})

g = 0
Anim_Create(id,"g",0,0,g,177,8)
Anim_Create(id,"g",0,0,177,-177,18,8)

mark = noone