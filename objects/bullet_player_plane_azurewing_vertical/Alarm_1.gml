live;
image_xscale = 2
var _ang = image_angle-90;;
var _dx1 = lengthdir_x(-520*scale_y, _ang)
var _dy1 = lengthdir_y(-520*scale_y, _ang);
var _dx2 = lengthdir_x(-50*scale_y, _ang);
var _dy2 = lengthdir_y(-50*scale_y, _ang);
Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,_dx1,10)
Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,_dy1,10)
Anim_Create(id,"x",0,0,x+_dx1,_dx2,4,10)
Anim_Create(id,"y",0,0,y+_dy1,_dy2,4,10)
Anim_Create(id,"image_yscale",0,0,1,1,6)
Anim_Create(id,"image_yscale",0,0,2,-1,6,8)
Anim_Create(id,"image_alpha",0,0,1,-1,8,6)
