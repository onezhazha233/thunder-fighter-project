live;
depth = DEPTH_BATTLE.EFFECTS
image_alpha = 0
image_xscale = choose(-1,1)
image_angle = random_range(-5,5)
Anim_Create(id,"image_alpha",0,0,0,1,10)
Anim_Create(id,"image_alpha",0,0,1,-1,60,10)
duration = 70