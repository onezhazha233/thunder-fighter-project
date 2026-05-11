live;
if(enabled = true){
	alpha -= 0.05;
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index,0,player.x,player.y,scale,scale,0,-1,alpha);
	gpu_set_blendmode(bm_normal);

	if(alpha <= 0)instance_destroy();
}