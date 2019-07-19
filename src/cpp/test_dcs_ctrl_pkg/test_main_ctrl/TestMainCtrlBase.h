#ifndef _TestMainCtrlBase_h_
#define _TestMainCtrlBase_h_

// GMT AUTO GENERATED CODE

#include <ocs_core_fwk.h>
#include <ocs_ctrl_fwk.h>
#include "../../include/test_dcs_port_types.h"

class TestMainCtrlSetup;

namespace gmt
{

class TestMainCtrlBase : public BaseController
{
    public:
        TestMainCtrlBase(
                        const  std::string& comp_uri,
                        const  std::string& comp_name,
                        const  std::string& comp_host,
                        int    comp_port,
                        const  std::string& comp_acl,
                        double comp_scan_rate = 1.0,
                        int comp_prio = GMT_THREAD_DEFAULT_PRIO,
                        int comp_stack_size = GMT_DEFAULT_STACK_SIZE);

        virtual ~TestMainCtrlBase();

    protected:

        typedef TestMainCtrlSetup Setup;
        typedef BaseController Base;

        /**
        * Creates the state of the Component, i.e., state variables,
        * inputs, outputs, properties, alarms and faults
        * Overriden from the Component class
        */
        virtual void create_state() override;

        /**
        * Uses the given Component::Setup parameter to configure all the
        * Component interface features (state vars, inputs, outputs, properties, ...)
        * Overriden from the Component class
        */
        virtual void setup_state (ComponentSetup& conf) override;

        /**
        * Configure the object from a file. The classes that derive from Component
        * must reimplement this method, in order to unpack the binary contents of
        * the configuration file with their Setup structure.
        * Overriden from the Component class
        */
        virtual void configure_from_file (const std::string& fname) override;

    protected:

        // Create state variables
        StateVar<test_motor>           motor;

        // Inputs declaration
        test_motor_status        motor_state_val;     // motor state

        // Outputs declaration
        test_motor_control       motor_ctrl_req;      // motor control
        test_motor_pos_control   motor_pos_ctrl_req;  // motor pos control

        // Configuration properties
};

} // namespace gmt

#endif   // _TestMainCtrlBase_h_
