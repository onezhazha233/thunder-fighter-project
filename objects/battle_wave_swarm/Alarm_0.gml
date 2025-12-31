live;
enemy_inst = enemy.Create()
enemy_inst.ox = offset_x
enemy_inst.oy = offset_y

alarm[0] = interval;
number -= 1
offset_x += offset_x_step
offset_y += offset_y_step
if(number <= 0)instance_destroy();