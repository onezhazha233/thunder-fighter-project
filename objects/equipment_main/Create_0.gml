event_inherited();

enabled = false

function get_random_child(base) {
    var _candidates = [];
    var _i = 0;
    var _miss = 0;
    
    // --- 配置搜索条件 ---
    var _target_parent = base; // 默认：搜索传入的 base 的子对象
    var _prefix_filter = "";   // 默认：不需要过滤名称前缀
    
    // 特殊逻辑：如果 base 是字符串 "subweapon"
    if (base == "subweapon") {
        // 确保你的项目中确实有一个叫 bullet_emitter 的对象资源
        // 这里假设 bullet_emitter 是对象资源ID，不是字符串
        _target_parent = emitter_player; 
        _prefix_filter = "subweapon_";
    }
    // --------------------

    while (true) {
        if (object_exists(_i)) {
            _miss = 0;
            
            // 第一步：检查父子关系
            // 注意：object_is_ancestor 严格检查父级，不包含 _i == _target_parent 的情况
            // 如果你也想包含 _target_parent 本身，需要写成:
            // if (object_is_ancestor(_i, _target_parent) || _i == _target_parent)
            if (object_is_ancestor(_i, _target_parent)) {
                
                var _is_match = true;
                
                // 第二步：如果设置了前缀过滤，检查名称
                if (_prefix_filter != "") {
                    var _name = object_get_name(_i);
                    // string_pos 返回 1 表示字符串出现在开头
                    if (string_pos(_prefix_filter, _name) != 1) {
                        _is_match = false;
                    }
                }
                
                // 只有同时满足“是子对象”和“名称匹配(如果有要求)”才加入
                if (_is_match) {
                    array_push(_candidates, _i);
                }
            }
        } else {
            _miss++;
        }
        
        // 安全中断：连续 50 个空 ID 认为遍历结束
        if (_miss > 50) break; 
        _i++;
    }
    
    // 返回结果
    if (array_length(_candidates) > 0) {
        return _candidates[irandom(array_length(_candidates) - 1)];
    }
    
    // 如果没找到：
    // 如果是特殊模式 "subweapon"，返回 noone (因为返回字符串会导致生成报错)
    if (base == "subweapon") return subweapon_tracking_missile;
    
    // 普通模式下维持你原有的逻辑，返回 base 本身
    return base;
}

xscale = 1
yscale = 1
plane = plane_agent //get_random_child(plane_agent)
wingman_left = []//[get_random_child(wingman_agent)]
wingman_right = []//[get_random_child(wingman_agent)]
wingman_x_offset = [130,180]
wingman_y_offset = [0,0]
subweapon = subweapon_tungsten_armor_piercer //get_random_child("subweapon")
//armor = get_random_child(armor_agent)

/*for(i=0;i<8;i+=1){
	wingman_left[i] = plane_aurora_phantom;
	wingman_right[i] = plane_aurora_phantom;
	
	wingman_x_offset[i] = 0+sin(i/8*pi)*100;
	wingman_y_offset[i] = 0-cos(i/8*pi)*100;
}
*/

//tb = MakeEnemyBullet(200,900+random(10),bullet_enemy_red,spr_bullet_enemy_red_0);