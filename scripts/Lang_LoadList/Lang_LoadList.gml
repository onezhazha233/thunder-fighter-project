function Lang_LoadList() {
	Lang_ClearList();

	var LIST=global._gmu_lang_list;
	var MANIFEST_MAP=global._gmu_lang_manifest;
	var ENTRIES=[];
	var _manifest_names=GMU_LANG_MANIFESTS;

	var _exe=filename_dir(parameter_string(0));
	if(string_char_at(_exe,string_length(_exe))!="\\"&&string_char_at(_exe,string_length(_exe))!="/"){
		_exe+="/";
	}
	var _wd=working_directory;
	if(string_char_at(_wd,string_length(_wd))!="\\"&&string_char_at(_wd,string_length(_wd))!="/"){
		_wd+="/";
	}
	var _prog=program_directory;
	if(string_char_at(_prog,string_length(_prog))!="\\"&&string_char_at(_prog,string_length(_prog))!="/"){
		_prog+="/";
	}

	// 候选根路径：相对路径在所有平台都可用（移动端由虚拟文件系统解析到游戏包），
	// 因此优先；绝对路径仅作桌面端补充。
	var _candidates=[];
	var _raw=["locale/","./locale/",_wd+"locale/",_prog+"locale/",_exe+"locale/"];
	for(var _ci=0;_ci<array_length(_raw);_ci+=1){
		var _cand=_raw[_ci];
		if(_cand==""){
			continue;
		}
		var _dup_path=false;
		for(var _pi=0;_pi<array_length(_candidates);_pi+=1){
			if(_candidates[_pi]==_cand){
				_dup_path=true;
				break;
			}
		}
		if(!_dup_path){
			array_push(_candidates,_cand);
		}
	}

	// 目录枚举只在桌面端可用：Android/iOS 上 directory_exists / file_find_first
	// 看不到游戏包（Included Files）内的文件（目录函数仅作用于存档区），
	// 因此移动端必须依赖 GMU_LANG_MANIFESTS 显式清单 + file_exists 探测。
	var _can_enumerate=(os_type==os_windows||os_type==os_macosx||os_type==os_linux);

	var _names=[];
	var _bases=[];
	for(var _ci=0;_ci<array_length(_candidates);_ci+=1){
		var _base=_candidates[_ci];

		// 1) 显式清单（全平台可用）
		for(var _mi=0;_mi<array_length(_manifest_names);_mi+=1){
			var _fname=_manifest_names[_mi];
			if(!is_string(_fname)||!file_exists(_base+_fname)){
				continue;
			}
			var _dup=false;
			for(var _fi=0;_fi<array_length(_names);_fi+=1){
				if(_names[_fi]==_fname){
					_dup=true;
					break;
				}
			}
			if(!_dup){
				array_push(_names,_fname);
				array_push(_bases,_base);
			}
		}

		// 2) 桌面端兜底：枚举目录（移动端不调用，避免无效/异常）
		if(_can_enumerate){
			var FILE=file_find_first(_base+"*.json",0);
			while(FILE!=""){
				var _dup2=false;
				for(var _fi=0;_fi<array_length(_names);_fi+=1){
					if(_names[_fi]==FILE){
						_dup2=true;
						break;
					}
				}
				if(!_dup2){
					array_push(_names,FILE);
					array_push(_bases,_base);
				}
				FILE=file_find_next();
			}
			file_find_close();
		}
	}

	// 记录实际可用的语言根路径，供 GMU_LANG_PATH_BASE 使用
	global._gmu_lang_path=(array_length(_bases)>0) ? _bases[0] : ((array_length(_candidates)>0) ? _candidates[0] : "locale/");

	// 解析清单
	for(var _fi=0;_fi<array_length(_names);_fi+=1){
		var _fname=_names[_fi];
		var _base=_bases[_fi];
		var _path=_base+_fname;
		if(!file_exists(_path)){
			continue;
		}
		var STR=Lang_LoadFileToString(_path);
		if(STR==""){
			continue;
		}
		var obj=json_parse(STR);
		if(!is_struct(obj)){
			continue;
		}
		var INFO=obj[$ "info"];
		if(!is_struct(INFO)){
			continue;
		}
		var NAME=INFO[$ "ascii_name"];
		if(!is_string(NAME)){
			continue;
		}
		if(ds_map_find_value(MANIFEST_MAP,NAME)!=undefined){
			continue;
		}

		ds_map_add(MANIFEST_MAP,NAME,obj);
		ds_map_add(global._gmu_lang_root,NAME,_base);

		var ORDER=variable_struct_exists(INFO,"order") ? INFO[$ "order"] : 9999;
		var ENTRY={};
		ENTRY[$ "name"]=NAME;
		ENTRY[$ "order"]=is_real(ORDER) ? ORDER : 9999;
		array_push(ENTRIES,ENTRY);
	}

	array_sort(ENTRIES,function(a,b){ return a.order-b.order; });
	for(var i=0;i<array_length(ENTRIES);i+=1){
		ds_list_add(LIST,ENTRIES[i].name);
	}

	return !ds_list_empty(LIST);
}
