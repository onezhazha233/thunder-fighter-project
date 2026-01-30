/// @description 获取某类装备的所有可选对象列表（用于下拉框）
/// @param {Asset.GMObject} _parent_obj 父对象（如 plane_agent, wingman_agent）
/// @param {String} _name_prefix 名称前缀过滤，空字符串表示不过滤
/// @returns {Array} 数组，每项为 { obj: 对象id, name: 显示名 }
function EquipmentSelect_GetEquipmentOptions(_parent_obj, _name_prefix = "") {
	var _list = [];
	var _i = 0;
	var _miss = 0;
	while (true) {
		if (object_exists(_i)) {
			_miss = 0;
			if (object_is_ancestor(_i, _parent_obj)) {
				var _name = object_get_name(_i);
				var _ok = (_name_prefix == "" || string_pos(_name_prefix, _name) == 1);
				if (_ok) {
					array_push(_list, { obj: _i, name: _name });
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
