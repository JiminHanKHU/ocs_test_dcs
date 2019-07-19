#ifndef _TestHwAdapterBase_h_
#define _TestHwAdapterBase_h_

// GMT AUTO GENERATED CODE

#include <ocs_core_fwk.h>
#include <ocs_io_fwk.h>
#include "../../include/test_dcs_port_types.h"

class TestHwAdapterSetup;

namespace gmt
{

class TestHwAdapterBase : public EthercatAdapter
{
    public:
        TestHwAdapterBase(
                        const  std::string& comp_uri,
                        const  std::string& comp_name,
                        const  std::string& comp_host,
                        int    comp_port,
                        const  std::string& comp_acl,
                        double comp_scan_rate = 1.0,
                        int comp_prio = GMT_THREAD_DEFAULT_PRIO,
                        int comp_stack_size = GMT_DEFAULT_STACK_SIZE);

        virtual ~TestHwAdapterBase();

    protected:

        typedef TestHwAdapterSetup Setup;
        typedef EthercatAdapter Base;

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

        // Inputs declaration
        test_motor_control       motor_ctrl;          // motor control
        test_motor_pos_control   motor_pos_ctrl;      // motor pos control

        // Outputs declaration
        test_motor_status        motor_state;         // motor state

        // Configuration properties
};

} // namespace gmt

#endif   // _TestHwAdapterBase_h_
