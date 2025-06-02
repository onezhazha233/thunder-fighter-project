live;
event_inherited();

up = 0
down = 0
left = 0
right = 0

collision_destroy = false

laser_sprite = spr_bullet_player_blade_abcd_line
laser_offset = 0
offset_speed = 7

range = 1500

rampage = false

edge_sequence_enabled = true
edge_sequence = -1
edge_state = 0//0为冷却中 1为刀刃准备中 2为刀刃准备攻击
edge_cd = 45
edge_attack_sequence = -1

slash_x = 0
slash_y = 0