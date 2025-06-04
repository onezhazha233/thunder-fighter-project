live;
a = instance_create_depth(slash_x,slash_y,0,bullet_player_plane_blade_slash);
a.slash_sequence = seq_bullet_player_blade_c_slash;
a.slash_rampage_sequence = seq_bullet_player_blade_c_slash_rampage;
a.point_sprite = spr_bullet_player_blade_c_slash_point;
a.image_angle = dir+65;
a.rampage = rampage;
a.damage = slash_damage