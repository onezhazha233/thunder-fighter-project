live;
event_inherited();

if(rampage = true){
	dist = 0.0003*time*time*time - 0.018*time*time + 1.25*time + 30;
}
else{
	dist = 0.042*time*time - 0.125*time + 30;
}

image_angle -= rotspd
x = ox + lengthdir_x(dist,image_angle)
y = oy + lengthdir_y(dist,image_angle)

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