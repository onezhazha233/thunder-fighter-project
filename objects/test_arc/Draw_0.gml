live;
draw_buff_progress(x, y, 66);
sl = string_length(nn)
for(i=1;i<sl+1;i+=1){
	draw_sprite_ext(spr_buff_number,real(string_char_at(nn,i)),x+(i-sl-1)*13+30,y-30,1,1,0,-1,1);
}