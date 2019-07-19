#ifndef _TestMainCtrlSetup_h_
#define _TestMainCtrlSetup_h_

#include <msgpack.hpp>
#include <ocs_core_fwk.h>
#include <ocs_ctrl_fwk.h>
#include "../../include/test_dcs_port_types.h"

namespace gmt
{

struct TestMainCtrlSetup : public  BaseControllerSetup
{

    struct PropertyConf : public  BaseControllerSetup::PropertyConf
    {
        MSGPACK_DEFINE_MAP(uri, name, host, port, scan_rate, acl, priority)
    };

    struct StateVarConf : public  BaseControllerSetup::StateVarConf
    {
        StateVarDef<test_motor>        motor;
        MSGPACK_DEFINE_MAP(motor, op_state, sim_mode, control_mode)
    };

    struct InputConf : public BaseControllerSetup::InputConf
    {
        DataIODef<test_motor_status>   motor_state_val;
        DataIODef<test_motor>          motor_goal;
        MSGPACK_DEFINE_MAP(motor_state_val, motor_goal, op_state_goal, sim_mode_goal, control_mode_goal)
    };

    struct OutputConf : public BaseControllerSetup::OutputConf
    {
        DataIODef<test_motor_control>  motor_ctrl_req;
        DataIODef<test_motor_pos_control>  motor_pos_ctrl_req;
        DataIODef<test_motor>          motor_value;
        MSGPACK_DEFINE_MAP(motor_ctrl_req, motor_pos_ctrl_req, motor_value, op_state_value, sim_mode_value, control_mode_value)
    };

    PropertyConf     properties;
    StateVarConf     state_vars;
    InputConf        inputs;
    OutputConf       outputs;

    MSGPACK_DEFINE_MAP(properties, state_vars, inputs, outputs, connectors)
};

} //namespace gmt

#endif // _TestMainCtrlSetup_h_
