live;
speed_x = (x - xprevious)

roll_state_previous = roll_state

// 平滑输入
ds_queue_enqueue(roll_hist, speed_x);
if (ds_queue_size(roll_hist) > roll_hist_max) ds_queue_dequeue(roll_hist);
var sum = 0;
var _size = ds_queue_size(roll_hist);
var _tmp = ds_queue_create();
ds_queue_copy(_tmp, roll_hist);
while (!ds_queue_size(_tmp)=0) sum += ds_queue_dequeue(_tmp);
ds_queue_destroy(_tmp);
var smoothed_dx = sum / _size;
if (abs(smoothed_dx) < roll_deadzone) smoothed_dx = 0;

// 计算目标倾斜
roll_target = clamp(smoothed_dx * roll_sensitivity, -3, 3);

// 自适应平滑
var delta = roll_target - roll_real;
var adapt_rate = roll_smooth_base + min(abs(delta) * roll_smooth_scale, roll_smooth_max);
roll_real += delta * adapt_rate;

// 离散输出（防闪烁）
if (abs(roll_real - roll_state) > 0.5) roll_state += sign(roll_real - roll_state);

if(state = 0){
	if(roll_mode = 1&&roll_state_previous != roll_state){
		if!(roll_state = 0){
			rs = abs(roll_state)-1;
			SetSequence(roll_sequence[rs]);
		}
		else{
			SetSequence(idle_sequence);
		}
	}
}

SetPosition(x,y)