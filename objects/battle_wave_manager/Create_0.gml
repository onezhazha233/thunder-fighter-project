live;
enabled = false
wave = -1
waves = ds_queue_create()
wave_inst = noone
boss_waves = []

ds_queue_enqueue(waves,wave_boss_umbra_apex)
ds_queue_enqueue(waves,global.choicebosswave)
//ds_queue_enqueue(waves,wave_boss_umbra_apex)
/*ds_queue_enqueue(waves,wave_0)
ds_queue_enqueue(waves,wave_1)
ds_queue_enqueue(waves,wave_2)
ds_queue_enqueue(waves,wave_3)
ds_queue_enqueue(waves,wave_4)
ds_queue_enqueue(waves,wave_5)
ds_queue_enqueue(waves,wave_6)
ds_queue_enqueue(waves,wave_7)
//ds_queue_enqueue(waves,wave_8)
//ds_queue_enqueue(waves,wave_9)
//ds_queue_enqueue(waves,wave_boss_dark_assault)
ds_queue_enqueue(waves,wave_boss_galaxy_ash)*/
//ds_queue_enqueue(waves,wave_boss_red_heavy)

alarm[0] = 2