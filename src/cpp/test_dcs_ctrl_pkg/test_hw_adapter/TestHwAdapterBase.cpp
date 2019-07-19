// GMT AUTO GENERATED CODE

#include "TestHwAdapterSetup.h"
#include "TestHwAdapterBase.h"

using namespace std;
using namespace gmt;

TestHwAdapterBase::TestHwAdapterBase(
                            const string& comp_uri,
                            const string& comp_name,
                            const string& comp_host,
                            int comp_port,
                            const string& comp_acl,
                            double comp_scan_rate,
                            int comp_prio,
                            int comp_stack_size)
    : EthercatAdapter(comp_uri, comp_name, comp_host, comp_port, comp_acl, comp_scan_rate, comp_prio, comp_stack_size)
    
{
}

TestHwAdapterBase::~TestHwAdapterBase()
{
}

void TestHwAdapterBase::create_state()
{
    //create the features inherited from the base class
    Base::create_state();

    //create the input dataio of the class, and assign the default value
    new_input_dataio(motor_ctrl,                "motor_ctrl",            test_motor_control());
    new_input_dataio(motor_pos_ctrl,            "motor_pos_ctrl",        test_motor_pos_control());

    //create the output dataio of the class, and assign the default value
    new_output_dataio(motor_state,               "motor_state",           test_motor_status());

    //create the state vars of the class and assign the "class" default value

    //create the properties of the class and assign the "class" default value
}

//reads and unpacks the configuration file, and calls the setup() method with
//the decoded configuration
void TestHwAdapterBase::configure_from_file (const std::string& fname)
{
    try
    {
        log_info ("Configure from file "+fname);
        Setup conf;

        load_conf_file (fname, conf);
        setup_wrapper (conf);
    }
    catch (std::exception& ex)
    {
        throw std::runtime_error("ERROR while opening configuration file "+fname+": "+ex.what());
    }
    catch (...)
    {
        throw std::runtime_error("ERROR while opening configuration file "+fname);
    }

    log_info ("Configuration applied!");
}

void TestHwAdapterBase::setup_state(ComponentSetup& config)
{
    Setup::StateVarConf&  sv_conf        = dynamic_cast<Setup&>(config).state_vars;
    Setup::InputConf&     input_confs    = dynamic_cast<Setup&>(config).inputs;
    Setup::OutputConf&    output_confs   = dynamic_cast<Setup&>(config).outputs;
    Setup::PropertyConf&  property_confs = dynamic_cast<Setup&>(config).properties;

    log_info("state setup");

    // create inputs
    new_input_dataio(motor_ctrl,                "motor_ctrl",            input_confs.motor_ctrl);
    new_input_dataio(motor_pos_ctrl,            "motor_pos_ctrl",        input_confs.motor_pos_ctrl);
    new_input_dataio(sdo_read_update_req,       "sdo_read_update_req",   input_confs.sdo_read_update_req);
    new_input_dataio(sdo_write_enable,          "sdo_write_enable",      input_confs.sdo_write_enable);

    // create outputs
    new_output_dataio(motor_state,              "motor_state",           output_confs.motor_state);
    new_output_dataio(sdo_read_update_done,     "sdo_read_update_done",  output_confs.sdo_read_update_done);

    // Create state variables
    new_state_var(op_state,                     "op_state",              sv_conf.op_state,             input_confs.op_state_goal,    output_confs.op_state_value);

    // Create properties
    new_property(uri,                           "uri",                   property_confs.uri);
    new_property(name,                          "name",                  property_confs.name);
    new_property(host,                          "host",                  property_confs.host);
    new_property(port,                          "port",                  property_confs.port);
    new_property(scan_rate,                     "scan_rate",             property_confs.scan_rate);
    new_property(acl,                           "acl",                   property_confs.acl);
    new_property(priority,                      "priority",              property_confs.priority);
    new_property(ecat_cfg_name,                 "ecat_cfg_name",         property_confs.ecat_cfg_name);

    // create data_object references
    create_data_object_ref(motor_ctrl.enable,                       "motor_enable");
    create_data_object_ref(motor_ctrl.reset,                        "motor_reset");
    create_data_object_ref(motor_pos_ctrl.velocity,                 "motor_velocity");
    create_data_object_ref(motor_pos_ctrl.execute,                  "motor_execute");
    create_data_object_ref(motor_pos_ctrl.start_type,               "motor_start_type");
    create_data_object_ref(motor_pos_ctrl.acceleration,             "motor_acceleration");
    create_data_object_ref(motor_pos_ctrl.deceleration,             "motor_deceleration");
    create_data_object_ref(motor_pos_ctrl.target_position,          "motor_target_position");
    create_data_object_ref(motor_state.in_target,                   "motor_in_target");
    create_data_object_ref(motor_state.busy,                        "motor_busy");
    create_data_object_ref(motor_state.warning,                     "motor_warning");
    create_data_object_ref(motor_state.error,                       "motor_error");
    create_data_object_ref(motor_state.calibrated,                  "motor_calibrated");
    create_data_object_ref(motor_state.accelerate,                  "motor_accelerate");
    create_data_object_ref(motor_state.decelerate,                  "motor_decelerate");
    create_data_object_ref(motor_state.actual_position,             "motor_actual_position");
    create_data_object_ref(motor_state.actual_velocity,             "motor_actual_velocity");
    create_data_object_ref(motor_state.ready,                       "motor_ready");
    create_data_object_ref(motor_state.enabled,                     "motor_enabled");
    create_data_object_ref(motor_state.warning,                     "motor_warning");
    create_data_object_ref(motor_state.error,                       "motor_error");
    create_data_object_ref(motor_state.moving_positive,             "motor_moving_positive");
    create_data_object_ref(motor_state.moving_negative,             "motor_moving_negative");
}
