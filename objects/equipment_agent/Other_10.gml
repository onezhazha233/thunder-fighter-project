live;
SetRampage = function(state){//0为开始暴走 1为结束暴走
	if(state = 1){
		with(plane_inst){
			SetState(1);
		}
		for(i=0;i<array_length(wingman_left);i+=1){
			with(wingman_left_inst[i]){
				SetState(1);
			}
		}
		for(i=0;i<array_length(wingman_right);i+=1){
			with(wingman_right_inst[i]){
				SetState(1);
			}
		}
	}
	if(state = 0){
		with(plane_inst){
			SetState(3);
		}
		for(i=0;i<array_length(wingman_left);i+=1){
			with(wingman_left_inst[i]){
				SetState(3);
			}
		}
		for(i=0;i<array_length(wingman_right);i+=1){
			with(wingman_right_inst[i]){
				SetState(3);
			}
		}
	}
}

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	if(player_point_enabled = true){
		layer_sequence_x(player_point,xx);
		layer_sequence_y(player_point,yy);
	}
	if(instance_exists(plane_inst)){
		plane_inst.SetPosition(xx,yy);
		plane_inst.image_xscale = xscale;
		plane_inst.image_yscale = yscale;
		plane_inst.image_angle = angle;
	}
	for(i=0;i<array_length(wingman_left_inst);i+=1){
		idealx = xx + lengthdir_x(-wingman_x_offset[i]*xscale,angle) + lengthdir_x(wingman_y_offset[i]*xscale,angle-90);
		idealy = yy + lengthdir_y(-wingman_x_offset[i]*yscale,angle) + lengthdir_y(wingman_y_offset[i]*yscale,angle-90);
		wingman_left_inst[i].x += (idealx-(wingman_left_inst[i].x))/2;
		wingman_left_inst[i].y += (idealy-(wingman_left_inst[i].y))/2;
		wingman_left_inst[i].image_xscale = xscale;
		wingman_left_inst[i].image_yscale = yscale;
		wingman_left_inst[i].image_angle = angle;
	}
	for(i=0;i<array_length(wingman_right_inst);i+=1){
		idealx = xx + lengthdir_x(wingman_x_offset[i]*xscale,angle) + lengthdir_x(wingman_y_offset[i]*xscale,angle-90)
		idealy = yy + lengthdir_y(wingman_x_offset[i]*yscale,angle) + lengthdir_y(wingman_y_offset[i]*yscale,angle-90)
		wingman_right_inst[i].x += (idealx-(wingman_right_inst[i].x))/2;
		wingman_right_inst[i].y += (idealy-(wingman_right_inst[i].y))/2;
		wingman_right_inst[i].image_xscale = xscale;
		wingman_right_inst[i].image_yscale = yscale;
		wingman_right_inst[i].image_angle = angle;
	}
}