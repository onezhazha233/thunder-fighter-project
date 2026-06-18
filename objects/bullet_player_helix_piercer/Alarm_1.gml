live;
_dx = max(ox, room_width - ox);
_dy = max(oy, room_width - oy);
dist_max = point_distance(0,0,_dx,_dy);
Anim_Create(id,"xscale",0,0,xscale,1-xscale+big/4,80)
Anim_Create(id,"yscale",0,0,yscale,1-yscale+big/4,80)