live;
draw_text(0,100,$"enemy bullet number:{instance_number(bullet_enemy)}")
draw_text(0,150,$"player bullet number:{instance_number(bullet_player)}")
draw_text(0,200,$"ins number:{instance_number(all)}")

var _total_count = 0;

// 1. 获取当前房间的所有图层 ID 数组
var _all_layers = layer_get_all();

// 2. 遍历每一个图层
for (var i = 0; i < array_length(_all_layers); i++) {
    var _layer_id = _all_layers[i];
    
    // 3. 获取该图层上的所有元素 ID 数组
    var _elements = layer_get_all_elements(_layer_id);
    
    // 4. 遍历该图层上的每一个元素
    for (var j = 0; j < array_length(_elements); j++) {
        var _element_id = _elements[j];
        
        // 5. 检查元素类型是否为 Sequence
        if (layer_get_element_type(_element_id) == layerelementtype_sequence) {
            _total_count++;
        }
    }
}

draw_text(0,250,$"seq number:{_total_count}")