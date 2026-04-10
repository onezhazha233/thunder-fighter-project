live;
rtime += 1
var dir = 90 + sin(rtime)*20
var blt = MakePlayerBullet(x, y, bullet_player_plane_boomerang);
blt.direction = dir;
blt.speed = 50-abs(dir-90)/5;
blt.acceleration = 1.8;
blt.spd_start = blt.speed;
blt.damage = damage