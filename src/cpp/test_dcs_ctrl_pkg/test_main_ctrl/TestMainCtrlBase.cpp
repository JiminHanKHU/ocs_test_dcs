// GMT AUTO GENERATED CODE

#include "TestMainCtrlSetup.h"
#include "TestMainCtrlBase.h"

using namespace std;
using namespace gmt;

TestMainCtrlBase::TestMainCtrlBase(
                            const string& comp_uri,
                            const string& comp_name,
                            const string& comp_host,
                            int comp_port,
                            const string& comp_acl,
                            double comp_scan_rate,
                            int comp_prio,
                            int comp_stack_size)
    : BaseController(comp_uri, comp_name, comp_host, comp_port, comp_acl, comp_scan_rate, comp_prio, comp_stack_size)
    , motor("motor", test_motor(), true)
    
    
    
{
}

TestMainCtrlBase::~TestMainCtrlBase()
{
}

void TestMainCtrlBase::create_state()
{
    //create the features inherited from the base class
    Base::create_state();

    //create the input dataio of the class, and assign the default value
    new_input_dataio(motor_state_val,           "motor_state_val",       test_motor_status());

    //create the output dataio of the class, and assign the default value
    new_output_dataio(motor_ctrl_req,            "motor_ctrl_req",        test_motor_control());
    new_output_dataio(motor_pos_ctrl_req,        "motor_pos_ctrl_req",    test_motor_pos_control());

    //create the state vars of the class and assign the "class" default value
    new_state_var(motor,                     "motor",                 test_motor());

    //create the properties of the class and assign the "class" default value
}

//reads and unpacks the configuration file, and calls the setup() method with
//the decoded configuration
void TestMainCtrlBase::configure_from_file (const std::string& fname)
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

void TestMainCtrlBase::setup_state(ComponentSetup& config)
{
    Setup::StateVarConf&  sv_conf        = dynamic_cast<Setup&>(config).state_vars;
    Setup::InputConf&     input_confs    = dynamic_cast<Setup&>(config).inputs;
    Setup::OutputConf&    output_confs   = dynamic_cast<Setup&>(config).outputs;
    Setup::PropertyConf&  property_confs = dynamic_cast<Setup&>(config).properties;

    log_info("state setup");

    // create inputs
    new_input_dataio(motor_state_val,           "motor_state_val",       input_confs.motor_state_val);

    // create outputs
    new_output_dataio(motor_ctrl_req,           "motor_ctrl_req",        output_confs.motor_ctrl_req);
    new_output_dataio(motor_pos_ctrl_req,       "motor_pos_ctrl_req",    output_confs.motor_pos_ctrl_req);

    // Create state variables
    new_state_var(motor,                        "motor",                 sv_conf.motor,                input_confs.motor_goal,       output_confs.motor_value);
    new_state_var(op_state,                     "op_state",              sv_conf.op_state,             input_confs.op_state_goal,    output_confs.op_state_value);
    new_state_var(sim_mode,                     "sim_mode",              sv_conf.sim_mode,             input_confs.sim_mode_goal,    output_confs.sim_mode_value);
    new_state_var(control_mode,                 "control_mode",          sv_conf.control_mode,         input_confs.control_mode_goal, output_confs.control_mode_value);

    // Create properties
    new_property(uri,                           "uri",                   property_confs.uri);
    new_property(name,                          "name",                  property_confs.name);
    new_property(host,                          "host",                  property_confs.host);
    new_property(port,                          "port",                  property_confs.port);
    new_property(scan_rate,                     "scan_rate",             property_confs.scan_rate);
    new_property(acl,                           "acl",                   property_confs.acl);
    new_property(priority,                      "priority",              property_confs.priority);

}
