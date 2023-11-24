saci = {
	y_speed : 0.0,
	x_speed  : 0.0,
	max_speed  : 10.0,
	jump_power  : 25,
	acceleration  : 0.2,
	jumping  :false, 
	jump_attack: false,
	gravidade: 1.0,
	estado: STATE.LIVRE
};


enum STATE{
	LIVRE,
	ATACANDO
}



camera_width = camera_get_view_width(view_camera[0]);
camera_height =  camera_get_view_height(view_camera[0]);


