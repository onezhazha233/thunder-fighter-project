live;
instance_create_depth(0,0,0,battle_ui)
instance_create_depth(0,0,0,battle_bg_galaxy)

player_inst = instance_create_depth(room_width/2,1400,0,player)
Anim_Create(player_inst,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,player_inst.y,960-player_inst.y,20)
global.inv_hurt = 100
alarm[0] = 2
alarm[1] = 100