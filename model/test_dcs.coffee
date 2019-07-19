# Module test_dcs specification
fs = require 'fs'
# This file shall define the attributes of the module

DCS 'test_dcs',
    info: 'short module description'
    desc: require './test_dcs.rst'

    uses:  [
        "ocs_core_fwk"
        "ocs_ctrl_fwk" 
    ]

    types: [
        "test_motor_status"
        "test_motor_control"
        "test_motor"
        "test_motor_pos_control"
    ]

    connectors: [
        { id: 8109, to:   {element: "test_hw1_adapter", port: "ecat_bus"}, from: {element: "*", port: "*"}, max_latency: 0.5,          nom_rate: 100,   on_fault: "", conversion: "", bus: "" }
        { id: 8110, to:   {element: "test_hw1_adapter", port: "op_state_goal"}, from: {element: "*", port: "*"},  max_latency: 0.5,   nom_rate: 1, on_fault: "", conversion: "", bus: "" }
        { id: 8112, from: {element: "test_hw1_adapter", port: "op_state_value"}, to: {element: "*", port: "*"}, max_latency: 0.5,     nom_rate: 1, on_fault: "", conversion: "", bus: "" }


        { id: 8113, to:   {element: "test_main_ctrl",   port: "op_state_goal"}, from: {element: "*", port: "*"}, max_latency: 0.5,    nom_rate: 1, on_fault: "", conversion: "", bus: "" }
        { id: 8114, to:   {element: "test_main_ctrl",   port: "sim_mode_goal"}, from: {element: "*", port: "*"}, max_latency: 0.5,     nom_rate: 1, on_fault: "", conversion: "", bus: "" }
        { id: 8115, to:   {element: "test_main_ctrl",   port: "control_mode_goal"}, from: {element: "*", port: "*"}, max_latency: 0.5, nom_rate: 1, on_fault: "", conversion: "", bus: "" }
        { id: 8117, to:   {element: "test_main_ctrl",   port: "motor_goal"}, from: {element: "*", port: "*"}, max_latency: 0.5, nom_rate: 1, on_fault: "", conversion: "", bus: "" }


        { id: 8119, from: {element: "test_main_ctrl",   port: "op_state_value"}, to: {element: "*", port: "*"}, max_latency: 0.5,     nom_rate: 1, on_fault: "", conversion: "", bus: "" }
        { id: 8120, from: {element: "test_main_ctrl",   port: "sim_mode_value"}, to: {element: "*", port: "*"}, max_latency: 0.5,      nom_rate: 1, on_fault: "", conversion: "", bus: "" }
        { id: 8121, from: {element: "test_main_ctrl",   port: "control_mode_value"}, to: {element: "*", port: "*"}, max_latency: 0.5,  nom_rate: 1, on_fault: "", conversion: "", bus: "" }
        { id: 8123, from: {element: "test_main_ctrl",   port: "motor_value"}, to: {element: "*", port: "*"}, max_latency: 0.5,  nom_rate: 1, on_fault: "", conversion: "", bus: "" }
    ]                  # Connectors between components of the module that belong to different packages
    uses:          [
        "ocs_core_fwk"
        "ocs_ctrl_fwk" 
    ]                  # Other modules this module depends on
