
# Component  test_hw1_adapter instance configuration file
# Ports should be setup per instance

module.exports =

    properties:
        uri: { name: 'uri', default_value: 'gmt://127.0.0.1/test_dcs/test_hw1_adapter' , type: 'string', desc: 'Uri path for the component' }
        name: { name: 'name', default_value: 'test_hw_adapter' , type: 'string', desc: 'Name the component' }
        host: { name: 'host', default_value: '127.0.0.1' , type: 'string', desc: 'Default host for deployment.' }
        port: { name: 'port', default_value: 9020 , type: 'integer', desc: 'Default configuration port' }
        scan_rate: { name: 'scan_rate', default_value: 100 , type: 'float', desc: 'The scanning rate of the component loop in Hz. In each iteration of the loop the component must process its ports and health status. The estimation of the state variables, is defined by the state variable sampling rate and it may use an estimation model. The control of the state variable is defined by the state variable control rate. It must calculate the control output, if necessary with a control model. The scanning rate shall be always higher that the maximum of the sampling or control rate of any of its states variables' }
        acl: { name: 'acl', default_value: 'PRIVATE' , type: 'string', desc: 'Access Control List. List of namespaces that can issue a command to the controller. TBC' }
        priority: { name: 'priority', default_value: 0 , max: 100, type: 'integer', desc: 'The priority property defines the relative priority between Component running in different Threads. The priority shall be interpreted higher when the value is higher. This property can be used by implementations that support real time behavior. When the property value is 0 the Component doesn&#x27;t require any real-time consideration by the implementation' }
        ecat_cfg_name: { name: 'ecat_cfg_name', default_value: 'ethercat_default' , type: 'String', desc: 'Name of the configuration of the Ethercat field bus' }

    state_vars:
        op_state: { name: 'op_state', default_value: 'OFF' , type: 'OperationalState', desc: 'Operational Mode State Variable' }

    inputs:
        motor_ctrl:          { name: 'motor_ctrl',            port_type: 'pull',  url: 'tcp://127.0.0.1:8000', blocking_mode: 'sync',  max_rate: 1000,  nom_rate: 1,     owner: true  }
        motor_pos_ctrl:      { name: 'motor_pos_ctrl',        port_type: 'pull',  url: 'tcp://127.0.0.1:8000', blocking_mode: 'sync',  max_rate: 1000,  nom_rate: 1,     owner: true  }
        sdo_read_update_req: { name: 'sdo_read_update_req',   port_type: 'sub',   url: 'tcp://127.0.0.1:8000', blocking_mode: 'async', max_rate: 10000, nom_rate: 1,     owner: true  }
        sdo_write_enable:    { name: 'sdo_write_enable',      port_type: 'sub',   url: 'tcp://127.0.0.1:8000', blocking_mode: 'async', max_rate: 10000, nom_rate: 1,     owner: true  }
        op_state_goal:       { name: 'op_state_goal',         port_type: 'pull',  url: 'tcp://127.0.0.1:8110', blocking_mode: 'async', max_rate: 1,     nom_rate: 1,     owner: true}

    outputs:
        motor_state:         { name: 'motor_state',           port_type: 'push',  url: 'tcp://127.0.0.1:8000', blocking_mode: 'sync',  max_rate: 1000,  nom_rate: 1,     owner: false }
        sdo_read_update_done: { name: 'sdo_read_update_done',  port_type: 'pub',   url: 'tcp://127.0.0.1:8000', blocking_mode: 'async', max_rate: 10000, nom_rate: 1,     owner: true  }
        op_state_value:      { name: 'op_state_value',        port_type: 'push',  url: 'tcp://127.0.0.1:8112', blocking_mode: 'async', max_rate: 1,     nom_rate: 1,     owner: false}
