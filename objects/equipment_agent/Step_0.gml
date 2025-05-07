/// 检测实例状态并更新自己的状态
var count_0_3 = 0;    // 记录状态为0或3的实例数
var count_1_2 = 0;    // 记录状态为1或2的实例数
var total = 1;        // 总实例数（包括plane_inst）

// 检查plane_inst的状态
if (plane_inst != noone) {
    if (plane_inst.state == 0 || plane_inst.state == 3) {
        count_0_3++;
    } else if (plane_inst.state == 1 || plane_inst.state == 2) {
        count_1_2++;
    }
} else {
    // 如果plane_inst不存在，直接设置为3
    state = 3;
    exit;
}

// 检查wingman_left_inst数组中的实例
for (var i = 0; i < array_length(wingman_left_inst); i++) {
    if (wingman_left_inst[i] != noone) {
        total++;
        if (wingman_left_inst[i].state == 0 || wingman_left_inst[i].state == 3) {
            count_0_3++;
        } else if (wingman_left_inst[i].state == 1 || wingman_left_inst[i].state == 2) {
            count_1_2++;
        }
    }
}

// 检查wingman_right_inst数组中的实例
for (var i = 0; i < array_length(wingman_right_inst); i++) {
    if (wingman_right_inst[i] != noone) {
        total++;
        if (wingman_right_inst[i].state == 0 || wingman_right_inst[i].state == 3) {
            count_0_3++;
        } else if (wingman_right_inst[i].state == 1 || wingman_right_inst[i].state == 2) {
            count_1_2++;
        }
    }
}

// 根据条件设置自己的状态
if (count_0_3 == total) {
    state = 0;
} else if (count_1_2 == total) {
    state = 1;
} else {
    state = 2;
}

SetPosition(x,y)

with(plane_inst){
	image_blend = other.image_blend;
	image_alpha = other.image_alpha;
}
for(i=0;i<array_length(wingman_left);i+=1){
	with(wingman_left_inst[i]){
		image_blend = other.image_blend;
		image_alpha = other.image_alpha;
	}
}
for(i=0;i<array_length(wingman_right);i+=1){
	with(wingman_right_inst[i]){
		image_blend = other.image_blend;
		image_alpha = other.image_alpha;
	}
}