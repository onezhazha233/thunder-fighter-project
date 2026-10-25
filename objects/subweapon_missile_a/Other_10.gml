live;
/* 原版: 单攻击点[45-135]同帧2弹; 目标由子弹首帧自行索敌 */
angle = 45
blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro)
layer_sequence_angle(blt.bullet_sequence,angle-90);
blt.direction = angle
blt.image_angle = angle - 90
blt.damage = damage

angle = 135
blt = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro)
layer_sequence_angle(blt.bullet_sequence,angle-90);
blt.direction = angle
blt.image_angle = angle - 90
blt.damage = damage
