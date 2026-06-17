live;
event_inherited();

idle_mode = EQUIPMENT_IDLE_MODE.SEQUENCE
idle_up_sequence = seq_sniper_a_idle_up
idle_sequence = seq_sniper_a_idle_barrel
idle_down_sequence = seq_sniper_a_idle_down
rampage_intro = seq_sniper_a_rampage_intro
rampage = seq_sniper_a_rampage
rampage_outro = seq_sniper_a_rampage_outro

bullet_emitter = emitter_wingman_sniper_a

wingman_up_sequence = -1
wingman_down_sequence = -1
barrel_angle = 0
layer_wingman_upper = layer_create(depth-1)
layer_wingman = layer_create(depth)
layer_wingman_lower = layer_create(depth+1)