live;
if(surface_exists(surf))surface_free(surf);
layer_sequence_destroy(enemy_sequence)
layer_sequence_destroy(flame_sequence)
layer_destroy(layer_enemy)
layer_destroy(layer_enemy_lower)
instance_destroy(bullet_emitter_inst)
/*layer_script_begin("enemies", function(){});
layer_script_end("enemies", function(){});
layer_script_begin("enemies_lower", function(){});
layer_script_end("enemies_lower", function(){});