key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
if (key_left) || (key_right){
	controller = 0
}
//Checks deadzone on analog stick
if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2) {
	//Replaces keyboard buttons for analog stick
	key_left = abs(min(gamepad_axis_value (0,gp_axislh),0))
	key_right = max(gamepad_axis_value(0,gp_axislh),0)
	controller = 1
}
#region Collisions
//Horizontal Collision
if(place_meeting(x+h_speed,y,wall)) {
	
	while (!place_meeting(x+sign(h_speed),y,wall)) {
		
		x = x + sign(h_speed);
		
	}
	h_speed = 0;	
}

//Vertical Collision
if(place_meeting(x,y+v_speed,wall)) {
	//sign returns if a varible is positive(1) or negative(-1)
	while (!place_meeting(x,y+sign(v_speed),wall)) {
		
		y = y + sign(v_speed);
			
	}
	v_speed = 0;	
}

//Door Collision
if(place_meeting(x+h_speed,y,door)) {
	
	while (!place_meeting(x+sign(h_speed),y,door)) {
		
		x = x + sign(h_speed);
		
	}
	h_speed = 0;
}
#endregion

//Update location
x = x + h_speed;
y = y + v_speed;

//Turns on gravity
v_speed = v_speed + player.grav;

hitboxTimer = hitboxTimer - 1;

#region If has control
if (!player.active) {
	var move = key_right - key_left;
	
	h_speed = move * mySpeed;
	
	//Jump
	if (((place_meeting(x,y+player.grav,wall)) && ((keyboard_check_pressed(vk_space)) || (gamepad_button_check_pressed(0,gp_face1))))) {
		if (player.gravSwitch) {
			v_speed = jumpStrength;
		}
		else {
			v_speed = -jumpStrength;
		}
	}
	
	if (keyboard_check_pressed(vk_shift)){
		h_speed = 0;
		v_speed = 0;
		if (hitboxTimer < 0) {
			with (instance_create_layer(x,y,player2,hitbox)){
				image_xscale = other.image_xscale;
				image_yscale = other.image_yscale;
				with (instance_place(x,y,smashableWall)) {
					instance_destroy();		
				}
			}
		}
	}
	
	//Gives key cards to other player
	if ((place_meeting(x+h_speed,y,player)) && (numOfCards > 0)) {

		player.numOfCards += numOfCards;

	}
}
#endregion
