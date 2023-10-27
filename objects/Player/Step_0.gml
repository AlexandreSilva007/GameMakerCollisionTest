
var _xdirection = keyboard_check(vk_right) - keyboard_check(vk_left);
//var _ydirection = keyboard_check(vk_down) - keyboard_check(vk_up);
var _pulou = keyboard_check(vk_space);


if(_xdirection==0){
	var _old_sign = sign(x_speed);
	x_speed = x_speed - acceleration*_old_sign*2;

	var _new_sign = sign(x_speed);

	if(_old_sign != _new_sign){
		x_speed = 0;
	}
}
else{
	x_speed = x_speed + _xdirection*acceleration;
	
	if(x_speed  > max_speed) {x_speed = max_speed;}
	else if (x_speed < -max_speed){ x_speed = -max_speed;}
}





y_speed  = y_speed +  gravidade;


var _colx = move_and_collide(x_speed, 0, obj_collision,abs(x_speed));



if(array_length(_colx) > 0){
	show_debug_message(object_get_name(_colx[0].object_index));
	if(object_get_name(_colx[0].object_index) == object_get_name(obj_piso.object_index) ){
		x_speed = 0;
	}
}

var _zerar = false;
if( array_length( move_and_collide(0,y_speed,obj_collision, abs(y_speed))   ) > 0){
	y_speed = 0;
	if(_pulou){
		show_debug_message("pulo");
		y_speed = -jump_power*gravidade; //pulo
	}
}



//#region Colisao Rampas
//var _testey =  place_meeting(x, y+y_speed, obj_rampa);		
//if(_testey){	
//	var _y=1, _max = 10;	
//	while(!place_meeting(x,y+_y,obj_rampa) && _max>0){
//		_y++;
//		_max--;
//	}
	
//	show_debug_message(_y);
//	y = y -_y*sign(y_speed);
//	y_speed = 0;
//}


//var _testex =  place_meeting(x+x_speed, y, obj_rampa);		
//if(_testex){
//	var _x=1, _max = 10;
//	while(!place_meeting(x+_x,y,obj_rampa) && _max>0){
//		_x++;
//		_max--;
//	}
	
//	show_debug_message(_x);
//	x = x + _x * sign(x_speed);
//	x_speed=0;	
//}
//#endregion


//var _teste = _testex || _testey;


//#region Colisao Paredes ou pisos
//var _coly = place_meeting(x, y + y_speed, obj_piso);

//if(_coly && !_teste){
//	y_speed = 0;	
//	show_debug_message("coly");
//}


//var _colx = place_meeting(x + x_speed, y, obj_piso);
//if(_colx && !_teste){
//	x_speed = 0;
//	show_debug_message("colx");
//}

//y = y + y_speed;
//x = x + x_speed;

//#endregion


//if(_coly || _testey){
//	if(_pulou){
//		show_debug_message("pulo");
//		y_speed = -jump_power*gravidade; //pulo
//	}
//}
		
		
		
		
		
		
		
if(_xdirection==0){
	sprite_index = spr_saci_parado;
}
else if(_xdirection==1){
	sprite_index = spr_saci_andando;
	image_xscale = 1;
}
else{	
	sprite_index = spr_saci_andando;
	image_xscale = -1;
}
		
	




//var cx = lerp(camera_get_view_x(view_camera[0]), x-camera_width/2, 0.5);
camera_set_view_pos(view_camera[0], x-camera_width/2, camera_height/2 + y);
	
	

