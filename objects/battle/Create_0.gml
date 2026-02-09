live;
instance_create_depth(0,0,0,battle_ui)
instance_create_depth(0,0,0,battle_bg_galaxy)

BGM_Play(0,bgm_stage)

player_inst = instance_create_depth(room_width/2,1400,0,player)
alarm[2] = 1