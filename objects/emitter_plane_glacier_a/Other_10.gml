live;
switch(weapon_level){
	case 0:
		laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier_a);
		laser.image_angle = 100;
		laser.duration = 34;
		Anim_Create(laser,"image_angle",0,0,100,-10,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,-50,0]);

		laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier_a);
		laser.image_angle = 80;
		laser.duration = 34;
		Anim_Create(laser,"image_angle",0,0,80,10,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,50,0]);
		break;
		
	case 1:
		laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier_a);
		laser.image_angle = 110;
		laser.duration = 34;
		Anim_Create(laser,"image_angle",0,0,110,-20,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,-50,0]);

		laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier_a);
		laser.image_angle = 70;
		laser.duration = 34;
		Anim_Create(laser,"image_angle",0,0,70,20,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,50,0]);
		break;
		
	case 2:
		laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier_a);
		laser.image_angle = 100;
		laser.duration = 34;
		Anim_Create(laser,"image_angle",0,0,100,-10,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,-50,0]);

		laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier_a);
		laser.image_angle = 80;
		laser.duration = 34;
		Anim_Create(laser,"image_angle",0,0,80,10,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,50,0]);
		
		alarm[3] = 14;
		break;
		
	case 3:
		laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier_a);
		laser.image_angle = 100;
		laser.duration = 34;
		Anim_Create(laser,"image_angle",0,0,100,-10,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,-50,0]);

		laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier_a);
		laser.image_angle = 80;
		laser.duration = 34;
		Anim_Create(laser,"image_angle",0,0,80,10,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,50,0]);
		
		alarm[4] = 14;
		break;
}
alarm[2] = 48