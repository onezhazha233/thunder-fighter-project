live;
a = MakePlayerBullet(x,y-10*scale_y,bullet_player_cluster_bomb,seq_cluster_bomb_cd)
layer_sequence_speedscale(a.bullet_sequence,0)
a.collision_effect_sequence = seq_bullet_effect_missile_b
a.collision_effect_radius = 50
a.scale_x = scale_x
a.scale_y = scale_y
a.hspeed = 28/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,30)
Anim_Create(a,"hspeed",0,0,0,0,0,31)
Anim_Create(a,"y",0,0,a.y,50,30)
Anim_Create(a,"vspeed",0,0,0,-10,0,30)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_cluster_bomb,seq_cluster_bomb_cd)
layer_sequence_speedscale(a.bullet_sequence,0)
a.collision_effect_sequence = seq_bullet_effect_missile_b
a.collision_effect_radius = 50
a.scale_x = -scale_x
a.scale_y = scale_y
a.hspeed = -28/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,30)
Anim_Create(a,"hspeed",0,0,0,0,0,31)
Anim_Create(a,"y",0,0,a.y,50,30)
Anim_Create(a,"vspeed",0,0,0,-10,0,30)