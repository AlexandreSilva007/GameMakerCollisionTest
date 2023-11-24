/// @description Insert description here
// You can write your code in this editor


life= 10;

hit = function(_cx,_cy){
	
	audio_play_sound(snd_hard_hit,1,false);
	
	sprite_index = spr_snake_hit;
	life -=2;
	_dx = x-_cx;
	_dy = y-_cy;

	if (array_length(move_and_collide(_dx,0,obj_collision)) > 0){
		x = x - 2*_dx;
	}//bounce
	
	if (array_length(move_and_collide(0,_dy,obj_collision)) > 0){
		y = y - 2*_dy;
	}//bounce
}