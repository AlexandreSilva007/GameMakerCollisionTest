/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




var near = layer_get_id("Background_moita");
var far  = layer_get_id("background_moitona");


layer_x(near, lerp(0, camera_get_view_x(view_camera[0]), 0.1));
layer_x(far, lerp(0, camera_get_view_x(view_camera[0]), 0.01));