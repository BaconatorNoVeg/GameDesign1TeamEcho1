var platid = instance_nearest(x,y,platform);

if (platid.appear) {
	if (place_meeting(x,y+global.grav,platform)) {
		onSurface = false;
		if (instance_exists(player)) {
			if (instance_exists(player)) {
				if (player.gravSwitch) {
					v_speed = jumpStrength;
				}
				else {
					v_speed = -jumpStrength;
				}
			}
		}
		else {
			v_speed = -jumpStrength;
		}
	}	
}
if ((((place_meeting(x,y+global.grav,wall)) || (place_meeting(x,y+global.grav,crate)) || (place_meeting(x,y+global.grav,button))) && (key_jump))) {
	onSurface = false;
	if (instance_exists(player)) {
		if (player.gravSwitch) {
			v_speed = jumpStrength;
		}
		else {
			v_speed = -jumpStrength;
		}
	}
	else {
		v_speed = -jumpStrength;
	}
}
else {
	onSurface = true;	
}