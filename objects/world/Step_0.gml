live;
Anim_Step()

BGM_Step()

layers = layer_get_all()
for(i=0;i<array_length(layers);i+=1){
	Sequence_PlayByFrame(layers[i]);
}