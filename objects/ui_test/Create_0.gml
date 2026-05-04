live;
main_ui = new LuiMain();
demo_style_modern = new LuiStyle()
	.setMinSize(1,1)
	.setPadding(16)
	.setGap(16)
	.setSymbolPassword("*")
	.setFonts(Lang_GetFont("zpix"), Lang_GetFont("zpix"), fModern)
	.setSprites(spr_ui_list, sUI_Square_6r)
	.setSpriteCheckbox(sUI_button, sUI_checkbox_pin)
	.setSpriteToggleSwitch(sToggleSwitch, sToggleSwitchSlider)
	.setSpriteComboBoxArrow(sUI_ComboBoxArrow)
	.setSpriteRing(sRing, sRing)
	.setSpriteScrollSlider(sUI_Square_6r, sUI_Square_6r)
	.setColors(c_white,merge_color(#393a44, c_white, 0.1), merge_color(#393a44, c_black, 0.2), #64d0b9)//_primary, _secondary, _back, _accent, _border
	.setColorAccent(#64d0b9)
	.setColorHover(c_gray)
	.setColorText(#ffffff, #9a9daf)
	.setSounds(sndBasicClick)
	.setScrollSliderWidth(10)
main_ui.setStyle(demo_style_modern).centerContent();

//luiNextDebugMode();

window_select = new LuiPanel()
.setSize(720,1000)

window_select_title = new LuiText({height: 50})
.setText(Lang_GetString("ui.plane"))
.setTextHalign(fa_center)
window_select_title.text_scale = 1.4
window_select_title.text_outline = true
window_select_title.text_outline_width = 2
window_select_title.text_outline_color = make_color_rgb(0,65,140)

//window_select.addContent(window_select_title)

tr = new LuiRow().addContent(window_select_title)
tl = new LuiRow()
list = new LuiScrollPanel()
list.setSize(700,880)
list.draw_base = false

var planes = Equipment_Subweapon()

for (var i = 0; i < array_length(planes); i++) {
    list.addContent(create_plane_item(planes[i]));
}

tl.addContent(new LuiColumn().addContent(list));
window_select.addContent([tr,tl]);

closebtn = new LuiButton({width:98,height:52});
closebtn.setPositionAbsolute();
closebtn.setPosition(602,16);
with(closebtn){
	draw = function(){
		var subimg = 0;
		if(self.is_pressed){
			subimg = 1;
		}else if(self.isMouseHovered()){
			subimg = 0;
		}
		draw_sprite(spr_ui_button_close,subimg,self.x,self.y);
	}
}
closebtn.addEvent(LUI_EV_CLICK,function(_el){
	window_select.destroy();
})
window_select.addContent(closebtn);
main_ui.addContent(window_select);

/*main_ui.y -= 100
Anim_Create(main_ui,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,main_ui.y,100,60)*/

function create_plane_item(data) {
    var rootp = new LuiPanel()
		.setWidth(657)
        .setHeight(129)
        .setPadding(20)
        .setGap(10)
	rootp.panel_sprite = spr_ui_equipment_element;
	var root = new LuiRow();

    /// 左：头像 + 星级
    var left = new LuiColumn()
        .setWidth(90)
	
	equipment_icon = new LuiIcon({value: data.icon, quality: data.quality,scale: 90/144});
	equipment_icon.setSize(90,90);
	equipment_icon.setPadding(0);
    left.addContent(equipment_icon);

    /// 中：文字信息
    var center = new LuiColumn()
        .setGap(12);

    center.addContent(new LuiText({value:data.name}));
    center.addContent(new LuiText({value: Lang_GetString("ui.ability")+" "+ data.ability}));

    /// 右：按钮或状态
    var right = new LuiColumn()
        .setWidth(120)
		.setPosition(5,8);
	btn = new LuiButton({text: Lang_GetString("ui.equip")}).setSize(118,73);
	with(btn){
		draw = function(){
			var subimg = 0;
			if(self.is_pressed){
				subimg = 1;
			}else if(self.isMouseHovered()){
				subimg = 0;
			}
			draw_sprite(spr_ui_button,subimg,self.x,self.y);
			DrawSetText(make_color_rgb(0,65,140),,fa_center,fa_middle,1);
			DrawTextOutline(self.x+width/2,self.y+height/2+subimg*2-4,text,2,make_color_rgb(57,162,225),8);
			DrawSetText(c_white);
		}
	}
	/*btn = new LuiText({value: "已装备", x:20, y: 17});
	btn.color_override=c_green;
    right.addContent(btn);*/

    root.addContent(left);
    root.addContent(center);
    root.addContent(right);
	rootp.addContent(root);

    return rootp;
}