live;
event_inherited();

if(hp <= 0){
	Player_AddScore(90);
	repeat(2){
		a = instance_create_depth(x+random_range(bbox_left-x,bbox_right-x)*1.5,y+random_range(bbox_top-y,bbox_bottom-y)*1.5,0,battle_item_crystal_0);
		a.vspeed = -8;
	}
}