#include <string>
#include <memory>


#include "./test_main_ctrl/TestMainCtrl.h"
#include "./test_hw_adapter/TestHwAdapter.h"

using namespace std;
using namespace gmt;

class TestDcsCtrlPkgApp : public CoreApplication
{
    public:

        TestDcsCtrlPkgApp();

        virtual ~TestDcsCtrlPkgApp();

        virtual void start(int argc, char* argv[]);

    protected:

        CLIHandler cli;
};

TestDcsCtrlPkgApp::TestDcsCtrlPkgApp()
 : CoreApplication()
 , cli("TestDcsCtrlPkg application", "GMT_")
{
    //setup command line
    cli.add_option<string> ("config",  "Name of the configuration snapshot to apply", "default", "")
       .add_option<string> ("logging", "Logging level", "info")
       .add_option<string> ("ctnr_config", "Name of the container configuration file", "default")
       .add_option<void>   ("help",    "Show help");

    auto cntr = make_unique<CoreContainer>();

    // create test_main_ctrl instances
    cntr->add (make_unique<TestMainCtrl>("gmt://127.0.0.1/test_dcs/test_main_ctrl", "test_main_ctrl", "127.0.0.1", 9030, "PRIVATE", 100));

    // create test_hw_adapter instances
    cntr->add (make_unique<TestHwAdapter>("gmt://127.0.0.1/test_dcs/test_hw1_adapter", "test_hw1_adapter", "127.0.0.1", 9020, "PRIVATE", 100));

    // create test_ctrl_app instances


    this->add (std::move(cntr));
}

TestDcsCtrlPkgApp::~TestDcsCtrlPkgApp()
{
}

void TestDcsCtrlPkgApp::start(int argc, char* argv[])
{
    CoreApplication::initialize_rt_system();

    cli.parse_cmd_line (argc, argv, true);

    if (cli.is_opt("help"))
    {
        cout<<cli<<endl;
    }
    else
    {
        auto cli_opts = cli.get_opt_values();
        configure (*cli_opts);
        CoreApplication::start ();
    }
}

int main (int argc, char* argv[])
{
    //create the application
    TestDcsCtrlPkgApp test_dcs_ctrl_pkg_app;
    
    try
    {
        //configure and start the application
        test_dcs_ctrl_pkg_app.start (argc, argv);

        //wait until execution end
        test_dcs_ctrl_pkg_app.wait();
    }
    catch(std::runtime_error& e) { cerr<<"ERROR in test_dcs_ctrl_pkg_app: "<<e.what()<<endl;            }
    catch(std::exception& e)     { cerr<<"ERROR in test_dcs_ctrl_pkg_app: "<<e.what()<<endl;            }
    catch(...)                   { cerr<<"ERROR in test_dcs_ctrl_pkg_app: unknown exception"<<endl; }

    return 0;
}
