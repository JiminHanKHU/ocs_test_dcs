
Adapter            'test_hw_adapter',
    info:          'TEST Hw Adapter'
    desc:          'This component defines the interface with the test'
    abstract:      false
    extends:       ['EthercatAdapter']
    uses:          ["ocs_core_fwk", "ocs_io_fwk"]

    # Management attributes:
    instances:     1
    c_factor:      1
    r_factor:      1
    procurement:   "swc"
    phase:         "design"
    resource:      "labor"
    assignee:      "person1"
    fte_perc:      "100"
    status:        "DONE"
    activity_type: "activity"
    release:       [1]
    stage:         "1"

    input_ports:
        motor_ctrl:       { type: 'test_motor_control',     protocol: 'pull', max_rate: 1000, blocking_mode: 'sync', owner: true, desc: 'motor control' }
        motor_pos_ctrl:   { type: 'test_motor_pos_control', protocol: 'pull', max_rate: 1000, blocking_mode: 'sync', owner: true, desc: 'motor pos control' }

    output_ports:
        motor_state:      { type: 'test_motor_status',      protocol: 'push', max_rate: 1000, blocking_mode: 'sync', owner: false, desc: 'motor state' }

    data_object_map: [

        # input ports / rx_pdos
        { data_object: "motor_enable",             port: "motor_ctrl",          field: "enable" }
        { data_object: "motor_reset",              port: "motor_ctrl",          field: "reset" }

        { data_object: "motor_velocity",           port: "motor_pos_ctrl",      field: "velocity" } 
        { data_object: "motor_execute",            port: "motor_pos_ctrl",      field: "execute" } 
        { data_object: "motor_start_type",         port: "motor_pos_ctrl",      field: "start_type" } 
        { data_object: "motor_acceleration",       port: "motor_pos_ctrl",      field: "acceleration" } 
        { data_object: "motor_deceleration",       port: "motor_pos_ctrl",      field: "deceleration" }
        { data_object: "motor_target_position",    port: "motor_pos_ctrl",      field: "target_position" }        

        # ouput ports / tx_pdos
        { data_object: "motor_in_target",          port: "motor_state",      field: "in_target" }
        { data_object: "motor_busy",               port: "motor_state",      field: "busy" }
        { data_object: "motor_warning",            port: "motor_state",      field: "warning" }
        { data_object: "motor_error",              port: "motor_state",      field: "error" }
        { data_object: "motor_calibrated",         port: "motor_state",      field: "calibrated" }
        { data_object: "motor_accelerate",         port: "motor_state",      field: "accelerate" }
        { data_object: "motor_decelerate",         port: "motor_state",      field: "decelerate" }
        { data_object: "motor_actual_position",    port: "motor_state",      field: "actual_position" }
        { data_object: "motor_actual_velocity",    port: "motor_state",      field: "actual_velocity" } 
        
        { data_object: "motor_ready",              port: "motor_state",         field: "ready" }
        { data_object: "motor_enabled",            port: "motor_state",         field: "enabled" }
        { data_object: "motor_warning",            port: "motor_state",         field: "warning" }
        { data_object: "motor_error",              port: "motor_state",         field: "error" }
        { data_object: "motor_moving_positive",    port: "motor_state",         field: "moving_positive" }
        { data_object: "motor_moving_negative",    port: "motor_state",         field: "moving_negative" }
    

    ]

    properties:
        uri:       {default: "gmt://127.0.0.1/test_dcs"}
        name:      {default: "test_hw_adapter"}
        host:      {default: "127.0.0.1"}
        port:      {default: 9010}
        scan_rate: {default: 100}

    instance_configurations: ['test_hw1_adapter']
