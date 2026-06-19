live;
Sequence_PlayByFrame(ll);
SetPosition(player.x,player.y)
if(layer_sequence_is_finished(effect_seq)||!layer_sequence_exists(ll,effect_seq)){
	instance_destroy();
}