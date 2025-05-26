///@arg x
///@arg y
///@arg dir
///@arg range
///@arg obj
///@arg prec
///@arg notme
function laser_find() {
    /// laser_find(x,y,dir,range,object,prec,notme)
    //
    //  Returns an array containing [distance, instance_id] of the nearest collision
    //  in given direction, or [-1, noone] if no collision found.
    //  Uses binary search for efficient collision detection (log2(range) checks).
    //
    //      x,y         position in room, real
    //      dir         direction to look in degrees, real
    //      range       maximum search distance in pixels, real
    //      object      object type to check for (or all), real
    //      prec        true for precise collision checking, bool
    //      notme       true to ignore calling instance, bool
    //
    /// GMLscripts.com/license
    
    var ox, oy, dir, range, object, prec, notme;
    ox = argument0;
    oy = argument1;
    dir = argument2;
    range = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    
    var sx = lengthdir_x(range, dir);
    var sy = lengthdir_y(range, dir);
    var dx = ox + sx;
    var dy = oy + sy;
    
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

/*
function laser_find(){
/// range_finder(x,y,dir,range,object,prec,notme)
//
//  Returns the exact distance to the nearest instance of an object in a
//  given direction from a given point, or noone if no instance is found.
//  The solution is found in log2(range) collision checks.
//
//      x,y         position in room, real
//      dir         direction to look in degrees, real
//      range       the greatest distance to look in pixels, real
//      object      which objects to look for (or all), real
//      prec        true to use precise collision checking, bool
//      notme       true to ignore the calling instance, bool
//
/// GMLscripts.com/license
    var ox,oy,dir,range,object,prec,notme,dx,dy,sx,sy,distance;
    ox = argument0;
    oy = argument1;
    dir = argument2;
    range = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    sx = lengthdir_x(range,dir);
    sy = lengthdir_y(range,dir);
    dx = ox + sx;
    dy = oy + sy;
    if (collision_line(ox,oy,dx,dy,object,prec,notme) < 0) {
        distance = -1;
    }else{
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            if (collision_line(ox,oy,dx,dy,object,prec,notme) < 0) {
                dx += sx;
                dy += sy;
            }else{
                dx -= sx;
                dy -= sy;
            }
        }
        distance = point_distance(ox,oy,dx,dy);
    }
    return distance;
}