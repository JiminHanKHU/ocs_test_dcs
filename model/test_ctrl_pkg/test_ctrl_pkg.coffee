
Package   'test_ctrl_pkg',
    info: 'TEST Controller Package'
    desc: 'TEST Controller Package'
    uses: ["ocs_core_fwk"]

    connectors: [
        { id: 8101, from: { element: "test_hw1_adapter", port: "motor_state"},          to: { element: "test_main_ctrl",   port: "motor_state_val"},   max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8104, from: { element: "test_main_ctrl",   port: "motor_ctrl_req"},       to: { element: "test_hw1_adapter", port: "motor_ctrl"},    max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
        { id: 8105, from: { element: "test_main_ctrl",   port: "motor_pos_ctrl_req"},   to: { element: "test_hw1_adapter", port: "motor_pos_ctrl"},    max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" } 
    ]
