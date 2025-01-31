function keyboard_get_num() {
    var num_pressed = -1;
    var count = 0;

    // Check main number row (0-9)
    for (var i = ord("0"); i <= ord("9"); i++) {
        if (keyboard_check(i)) {
            if (num_pressed != -1) return -1; // More than one number detected
            num_pressed = i - ord("0");
            count++;
        }
    }

    // Check numpad keys (vk_numpad0 - vk_numpad9)
    for (var i = vk_numpad0; i <= vk_numpad9; i++) {
        if (keyboard_check(i)) {
            if (num_pressed != -1) return -1; // More than one number detected
            num_pressed = i - vk_numpad0; // Corrected calculation
            count++;
        }
    }

    return (count == 1) ? num_pressed : -1;
}
