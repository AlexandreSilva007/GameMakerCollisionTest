/// @description Insert description here
// You can write your code in this editor

event_inherited();//lista_colisao

var _colidiu = instance_place_list(x,y, obj_inimigo, lista_colisao, false);
show_debug_message(_colidiu);


if(_colidiu > 0){

	for(var _i=0; _i < ds_list_size(lista_colisao); _i++){
		var _target = lista_colisao[| _i];
		show_debug_message(_target);
		//with(_target){
			_target.hit(x,y);
		//}
		
	}

}

