Controller         'test_main_ctrl',
    info:          'TEST main Controller'
    desc:          'This component implements the control of the test'
    extends:       ['BaseController']
    abstract:      false
    uses:          ["ocs_core_fwk", "ocs_ctrl_fwk"]

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

    state_vars:
        motor:
            desc:               'motor device state'
            type:               'test_motor'
            max_rate:           1000
            blocking_mode:      'sync'
            is_controllable:    false

    input_ports:
        motor_state_val:
            desc:            'motor state'
            type:            'test_motor_status'
            protocol:        'pull'
            max_rate:        1000
            blocking_mode:   'sync'
            owner:           true

    output_ports:
        motor_ctrl_req:
            type:            'test_motor_control'
            protocol:        'push'
            max_rate:        1000
            desc:            'motor control'
            blocking_mode:   'sync'
            owner:           false

        motor_pos_ctrl_req: 
            type:            'test_motor_pos_control'
            protocol:        'push'
            max_rate:        1000
            desc:            'motor pos control' 
            blocking_mode:   'sync'
            owner:           false

    properties:
        uri:       {default: "gmt://127.0.0.1/test_dcs"}
        name:      {default: "test_main_ctrl"}
        host:      {default: "127.0.0.1"}
        port:      {default: 9020}
        scan_rate: {default: 100}

    instance_configurations: ['test_main_ctrl']
