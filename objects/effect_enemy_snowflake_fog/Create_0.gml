live;
depth = DEPTH_BATTLE.EFFECTS
mark = noone
rot = random_range(-3,3)
image_alpha = 0
image_xscale = random_range(0.6,1)
image_yscale = random_range(0.6,1)
Anim_Create(id,"image_alpha",0,0,0,1,20)
Anim_Create(id,"image_alpha",0,0,1,-1,40,20)
vspeed = random_range(1,3)
duration = 60