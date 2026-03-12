live;
event_inherited();

up = 0
down = 0
left = 0
right = 0

collision_destroy = false

start_sprite = [spr_bullet_player_overwatcher_laser_start_0,spr_bullet_player_overwatcher_laser_start_1]
laser_sprite = spr_bullet_player_overwatcher_laser

damage = 1

range = 1500

duration = 27

start1_xscale = 0
start1_yscale = 0

color = [[0,255,128],[0,128,255]]
color_r = 255
color_g = 255
color_b = 255

image_xscale = 1

Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,2,3)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,2,-1.2,4,3)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,0.8,-0.8,10,17)
Anim_Create(id,"image_alpha",0,0,1,-0.5,4,3)
Anim_Create(id,"image_alpha",0,0,0.5,0.3,3,7)
Anim_Create(id,"image_alpha",0,0,0.8,-0.3,3,10)
Anim_Create(id,"start1_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,3)
Anim_Create(id,"start1_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,-1,20,7)
Anim_Create(id,"start1_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,3)
Anim_Create(id,"color_r",0,0,color_r,color[0,0]-color_r,4,3)
Anim_Create(id,"color_g",0,0,color_g,color[0,1]-color_g,4,3)
Anim_Create(id,"color_b",0,0,color_b,color[0,2]-color_b,4,3)
Anim_Create(id,"color_r",0,0,color[0,0],color[1,0]-color[0,0],10,7)
Anim_Create(id,"color_g",0,0,color[0,1],color[1,1]-color[0,1],10,7)
Anim_Create(id,"color_b",0,0,color[0,2],color[1,2]-color[0,2],10,7)