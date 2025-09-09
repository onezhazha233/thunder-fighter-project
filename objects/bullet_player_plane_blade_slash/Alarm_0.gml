live;
if(rampage = true){
	seq = layer_sequence_create(l,x,y,slash_sequence);
	bullet = instance_create_depth(x,y,depth,bullet_player_plane_blade);
	bullet.scale_x = scale_x;
	bullet.scale_y = scale_y;
	bullet.image_angle = image_angle;
	bullet.image_speed = 1;
	bullet.damage = damage;
}
else{
	seq = layer_sequence_create(l,x,y,slash_rampage_sequence);
	bullet = instance_create_depth(x,y,depth,bullet_player_plane_blade);
	bullet.scale_x = scale_x;
	bullet.scale_y = scale_y;
	bullet.image_angle = image_angle;
	bullet.damage = damage;
}
layer_sequence_angle(seq,image_angle);

for (var i = 0; i < 10; i++) {
    var t = i * 360 / 10;
	r = random_range(-10,10);
        
    // 计算椭圆上的点(未旋转)
    var dir = point_direction(0, 0, 20 * dcos(t), 10 * dsin(t));
    var len = point_distance(0, 0, 20 * dcos(t), 10 * dsin(t));
        
    // 应用旋转
    var final_dir = dir + image_angle;
    var final_x = x + lengthdir_x(len, final_dir)*scale_x;
    var final_y = y + lengthdir_y(len, final_dir)*scale_y;
        
    a = instance_create_depth(final_x, final_y, DEPTH_BATTLE.EFFECTS,bullet_effect_blade_slash_point);
	a.sprite_index = point_sprite;
	a.direction = dir + image_angle + r;
	a.speed = point_distance(x,y,final_x,final_y)/3;
	a.image_xscale = scale_x;
	a.image_yscale = scale_y;
}