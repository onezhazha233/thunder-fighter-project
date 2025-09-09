live;
damage = 0.375*global.atk_plane

rampage_time += 1
a = MakePlayerBullet(x,y,bullet_player_fire);
a.rotate = sin(rampage_time*1919)*3;
a.image_angle = cos(rampage_time*1919)*180;
a.direction = 90 + sin(rampage_time*1145)*7;
a.speed = 25;
Anim_Create(a,"speed",0,0,a.speed,-a.speed,70);
a.image_xscale = 0.5;
a.image_yscale = 0.5;
a.damage = damage;
Anim_Create(a,"image_xscale",0,0,0.5,0.5,60);
Anim_Create(a,"image_yscale",0,0,0.5,0.5,60);
Anim_Create(a,"image_alpha",0,0,1,-1,30,30);