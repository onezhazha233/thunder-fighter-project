function MakeItem(xx,yy,item,timedom=false,duration=-1){
	if(timedom = false){
		ii = instance_create_depth(xx,yy,0,item);
		if!(duration = -1)ii.SetDuration(duration);
		
		return ii;
	}
	else{
		ie = instance_create_depth(xx,yy,0,battle_item_effect_timedom);
		ie.item = item;
		ie.item_duration = duration;
		
		return noone;
	}
}