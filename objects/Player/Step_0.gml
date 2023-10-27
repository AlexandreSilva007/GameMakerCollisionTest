var _xdirection = keyboard_check(vk_right) - keyboard_check(vk_left);
var _pulou = keyboard_check(vk_space);


#region Velocidade em X
/*Não está tantando se mover, desacelerar em X*/
if( _xdirection == 0 ){
	var _old_sign = sign(x_speed);
	x_speed = x_speed - acceleration*_old_sign*2; //desacelera
	var _new_sign = sign(x_speed);
	
	if(_old_sign != _new_sign){ //se desacelerou a ponto de inverter velocidade, para
		x_speed = 0;
	}
}
else{
	x_speed = x_speed + _xdirection*acceleration; //acelera de acordo com a direção pressionada
	
	//limita a velocidade máxima
	if(x_speed  > max_speed) {x_speed = max_speed;}
	else if (x_speed < -max_speed){ x_speed = -max_speed;}
}
#endregion

#region Velocidade em Y
//velocidade em Y é o qua já havia + aceleração da gravidade
y_speed  = y_speed +  gravidade;
#endregion


#region Colisão em X
var _colx = move_and_collide(x_speed, 0, obj_collision/*, abs(x_speed)*/);
if(array_length(_colx) > 0){
	if(object_get_name(_colx[0].object_index) == object_get_name(obj_piso.object_index) ){
		x_speed = 0;
	}
}
#endregion


#region Colisão em Y e pulo
if( array_length( move_and_collide(0,y_speed,obj_collision /*, abs(y_speed)*/)   ) > 0 ){
	y_speed = 0;
	jumping = false;
	if(_pulou){
		y_speed = -jump_power*gravidade; //pulo
		jumping = true;
	}
}
#endregion
		

#region Seleção da Animação


if(jumping){
	
	sprite_index = spr_saci_pulando;
	
	if(_xdirection!=0)
		image_xscale = sign(_xdirection);
}
else{

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
}
#endregion
		


//câmera
//var cx = lerp(camera_get_view_x(view_camera[0]), x-camera_width/2, 0.5);
camera_set_view_pos(view_camera[0], x-camera_width/2, camera_height/2 + y);