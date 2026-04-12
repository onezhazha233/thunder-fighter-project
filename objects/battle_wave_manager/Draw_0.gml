live;
draw_text(0,500,ds_queue_size(waves))
draw_text(0,550,wave)
draw_text(0,600,array_contains(boss_waves,wave))
draw_text(0,650,instance_exists(enemy_agent))
draw_text(0,700,instance_exists(wave_inst))
draw_text(0,750,enabled)