/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




var _near = layer_get_id("Background_moita");
var _far  = layer_get_id("background_moitona");


layer_x(_near, lerp(0, camera_get_view_x(view_camera[0]), 0.1));
layer_x(_far, lerp(0, camera_get_view_x(view_camera[0]), 0.01));