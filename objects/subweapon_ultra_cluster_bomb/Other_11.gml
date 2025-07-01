live;
damage = 2.667

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_cluster_bomb,seq_cluster_bomb_cd)
layer_sequence_speedscale(a.bullet_sequence,0)
a.collision_effect_sequence = seq_bullet_effect_missile_cd
a.collision_effect_radius = 50
a.collision_effect_scale = 1.1
a.scale_x = scale_x
a.scale_y = scale_y
a.hspeed = 17/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,30)
Anim_Create(a,"hspeed",0,0,0,0,0,31)
Anim_Create(a,"y",0,0,a.y,50,30)
Anim_Create(a,"vspeed",0,0,0,-10,0,30)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_cluster_bomb,seq_cluster_bomb_cd)
layer_sequence_speedscale(a.bullet_sequence,0)
a.collision_effect_sequence = seq_bullet_effect_missile_cd
a.collision_effect_radius = 50
a.collision_effect_scale = 1.1
a.scale_x = -scale_x
a.scale_y = scale_y
a.hspeed = -17/3
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,30)
Anim_Create(a,"hspeed",0,0,0,0,0,31)
Anim_Create(a,"y",0,0,a.y,50,30)
Anim_Create(a,"vspeed",0,0,0,-10,0,30)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_cluster_bomb,seq_cluster_bomb_cd)
layer_sequence_speedscale(a.bullet_sequence,0)
a.collision_effect_sequence = seq_bullet_effect_missile_cd
a.collision_effect_radius = 50
a.collision_effect_scale = 1.1
a.scale_x = scale_x
a.scale_y = scale_y
a.hspeed = 9.3158
a.duration += 8
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,2-a.hspeed,38)
Anim_Create(a,"hspeed",0,0,0,0,0,39)
Anim_Create(a,"y",0,0,a.y,50,38)
Anim_Create(a,"vspeed",0,0,0,-10,0,38)

a = MakePlayerBullet(x,y-10*scale_y,bullet_player_cluster_bomb,seq_cluster_bomb_cd)
layer_sequence_speedscale(a.bullet_sequence,0)
a.collision_effect_sequence = seq_bullet_effect_missile_cd
a.collision_effect_radius = 50
a.collision_effect_scale = 1.1
a.scale_x = -scale_x
a.scale_y = scale_y
a.hspeed = -9.3158
a.duration += 8
a.damage = damage
Anim_Create(a,"hspeed",0,0,a.hspeed,-2-a.hspeed,38)
Anim_Create(a,"hspeed",0,0,0,0,0,39)
Anim_Create(a,"y",0,0,a.y,50,38)
Anim_Create(a,"vspeed",0,0,0,-10,0,38)