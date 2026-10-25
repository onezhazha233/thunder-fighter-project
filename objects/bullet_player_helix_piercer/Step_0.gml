live;
event_inherited();

if(!phase_init){
	phase = image_angle;
	phase_init = true;
	dir = image_angle;
}

// 原版逐帧解析式：r(t)=30+0.01t+0.035t²（常态/暴走同式），θ=相位+rotateSpeed·t^指数
dist = 30 + 0.01*time + 0.035*time*time
_rs = rampage ? -55 : -14
_re = rampage ? 0.6 : 0.9
image_angle = phase + _rs*power(time,_re)-90

x = ox + lengthdir_x(dist,image_angle)
y = oy + lengthdir_y(dist,image_angle)

// 弹头朝向 = 切线方向（上一帧位置→当前位置），t=0 时取极角
if(time > 0){
	dir = point_direction(lastx,lasty,x,y);
}
lastx = x
lasty = y

if(dist > dist_max+200)instance_destroy();

time += 1

for(i=0;i<irandom_range(1,2+rampage)+part_add;i+=1){
	part = instance_create_depth(x+image_xscale*random_range(1,-1)*(5+part_add*3),y+image_yscale*random_range(1,-1)*(5+part_add*3),0,bullet_effect_helix_piercer_particle);
	if(rampage = true)part.dr = [5,15];
	part.dr[0] += part_add*3;
	part.dr[1] += part_add*3;
	part.scale_x = scale_x;
	part.scale_y = scale_y;
}
