live;
// 更新偏移量，保持在背景高度的范围内
bg_offset += scroll_speed;

// 保持偏移在 0 到 bg_h 之间（向上和向下都支持）
if (bg_offset >= GetBgHeight()) {
    bg_offset -= GetBgHeight();
} else if (bg_offset < 0) {
    bg_offset += GetBgHeight();
}