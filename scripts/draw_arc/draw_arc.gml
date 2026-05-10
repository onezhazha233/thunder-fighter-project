function draw_arc(x, y,radius,width,ang1,ang2,col,alpha,segments = 64){
    draw_set_alpha(alpha);

    draw_primitive_begin(pr_trianglestrip);

    for (var i = 0; i <= segments; i++){
        var t = i / segments;

        var ang = -lerp(ang1, ang2, t);

        var rad = degtorad(ang);

        var cs = cos(rad);
        var sn = sin(rad);

        // 外圈
        draw_vertex_color(
            x + cs * radius,
            y + sn * radius,
            col,
            alpha
        );

        // 内圈
        draw_vertex_color(
            x + cs * (radius - width),
            y + sn * (radius - width),
            col,
            alpha
        );
    }

    draw_primitive_end();

    draw_set_alpha(1);
}