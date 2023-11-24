/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



if(sprite_index == spr_saci_pulando){
	//show_debug_message(image_index);
	image_index = 3; //congela no frame 3
}
else if(sprite_index == spr_saci_attack || sprite_index == spr_saci_jump_attack){
	saci.estado = STATE.LIVRE; //terminou ataque, está livre
		
	if(instance_exists(obj_hitbox_attack)) instance_destroy(obj_hitbox_attack);
	if(instance_exists(obj_hitbox_jump_attack)) instance_destroy(obj_hitbox_jump_attack);
}