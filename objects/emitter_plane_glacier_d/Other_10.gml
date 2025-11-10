live;
switch(weapon_level){
	case 0:
		laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
		laser.image_angle = 102;
		laser.duration = 34;
		laser.start_sprite = spr_bullet_player_glacier_d_start;
		laser.glow_offset = 0;
		Anim_Create(laser,"image_angle",0,0,102,-12,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,-50,0]);

		laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
		laser.image_angle = 78;
		laser.duration = 34;
		laser.start_sprite = spr_bullet_player_glacier_d_start;
		laser.glow_offset = 0;
		Anim_Create(laser,"image_angle",0,0,78,12,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,50,0]);
		
		alarm[3] = 14;
		alarm[2] = 60;
		break;
		
	case 1:
		laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
		laser.image_angle = 110;
		laser.duration = 34;
		laser.start_sprite = spr_bullet_player_glacier_d_start;
		laser.glow_offset = 0;
		Anim_Create(laser,"image_angle",0,0,110,-20,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,-50,0]);

		laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
		laser.image_angle = 70;
		laser.duration = 34;
		laser.start_sprite = spr_bullet_player_glacier_d_start;
		laser.glow_offset = 0;
		Anim_Create(laser,"image_angle",0,0,70,20,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,50,0]);
		
		alarm[3] = 14;
		alarm[2] = 60;
		break;
		
	case 2:
		laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
		laser.image_angle = 112;
		laser.duration = 34;
		laser.start_sprite = spr_bullet_player_glacier_d_start;
		laser.glow_offset = 0;
		Anim_Create(laser,"image_angle",0,0,112,-22,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,-50,0]);

		laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
		laser.image_angle = 68;
		laser.duration = 34;
		laser.start_sprite = spr_bullet_player_glacier_d_start;
		laser.glow_offset = 0;
		Anim_Create(laser,"image_angle",0,0,68,22,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,50,0]);
		
		alarm[3] = 14;
		alarm[2] = 50;
		break;
		
	case 3:
		laser = MakePlayerBullet(x-50,y,bullet_player_plane_glacier);
		laser.image_angle = 102;
		laser.duration = 34;
		laser.start_sprite = spr_bullet_player_glacier_d_start;
		laser.glow_offset = 0;
		Anim_Create(laser,"image_angle",0,0,102,-12,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,-50,0]);

		laser = MakePlayerBullet(x+50,y,bullet_player_plane_glacier);
		laser.image_angle = 78;
		laser.duration = 34;
		laser.start_sprite = spr_bullet_player_glacier_d_start;
		laser.glow_offset = 0;
		Anim_Create(laser,"image_angle",0,0,78,12,34);
		Anim_Create(laser,"image_xscale",0,0,1,-0.8,10,24);
		array_push(follow_inst,[laser,50,0]);
		
		alarm[3] = 14;
		alarm[4] = 28;
		alarm[2] = 50;
		break;
}
alarm[2] = 48-(weapon_level=3 ? 5 : 0)