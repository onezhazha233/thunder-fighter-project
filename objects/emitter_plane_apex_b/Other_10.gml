live;
damage = 1;
switch(weapon_level){
	case 0:damage = 1*global.atk_plane;break;
	case 1:damage = 1.3*global.atk_plane;break;
	case 2:damage = 1.7*global.atk_plane;break;
	case 3:damage = 2*global.atk_plane;break;
}

bullet = asset_get_index("bullet_player_plane_apex_b_"+string(weapon_level))
MakePlayerBullet(x,y,bullet).damage = damage;
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_apex_fire);
fire.sprite_index = spr_bullet_player_apex_abc_fire
fire.scale_x = scale_x;
fire.scale_y = scale_y;
fire.y_offset = 5
follow_inst = [fire]