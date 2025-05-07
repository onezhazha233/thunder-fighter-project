draw_sprite_ext(spr_plane_base,0,x,y,3,3,0,-1,1)

if(draw = 1){
	draw_sprite_ext(spr_shotcannon_a_base,0,x+ox,y+oy,3,3,0,-1,1);
	draw_sprite_ext(spr_shotcannon_a_base,0,x-ox,y+oy,-3,3,0,-1,1);
}