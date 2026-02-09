live;
blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_cluster_bomb,seq_cluster_bomb_a)
layer_sequence_speedscale(blt.bullet_sequence,0)
blt.scale_x = scale_x
blt.scale_y = scale_y
blt.hspeed = 28/3
blt.damage = damage
Anim_Create(blt,"hspeed",0,0,blt.hspeed,2-blt.hspeed,30)
Anim_Create(blt,"hspeed",0,0,0,0,0,31)
Anim_Create(blt,"y",0,0,blt.y,50,30)
Anim_Create(blt,"vspeed",0,0,0,-10,0,30)

blt = MakePlayerBullet(x,y-10*scale_y,bullet_player_cluster_bomb,seq_cluster_bomb_a)
layer_sequence_speedscale(blt.bullet_sequence,0)
blt.scale_x = -scale_x
blt.scale_y = scale_y
blt.hspeed = -28/3
blt.damage = damage
Anim_Create(blt,"hspeed",0,0,blt.hspeed,-2-blt.hspeed,30)
Anim_Create(blt,"hspeed",0,0,0,0,0,31)
Anim_Create(blt,"y",0,0,blt.y,50,30)
Anim_Create(blt,"vspeed",0,0,0,-10,0,30)