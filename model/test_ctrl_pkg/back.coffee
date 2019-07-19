    if (motor_state_val.ready && !motor_state_val.enabled) { motor_ctrl_req.enable = true; }

    motor.value.state = motor_state_val;
    motor.value.command = motor_ctrl_req;
    motor.value.pos_command = motor_pos_ctrl_req;


