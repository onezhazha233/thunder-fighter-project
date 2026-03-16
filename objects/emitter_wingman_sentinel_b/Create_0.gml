live;
event_inherited();

time_interval_idle = [28,32,30,32]
time_interval_rampage = 1

time = 0

block_inst = noone
block_xoffset = -4
block_yoffset = -20
block_xoffset_rampage = -4
block_yoffset_rampage = -15
block_width = 60
block_height = 30
block_width_rampage = 70
block_height_rampage = 40

damages = [1.75,1.3,1.59375,1.3333,0.25]
type = 1

block_count = 0//抵挡子弹数量
block_count_cd = 0//0时才可以增加抵挡子弹数量
block_demand = 5//抵挡等级升级所需抵挡子弹
block_level = 0//0为蓝 1为绿 2为橙

laser = noone
rampage_laser = noone
block_event_seen = 0
block_tick = 0
block_event_level = 0
create_index = current_time

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i,0])){
			follow_inst[i,0].x = xx + follow_inst[i,1];
			follow_inst[i,0].y = yy + follow_inst[i,2];
		}
		else{
			array_delete(follow_inst,i,1);
		}
	}
}