function draw_laser_release_cache(){
	// 释放激光缓存宿主(持久检测器实例)上的全部烘焙条带表面
	var _det = noone;
	if (variable_global_exists("laser_det_id") && instance_exists(global.laser_det_id)) {
		_det = global.laser_det_id;
	}
	else if (instance_exists(laser_detector)) {
		_det = instance_find(laser_detector, 0);
	}
	if (instance_exists(_det) && variable_instance_exists(_det, "laser_cache_list")) {
		var _list = _det.laser_cache_list;
		for (var i = 0; i < array_length(_list); i++) {
			var _s = _list[i].surf;
			if (is_real(_s) && _s != -1 && surface_exists(_s)) {
				surface_free(_s);
			}
		}
		_det.laser_cache_list = [];
		_det.laser_cache_bytes = 0;
	}
	if (variable_global_exists("laser_det_id")) global.laser_det_id = noone;
	// 释放旧路径共享表面
	if (!variable_global_exists("draw_laser_surf")) return;
	if (surface_exists(global.draw_laser_surf)) {
		surface_free(global.draw_laser_surf);
	}
	global.draw_laser_surf = -1;
	global.draw_laser_surf_w = 0;
	global.draw_laser_surf_h = 0;
}
