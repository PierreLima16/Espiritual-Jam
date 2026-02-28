//event_inherited();

//gpu_set_blendmode(bm_add);

draw_sprite_ext(sprite_index, image_index, x, y, xscale * dir, yscale, image_angle, image_blend, 0.9);

//gpu_set_blendmode(bm_normal);

draw_text(x, y - 60, estado_txt);
draw_text(x, y - 90, alarm[0]);

