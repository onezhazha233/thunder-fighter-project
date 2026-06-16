live;
if(layer_sequence_exists(ll,bullet_sequence)){
	layer_sequence_x(bullet_sequence,x);
	layer_sequence_y(bullet_sequence,y);
	layer_sequence_xscale(bullet_sequence,image_xscale*scale_x);
	layer_sequence_yscale(bullet_sequence,image_yscale*scale_y);
	layer_sequence_angle(bullet_sequence,image_angle);
	layer_sequence_blend(bullet_sequence,image_blend);
	layer_sequence_alpha(bullet_sequence,image_alpha);
}

find = laser_find_width(x,y,image_angle+90,range*image_yscale*scale_y,width*image_xscale*scale_x,enemy_agent,true,true)
len = range
find_enemy = noone
for(i=0;i<array_length(find);i+=1){
    var _inst = find[i][0];
    var _dist = find[i][1];
    if(_inst.inv_collision = false){
		enemy =_inst
		CollideSingleEnemy(enemy);
		draw_effect(x+lengthdir_x(_dist,image_angle+90),y+lengthdir_y(_dist,image_angle+90),1,time mod 14);
	}
}