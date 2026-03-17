live;
depth = DEPTH_BATTLE.ITEMS

item = battle_item_weapon_upgrade

time = 0

rand_angle_offset = random(360);
ring_parts=[
    {s:49,r:48},
    {s:47,r:24},
    {s:45,r:216},
    {s:42,r:192},
    {s:40,r:144},
    {s:38,r:168},
    {s:36,r:96},
    {s:33,r:336},
    {s:31,r:264},
    {s:29,r:288},
    {s:27,r:312},
    {s:24,r:120},
    {s:22,r:72},
    {s:20,r:240},
    {s:18,r:0}
];

var r_values = [];
for(var i=0;i<=336;i+=24){
    array_push(r_values, i);
}

for (var i = array_length(r_values) - 1; i > 0; i--) {
    var j = irandom(i); // 生成 [0, i] 范围内的随机整数
    var temp = r_values[i];
    r_values[i] = r_values[j];
    r_values[j] = temp;
}

for(var i=0;i<array_length(ring_parts);i++){
    if (i < array_length(r_values)) {
        ring_parts[i].r = r_values[i];
    }
}

function get_alpha(c){return (c>>24)&0xFF;}
function get_alpha_kf(kfs,t){
    if(array_length(kfs)==0)return 255;
    if(t<=kfs[0].f)return get_alpha(kfs[0].c);
    if(t>=kfs[array_length(kfs)-1].f)return get_alpha(kfs[array_length(kfs)-1].c);
    for(var i=0;i<array_length(kfs)-1;i++){
        if(t>=kfs[i].f&&t<=kfs[i+1].f){
            var d=kfs[i+1].f-kfs[i].f;
            if(d==0)return get_alpha(kfs[i].c);
            return lerp(get_alpha(kfs[i].c),get_alpha(kfs[i+1].c),(t-kfs[i].f)/d);
        }
    }
    return 255;
}