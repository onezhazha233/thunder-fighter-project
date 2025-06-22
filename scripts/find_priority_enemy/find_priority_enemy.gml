/// @function find_priority_enemy(obj)
/// @param {Asset.GMObject} obj The object to track
/// @returns {Id.Instance} The highest priority enemy_agent instance or noone if none found
function find_priority_enemy(obj) {
    // Create a priority queue to store instances sorted by priority
    var pq = ds_priority_create();
    
    // Find all enemy_agent instances
    with (enemy_agent) {
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