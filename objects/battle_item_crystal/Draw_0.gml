live;
if(enabled = true){
	if(type = 2){
		shine_time += 1;
		if(shine_time >= shine_target){
			shine_x = random_range(-20,20);
			shine_y = random_range(-15,15);
			shine_alpha = 1;
			shine_time = 0;
			shine_target = random_range(5,20);
			Anim_Create(id,"shine_alpha",0,0,1,-1,4);
		}
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_battle_item_crystal_2,7,shine_x,shine_y,image_xscale,image_yscale,0,-1,shine_alpha);
		gpu_set_blendmode(bm_normal);
	}
}