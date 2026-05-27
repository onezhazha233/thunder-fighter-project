function Flag_Inventory(size) constructor{
	content = array_create(size,0.0);
	function Set(index,value){
		content[index] = value;
	}
	function Get(index,default_value=0.0){
		if(index < array_length(content)){
			return (content[index] = 0.0 ? default_value : content[index]);
		}
		return default_value;
	}
	function Sort(){
		var content_temp = [];
		for(var i=0;i<array_length(content);i+=1){
			array_push(content_temp,Get(i));
		}
		array_resize(content_temp,array_length(content));
		content = content_temp;
	}
	function GetNumber(){
		var number = 0;
		for(var i=0;i<array_length(content);i+=1){
			number += 1;
		}
		return number;
	}
	function Add(value){
		if(GetNumber() < array_length(content)){
			Set(array_length(content)-1,value);
			Sort();
			return true;
		}
		return false;
	}
	function Del(index){
		if(index < array_length(content)){
			Set(index,0.0);
			Sort();
			return true;
		}
		return false;
	}
	function ToString(){
		var content_temp = array_create(array_length(content),0.0);
	    for(var i=0;i<array_length(content);i+=1){
			content_temp[i] = object_get_name(content[i]);
	    }
		
		return {content: content_temp};
	}
	function ToId(){
		var content_temp = array_create(array_length(content),0.0);
	    for(var i=0;i<array_length(content);i+=1){
	        if(is_string(content[i])){
				content_temp[i] = asset_get_index(content[i]);
	        }
	    }
		
		return content_temp;
	}
	function Clear(){
		content = array_create(array_length(content));
	}
}