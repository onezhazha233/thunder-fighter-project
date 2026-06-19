live;
Sequence_PlayByFrame(sl);
SetPosition(player.x,player.y)
if(layer_sequence_is_finished(effect_rampage)||!layer_sequence_exists(sl,effect_rampage)){
	instance_destroy();
}