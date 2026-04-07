live;
event_inherited()

depth = DEPTH_BATTLE.BULLETS_ENEMY - 50
ll = layer_create(depth)

time = 0

mark = noone

delay = 0
duration = 60

interval = 20

inv_block = true

mgseq0 = layer_sequence_create(ll,x,y,seq_bullet_enemy_umbra_apex_mega_intro)
mgseq = -1

dd = 0

image_angle = 90

laser = noone