function laser_find(ox, oy, dir, range, object, prec, notme) {
    
    var sx = lengthdir_x(range, dir);
    var sy = lengthdir_y(range, dir);
    var dx = ox + sx;
    var dy = oy + sy;
    
    // 特殊处理enemy_agent的矩形碰撞检测
    if (object == enemy_agent) {
        var min_dist = range + 1;
        var closest_inst = noone;
        
        with(enemy_agent) {
            if (collision_type == COLLISION_TYPE.RECTANGLE) {
                // 计算矩形边界
                var rect_left = x - left;
                var rect_right = x + right;
                var rect_top = y - up;
                var rect_bottom = y + down;
                
                // 检查射线与矩形相交
                var intersect = line_rectangle_intersection(
                    ox, oy, dx, dy,
                    rect_left, rect_top, rect_right, rect_bottom
                );
                
                if (intersect[0]) {
                    var dist = point_distance(ox, oy, intersect[1], intersect[2]);
                    if (dist < min_dist) {
                        min_dist = dist;
                        closest_inst = id;
                    }
                }
            }
			else{
				// 原始碰撞检测逻辑
		        var inst = collision_line(ox, oy, dx, dy, object, prec, notme);
		        var distance = -1;
        
		        if (inst != noone) {
		            while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
		                sx /= 2;
		                sy /= 2;
                
		                var test_inst = collision_line(ox, oy, dx, dy, object, prec, notme);
		                if (test_inst != noone) {
		                    dx -= sx;
		                    dy -= sy;
		                    inst = test_inst;
		                } else {
		                    dx += sx;
		                    dy += sy;
		                }
		            }
		            distance = point_distance(ox, oy, dx, dy);
		        }
		        return [distance, inst];
			}
        }
        
        if (closest_inst != noone) {
            return [min_dist, closest_inst];
        }
        return [-1, noone];
    }
    else {
        // 原始碰撞检测逻辑
        var inst = collision_line(ox, oy, dx, dy, object, prec, notme);
        var distance = -1;
        
        if (inst != noone) {
            while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
                sx /= 2;
                sy /= 2;
                
                var test_inst = collision_line(ox, oy, dx, dy, object, prec, notme);
                if (test_inst != noone) {
                    dx -= sx;
                    dy -= sy;
                    inst = test_inst;
                } else {
                    dx += sx;
                    dy += sy;
                }
            }
            distance = point_distance(ox, oy, dx, dy);
        }
        return [distance, inst];
    }
}

// 辅助函数：线段与矩形相交检测
function line_rectangle_intersection(x1,y1,x2,y2, left,top,right,bottom) {
    // 实现线段与矩形四条边的相交检测
    var intersections = [];
    
    // 检查与四条边的交点
    var edges = [
        [left,top, right,top],    // 上边
        [right,top, right,bottom],// 右边
        [left,bottom, right,bottom],// 下边
        [left,top, left,bottom]   // 左边
    ];
    
    for (var i = 0; i < 4; i++) {
        var edge = edges[i];
        var intersect = line_line_intersection(
            x1,y1,x2,y2,
            edge[0],edge[1],edge[2],edge[3]
        );
        if (intersect[0]) {
			array_push(intersections,intersect)
        }
    }
    
    // 返回最近的交点
    if (array_length(intersections) > 0) {
        var closest = intersections[0];
        var min_dist = point_distance(x1,y1, closest[1],closest[2]);
        
        for (var i = 1; i < array_length(intersections); i++) {
            var dist = point_distance(x1,y1, intersections[i][1],intersections[i][2]);
            if (dist < min_dist) {
                min_dist = dist;
                closest = intersections[i];
            }
        }
        return closest;
    }
    return [false, 0, 0];
}

// 辅助函数：线段与线段相交检测
function line_line_intersection(x1,y1,x2,y2, x3,y3,x4,y4) {
    var denom = (y4-y3)*(x2-x1) - (x4-x3)*(y2-y1);
    if (denom == 0) return [false,0,0];
    
    var ua = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / denom;
    var ub = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / denom;
    
    if (ua >= 0 && ua <= 1 && ub >= 0 && ub <= 1) {
        return [true, x1+ua*(x2-x1), y1+ua*(y2-y1)];
    }
    return [false,0,0];
}