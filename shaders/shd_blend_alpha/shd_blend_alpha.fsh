varying vec2 v_vTexcoord;                // 从顶点着色器传递的纹理坐标
varying vec4 v_vColour;                  // 从顶点着色器传递的颜色

uniform vec4 u_blendColor;               // 自定义混合颜色（对应 image_blend）

void main() {
    vec4 textureColor = texture2D(gm_BaseTexture, v_vTexcoord); // 获取纹理颜色
    vec4 finalColor = textureColor * u_blendColor;              // 乘法混合
    gl_FragColor = finalColor * v_vColour;                      // 应用顶点颜色
}