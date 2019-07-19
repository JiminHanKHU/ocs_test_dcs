#include "TestHwAdapter.h"

using namespace std;
using namespace gmt;

void run() {
    try
    {
        // create instances
        TestHwAdapter test_hw1_adapter("gmt://127.0.0.1/test_dcs/test_hw1_adapter", "test_hw1_adapter", "127.0.0.1", 9020, "PRIVATE", 100);

        // start instances
        test_hw1_adapter.start();

        // wait until components finish
        test_hw1_adapter.wait();
    }
    catch(std::runtime_error& e) { cerr<<"ERROR in test_hw_adapter_app: "<<e.what()<<endl;            }
    catch(std::exception& e)     { cerr<<"ERROR in test_hw_adapter_app: "<<e.what()<<endl;            }
    catch(...)                   { cerr<<"ERROR in test_hw_adapter_app: unknown exception"<<endl; }
}

int main() {
    run();
    return(0);
}
