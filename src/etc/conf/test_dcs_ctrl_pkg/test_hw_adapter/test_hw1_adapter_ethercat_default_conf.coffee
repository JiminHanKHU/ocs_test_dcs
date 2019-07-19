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
        { name: "motor_acceleration",      type: "rx_pdo", label: "Acceleration",      std_name: "POS Control : Control__Acceleration",       module: 1, domain: 0 }
        { name: "motor_deceleration",      type: "rx_pdo", label: "Deceleration",      std_name: "POS Control : Control__Deceleration",       module: 1, domain: 0 }  
        { name: "motor_start_type",        type: "rx_pdo", label: "Start type",        std_name: "POS Control : Control__Start type",         module: 1, domain: 0 }  

        { name: "motor_busy",              type: "tx_pdo", label: "Busy",              std_name: "POS Status : Status__Busy",                 module: 1, domain: 0 }
        { name: "motor_accelerate",        type: "tx_pdo", label: "Accelerate",        std_name: "POS Status : Status__Accelerate",           module: 1, domain: 0 }
        { name: "motor_decelerate",        type: "tx_pdo", label: "Decelerate",        std_name: "POS Status : Status__Decelerate",           module: 1, domain: 0 }
        { name: "motor_actual_position",   type: "tx_pdo", label: "Actual Position",   std_name: "POS Status : Status__Actual position",      module: 1, domain: 0 }
        { name: "motor_actual_velocity",   type: "tx_pdo", label: "Actual Velocity",   std_name: "POS Status : Status__Actual velocity",      module: 1, domain: 0 }
        { name: "motor_warning",           type: "tx_pdo", label: "Warning",           std_name: "POS Status : Status__Warning",              module: 1, domain: 0 }   
        { name: "motor_error",             type: "tx_pdo", label: "Error",             std_name: "POS Status : Status__Error",                module: 1, domain: 0 } 
        { name: "motor_calibrated",        type: "tx_pdo", label: "Calibrated",        std_name: "POS Status : Status__Calibrated",           module: 1, domain: 0 } 
        { name: "motor_in_target",         type: "tx_pdo", label: "In Target",         std_name: "POS Status : Status__In-Target",            module: 1, domain: 0 } 
    ]

    catalog: [
        {                                 
            product_name: "EK1100-11",
            vendor_id: 2,
            product_code: 0x044c2c52,
            revision_id: 0x00110000,
            objs: []
        }
        { #Slave 4
            product_name: "EL7041-17",
            vendor_id: 2,
            product_code: 0x1b813052,
            revision_id: 0x00170000,
            objs: [
                {name: "STM Status : Status__Ready to enable",   index: 0x6010, sub_index:  0x1, bit: 0}
                {name: "STM Status : Status__Ready",             index: 0x6010, sub_index:  0x2, bit: 0}
                {name: "STM Status : Status__Warning",           index: 0x6010, sub_index:  0x3, bit: 0}
                {name: "STM Status : Status__Error",             index: 0x6010, sub_index:  0x4, bit: 0}
                {name: "STM Status : Status__Moving positive",   index: 0x6010, sub_index:  0x5, bit: 0}
                {name: "STM Status : Status__Moving negative",   index: 0x6010, sub_index:  0x6, bit: 0}
                {name: "STM Control : Control__Enable",          index: 0x7010, sub_index:  0x1, bit: 0}
                {name: "STM Control : Control__Reset",           index: 0x7010, sub_index:  0x2, bit: 0}
                {name: "POS Control : Control__Execute",         index: 0x7020, sub_index:  0x1, bit: 0}
                {name: "POS Control : Control__Target position", index: 0x7020, sub_index:  0x11, bit: 0}
                {name: "POS Control : Control__Velocity",        index: 0x7020, sub_index:  0x21, bit: 0}
                {name: "POS Control : Control__Acceleration",    index: 0x7020, sub_index:  0x23, bit: 0}
                {name: "POS Control : Control__Deceleration",    index: 0x7020, sub_index:  0x24, bit: 0}
                {name: "POS Control : Control__Start type",      index: 0x7020, sub_index:  0x22, bit: 0}
                {name: "POS Status : Status__In-Target",         index: 0x6020, sub_index:  0x2, bit: 0}        
                {name: "POS Status : Status__Busy",              index: 0x6020, sub_index:  0x1, bit: 0}        
                {name: "POS Status : Status__Accelerate",        index: 0x6020, sub_index:  0x6, bit: 0}        
                {name: "POS Status : Status__Warning",           index: 0x6020, sub_index:  0x3, bit: 0}
                {name: "POS Status : Status__Error",             index: 0x6020, sub_index:  0x4, bit: 0}
                {name: "POS Status : Status__Calibrated",        index: 0x6020, sub_index:  0x5, bit: 0}  
                {name: "POS Status : Status__Decelerate",        index: 0x6020, sub_index:  0x7, bit: 0}        
                {name: "POS Status : Status__Actual position",   index: 0x6020, sub_index:  0x11,bit: 0}        
                {name: "POS Status : Status__Actual velocity",   index: 0x6020, sub_index:  0x21,bit: 0}        


            ]

        }
    ]
