#include "TestMainCtrl.h"

using namespace std;
using namespace gmt;

void run() {
    try
    {
        // create instances
        TestMainCtrl test_main_ctrl("gmt://127.0.0.1/test_dcs/test_main_ctrl", "test_main_ctrl", "127.0.0.1", 9030, "PRIVATE", 100);

        // start instances
        test_main_ctrl.start();

        // wait until components finish
        test_main_ctrl.wait();
    }
    catch(std::runtime_error& e) { cerr<<"ERROR in test_main_ctrl_app: "<<e.what()<<endl;            }
    catch(std::exception& e)     { cerr<<"ERROR in test_main_ctrl_app: "<<e.what()<<endl;            }
    catch(...)                   { cerr<<"ERROR in test_main_ctrl_app: unknown exception"<<endl; }
}

int main() {
    run();
    return(0);
}
