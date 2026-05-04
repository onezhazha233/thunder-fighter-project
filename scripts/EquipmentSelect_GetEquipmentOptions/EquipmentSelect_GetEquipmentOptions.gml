/// @description 获取某类装备的所有可选对象列表（用于下拉框）
/// @param {Asset.GMObject} _parent_obj 父对象（如 plane_agent, wingman_agent）
/// @param {String} _name_prefix 名称前缀过滤，空字符串表示不过滤
/// @returns {Array} 数组，每项为 { obj: 对象id, name: 显示名 }
function EquipmentSelect_GetEquipmentOptions(_parent_obj, _name_prefix = "") {
	var _list = [];
	var _catalog = [];
	if (_parent_obj == plane_agent) {
		_catalog = Equipment_Plane();
	} else if (_parent_obj == wingman_agent) {
		_catalog = Equipment_Wingman();
	} else if (_parent_obj == emitter_player) {
		_catalog = Equipment_Subweapon();
	} else if (_parent_obj == armor_agent) {
		_catalog = Equipment_Armor();
	}
	var _i = 0;
	var _miss = 0;
	while (true) {
		if (object_exists(_i)) {
			_miss = 0;
			if (object_is_ancestor(_i, _parent_obj)) {
				var _name = object_get_name(_i);
				var _ok = (_name_prefix == "" || string_pos(_name_prefix, _name) == 1);
				if (_ok) {
					var _display_name = Equipment_GetName(_i);
					var _icon_name = _name;
					var _prefix_pos = string_pos("_", _icon_name);
					if (_prefix_pos > 0) {
						_icon_name = string_copy(_icon_name, _prefix_pos + 1, string_length(_icon_name) - _prefix_pos);
					}
					var _matched = undefined;
					for (var _j = 0; _j < array_length(_catalog); _j++) {
						var _entry = _catalog[_j];
						if (_entry.icon == _icon_name) {
							_matched = _entry;
							break;
						}
					}
					if (!is_undefined(_matched)) {
						array_push(_list, {
							obj: _i,
							name: _matched.name,
							ability: _matched.ability,
							quality: _matched.quality,
							icon: _matched.icon
						});
					} else {
						array_push(_list, {
							obj: _i,
							name: _display_name,
							ability: "",
							quality: 0,
							icon: _icon_name
						});
					}
				}
			}
		} else {
			_miss++;
		}
		if (_miss > 50) break;
		_i++;
	}
	return _list;
}
