/// @desc
cam = view_camera[0];
camroom[0] = 0;
view_w_half = camera_get_view_width(cam) * .5;
view_h_half = camera_get_view_height(cam) * .5;
xTo = xstart;
yTo = ystart;
playerRoom = 1;
player2Room = 1;
playerRoom = clamp(playerRoom,0,10);
player2Room = clamp(player2Room,0,10);
