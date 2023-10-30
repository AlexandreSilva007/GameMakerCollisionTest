//@desc Realiza movimento e colisão do player com os objetos de colisão obj_collision
function player_move_and_collide(){

	var _xdirection = keyboard_check(vk_right) - keyboard_check(vk_left);
	var _pulou = keyboard_check(vk_space);

	#region Velocidade em X
/*Não está tantando se mover, desacelerar em X*/
if( _xdirection == 0 ){
	var _old_sign = sign(saci.x_speed);
	saci.x_speed = saci.x_speed - saci.acceleration*_old_sign*2; //desacelera
	var _new_sign = sign(saci.x_speed);
	
	if(_old_sign != _new_sign){ //se desacelerou a ponto de inverter velocidade, para
		saci.x_speed = 0;
	}
}
else{
	saci.x_speed = saci.x_speed + _xdirection*saci.acceleration; //acelera de acordo com a direção pressionada
	
	//limita a velocidade máxima
	if(saci.x_speed  > saci.max_speed) {saci.x_speed = saci.max_speed;}
	else if (saci.x_speed < -saci.max_speed){ saci.x_speed = -saci.max_speed;}
}
#endregion

	#region Velocidade em Y
//velocidade em Y é o qua já havia + aceleração da gravidade
saci.y_speed  = saci.y_speed + saci.gravidade;
#endregion

	#region Colisão em X
var _colx = move_and_collide(saci.x_speed, 0, obj_collision/*, abs(x_speed)*/);
if(array_length(_colx) > 0){
	if(object_get_name(_colx[0].object_index) == object_get_name(obj_piso.object_index) ){
		saci.x_speed = 0;
	}
}
#endregion

	#region Colisão em Y e pulo
if( array_length( move_and_collide(0,saci.y_speed,obj_collision /*, abs(y_speed)*/)   ) > 0 ){
	saci.y_speed = 0;
	saci.jumping = false;
	if(_pulou){
		saci.y_speed = -saci.jump_power*saci.gravidade; //pulo
		saci.jumping = true;
	}
}
#endregion
		
	#region Seleção da Animação


if(saci.jumping){
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
	
	camera_set_view_pos(view_camera[0], x-camera_width/2,  -(camera_height/2 - y) );
}
