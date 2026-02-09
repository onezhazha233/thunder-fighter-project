live;
Anim_Create(player_inst,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,player_inst.y,960-player_inst.y,20)
player_inst.y = 960
global.inv_hurt = 100
alarm[0] = 100
instance_create_depth(0,0,0,battle_ui_readygo)