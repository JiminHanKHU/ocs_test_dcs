module.exports =
    master: [
            { id: 0, rate: 1000 }
        ]

    domains: [
        { id: 0, master: 0,   rate_factor: 1    }
        { id: 1, master: 0,   rate_factor: 100 }
    ]

    modules: [
        { name: "coupler", position: 0, type: "EK1100-11", master_id: 0 }
        { name: "motor",   position: 4, type: "EL7041-17", master_id: 0 }
    ]


    data_objects: [
        { name: "motor_ready",             type: "tx_pdo", label: "Axis Ready",        std_name: "STM Status : Status__Ready to enable",      module: 1, domain: 0 }
        { name: "motor_enabled",           type: "tx_pdo", label: "Axis Enabled",      std_name: "STM Status : Status__Ready",                module: 1, domain: 0 }
        { name: "motor_warning",           type: "tx_pdo", label: "Axis Warning",      std_name: "STM Status : Status__Warning",              module: 1, domain: 0 }
        { name: "motor_error",             type: "tx_pdo", label: "Axis Error",        std_name: "STM Status : Status__Error",                module: 1, domain: 0 }
        { name: "motor_moving_positive",   type: "tx_pdo", label: "Axis Moving +",     std_name: "STM Status : Status__Moving positive",      module: 1, domain: 0 }
        { name: "motor_moving_negative",   type: "tx_pdo", label: "Axis Moving -",     std_name: "STM Status : Status__Moving negative",      module: 1, domain: 0 }

        { name: "motor_enable",            type: "rx_pdo", label: "Axis Enable",       std_name: "STM Control : Control__Enable",             module: 1, domain: 0 }
        { name: "motor_reset",             type: "rx_pdo", label: "Axis Reset",        std_name: "STM Control : Control__Reset",              module: 1, domain: 0 }
    
        { name: "motor_execute",           type: "rx_pdo", label: "Execute",           std_name: "POS Control : Control__Execute",            module: 1, domain: 0 }
        { name: "motor_target_position",   type: "rx_pdo", label: "Target Position",   std_name: "POS Control : Control__Target position",    module: 1, domain: 0 }
        { name: "motor_velocity",          type: "rx_pdo", label: "Velocity",          std_name: "POS Control : Control__Velocity",           module: 1, domain: 0 }
        { name: "motor_acceleration",      type: "rx_pdo", label: "Acceleration",      std_name: "POS Control : Acceleration",                module: 1, domain: 0 }
        { name: "motor_deceleration",      type: "rx_pdo", label: "Deceleration",      std_name: "POS Control : Deceleration",                module: 1, domain: 0 }  
        { name: "motor_start_type",        type: "rx_pdo", label: "Start type",        std_name: "POS Control : Control__Start type",         module: 1, domain: 0 }  

        { name: "motor_in_target",         type: "rx_pdo", label: "In Target",         std_name: "POS Status : Status__In-Target",            module: 1, domain: 0 }
        { name: "motor_busy",              type: "rx_pdo", label: "Busy",              std_name: "POS Status : Status__Busy",                 module: 1, domain: 0 }
        { name: "motor_accelerate",        type: "rx_pdo", label: "Accelerate",        std_name: "POS Status : Status__Accelerate",           module: 1, domain: 0 }
        { name: "motor_decelerate",        type: "rx_pdo", label: "Decelerate",        std_name: "POS Status : Status__Decelerate",           module: 1, domain: 0 }
        { name: "motor_actual_position",   type: "rx_pdo", label: "Actual Position",   std_name: "POS Status : Status__Actual position",      module: 1, domain: 0 }
        { name: "motor_actual_velocity",   type: "rx_pdo", label: "Actual Position",   std_name: "POS Status : Status__Actual velocity",      module: 1, domain: 0 }
    ]
