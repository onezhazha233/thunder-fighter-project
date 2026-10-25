/// @function find_priority_enemy(obj)
/// @param {Asset.GMObject} obj The object to track
/// @returns {Id.Instance} The highest priority enemy_agent instance or noone if none found
function find_priority_enemy(obj) {
    // Create a priority queue to store instances sorted by priority
    var pq = ds_priority_create();
    
    // Prefer any non-blockbullet enemies if present
    var has_non_blockbullet = false;
    with (enemy_agent) {
        if (object_index != enemy_blockbullet) {
            has_non_blockbullet = true;
        }
    }

    // Find all enemy_agent instances
    with (enemy_agent) {
        if (has_non_blockbullet && object_index == enemy_blockbullet) {
            continue;
        }
        var dist = point_distance(x, y, other.x, other.y); // Calculate distance to caller's position
        var priority = dist; // Base priority is distance
        
        // Check if tracks map exists and contains obj's object_index
        var key = obj.object_index;
        if (ds_map_exists(tracks, key)) {
            // Increase distance priority (lower priority) based on track count
            priority += ds_map_find_value(tracks, key) * 100; // Adjust multiplier as needed
        }
        
        // Add to priority queue (lower value = higher priority)
        ds_priority_add(pq, id, priority);
    }
    
    // Get highest priority instance
    var highest_priority_inst = noone;
    if (!ds_priority_empty(pq)) {
        highest_priority_inst = ds_priority_delete_min(pq);
        
        // Update tracks map for the selected instance
        if (highest_priority_inst != noone) {
            with (highest_priority_inst) {
                var key = obj.object_index;
                // Update or add track count
                if (ds_map_exists(tracks, key)) {
                    ds_map_replace(tracks, key, ds_map_find_value(tracks, key) + 1);
                } else {
                    ds_map_add(tracks, key, 1);
                }
            }
        }
    }
    
    // Clean up priority queue
    ds_priority_destroy(pq);
    
    return highest_priority_inst;
}

/// @function find_follow_target()
/// @returns {Id.Instance} 统一追踪索敌(原版 WeaponBulletMgr.pickRandomFollowTarget):
///          Boss 存在必锁(存活即可,原版不对 Boss 做合适性检查);
///          否则从"合适"敌机中均匀随机——可受伤(inv_collision=false)+在视野矩形内,
///          有非拦截型时跳过拦截型(enemy_blockbullet);无合适目标返回 noone(调用方锁NONE不再重问)
function find_follow_target() {
    var _boss = noone;
    with (enemy_agent) {
        if (object_index = boss_agent || object_is_ancestor(object_index, boss_agent)) {
            _boss = id;
            break;
        }
    }
    if (_boss != noone) return _boss;

    var _has_non_block = false;
    with (enemy_agent) {
        if (object_index != enemy_blockbullet) {
            _has_non_block = true;
            break;
        }
    }

    /* 蓄水池采样: 第 n 个合适敌机以 1/n 概率成为选择 → 均匀随机且零临时分配 */
    var _pick = noone;
    var _count = 0;
    with (enemy_agent) {
        if (_has_non_block && object_index = enemy_blockbullet) continue;
        if (inv_collision) continue;
        if (!point_in_rectangle(x, y, -60, -60, room_width + 60, room_height + 60)) continue;
        _count += 1;
        if (irandom(_count - 1) = 0) _pick = id;
    }
    return _pick;
}
