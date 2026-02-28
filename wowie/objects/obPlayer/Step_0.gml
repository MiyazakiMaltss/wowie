x_speed = 0; // reset horizontal speed 

y_speed += grav; // add gravity to y_speed

if keyboard_check(vk_right) { // if the right arrow key is pressed

    x_speed = movement_speed; // set the horizontal speed to heidi's movement_speed

} else if keyboard_check(vk_left) { // otherwise, if the left arrow key is pressed

    x_speed = -movement_speed; // set the horizontal speed to negative heidi's movement_speed, making her move left

}

move_and_collide(x_speed, y_speed, obSolid);

if (place_meeting(x, y + 1, obSolid)) { // if heidi is on the ground

    if (keyboard_check_pressed(vk_up)) { // and the up arrow key is pressed

        y_speed = -8; // make heidi jump by setting her y_speed to a negative value

    } else { // otherwise, if heidi is on the ground but not jumping

        y_speed = 0; // set her y_speed to 0 so she doesn't fall through the ground

    }

}

if (place_meeting(x, y, obSpike)) { // if heidi collides with the spikes

    room_goto(lose) // restart the level
	audio_play_sound(boowomp, 1, false);

}

if (y > room_height or y < 0 or x > room_width or x < 0) { // if the player is outside of the room

    room_goto(lose)
	audio_play_sound(boowomp, 1, false);

}

if keyboard_check(vk_right) {

    x_speed = movement_speed; 

    image_xscale = -1; // flip heidi's sprite so she faces right

} else if keyboard_check(vk_left) {

    x_speed = -movement_speed; 

    image_xscale = 1; // reset her sprite so she faces left

}

if (place_meeting(x, y, obFlag)) {
    room_goto_next(); // go to the next room/level
	audio_play_sound(yay, 1, false);
}