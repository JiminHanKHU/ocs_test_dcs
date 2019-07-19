#ifndef _TestHwAdapterSetup_h_
#define _TestHwAdapterSetup_h_

#include <msgpack.hpp>
#include <ocs_core_fwk.h>
#include <ocs_io_fwk.h>
#include "../../include/test_dcs_port_types.h"

namespace gmt
{

struct TestHwAdapterSetup : public  EthercatAdapterSetup
{

    struct PropertyConf : public  EthercatAdapterSetup::PropertyConf
    {
        MSGPACK_DEFINE_MAP(uri, name, host, port, scan_rate, acl, priority, ecat_cfg_name)
    };

    struct StateVarConf : public  EthercatAdapterSetup::StateVarConf
    {
        MSGPACK_DEFINE_MAP(op_state)
    };

    struct InputConf : public EthercatAdapterSetup::InputConf
    {
        DataIODef<test_motor_control>  motor_ctrl;
        DataIODef<test_motor_pos_control>  motor_pos_ctrl;
        MSGPACK_DEFINE_MAP(motor_ctrl, motor_pos_ctrl, sdo_read_update_req, sdo_write_enable, op_state_goal)
    };

    struct OutputConf : public EthercatAdapterSetup::OutputConf
    {
        DataIODef<test_motor_status>   motor_state;
        MSGPACK_DEFINE_MAP(motor_state, sdo_read_update_done, op_state_value)
    };

    PropertyConf     properties;
    StateVarConf     state_vars;
    InputConf        inputs;
    OutputConf       outputs;

    MSGPACK_DEFINE_MAP(properties, state_vars, inputs, outputs, connectors)
};

} //namespace gmt

#endif // _TestHwAdapterSetup_h_
