live;
hspd = 1.6
a = MakePlayerBullet(x,y-50,bullet_player_wingman_shotcannon_rampage);
a.sprite_index = spr_bullet_player_shotcannon_abc_rampage;
a.hspeed = -hspd;
a.image_angle = 2
a.damage = damage;
a = MakePlayerBullet(x,y-50,bullet_player_wingman_shotcannon_rampage);
a.sprite_index = spr_bullet_player_shotcannon_abc_rampage;
a.hspeed = hspd;
a.image_angle = -2
a.damage = damage;