live;
image_blend = cc
tt = random_range(dr[0],dr[1])
image_xscale = random_range(1,2.5)*scale_x
image_yscale = image_xscale/2*scale_y
image_alpha = 1
Anim_Create(id,"image_alpha",0,0,1,-1,tt,0,function(){
	instance_destroy();
})
Anim_Create(id,"image_xscale",0,0,image_xscale,-image_xscale*0.5,tt)
Anim_Create(id,"image_yscale",0,0,image_yscale,-image_yscale*0.3,tt)
hspeed = scale_x*random_range(-1,1)
vspeed = scale_y*random_range(-1,1)