StructType "test_motor_status",
    desc: "status of motor device"
    elements:
        ready:             { desc: "Axis Ready",            type: "bool",     units: "" }
        enabled:           { desc: "Axis Enabled",          type: "bool",     units: "" }
        warning:           { desc: "Axis Warning",          type: "bool",     units: "" }
        error:             { desc: "Axis Error",            type: "bool",     units: "" }
        moving_positive:   { desc: "Axis Moving +",         type: "bool",     units: "" }
        moving_negative:   { desc: "Axis Moving -",         type: "bool",     units: "" }
        busy:              { desc: "Busy",                  type: "bool",    units: "" }
        in_target:         { desc: "In_Rarget",             type: "bool",    units: "" }
        warning:           { desc: "warning",               type: "bool",    units: "" }
        error:             { desc: "error",                 type: "bool",    units: "" }
        calibrated:        { desc: "calibrated",            type: "bool",    units: "" }
        accelerate:        { desc: "accelerate",            type: "bool",    units: "" }
        decelerate:        { desc: "decelerate",            type: "bool",    units: "" }
        actual_position:   { desc: "Actual Position",       type: "uint32",  units: "steps" }
        actual_velocity:   { desc: "Actual Velocity",       type: "int16",   units: "steps/s" }

StructType "test_motor_pos_control",
    desc:    "motor pos control"
    elements:
        velocity:          { desc: "Velocity",              type: "int16",   units: "steps/s" }
        execute:           { desc: "Execute",               type: "bool",    units: "" }
        target_position:   { desc: "Target_position",       type: "uint32",  units: "steps" }
        acceleration:      { desc: "Acceleration",          type: "uint16",  units: "steps/s2" }
        deceleration:      { desc: "Deceleration",          type: "uint16",  units: "steps/s2" }
        start_type:        { desc: "Start Type",            type: "uint16",  units: "" }


StructType "test_motor_control",
    desc:    "motor control"
    elements:
        enable:            { desc: "Axis Enable",           type: "bool",     units: "" }
        reset:             { desc: "Axis Reset",            type: "bool",     units: "" }


StructType "test_motor",
    desc:    "test motor devices state"
    elements:
        state:             {desc: 'HMI motor devices state',       type: 'test_motor_status'}
        command:           {desc: 'HMI motor devices command',     type: 'test_motor_control'}
        pos_command:       {desc: 'HMI motor devices pos_command', type: 'test_motor_pos_control'}
