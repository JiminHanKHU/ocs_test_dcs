#ifndef _TestMainCtrl_h_
#define _TestMainCtrl_h_


#include "TestMainCtrlBase.h"

namespace gmt
{

class TestMainCtrl : public TestMainCtrlBase
{
    public:
        TestMainCtrl(
                        const  std::string& comp_uri,
                        const  std::string& comp_name,
                        const  std::string& comp_host,
                        int    comp_port,
                        const  std::string& comp_acl,
                        double comp_scan_rate = 1.0,
                        int comp_prio = GMT_THREAD_DEFAULT_PRIO,
                        int comp_stack_size = GMT_DEFAULT_STACK_SIZE);

        virtual ~TestMainCtrl();

        //XXX add your public methods here

    protected:

        virtual void step() override;
        virtual void setup() override;

        //XXX add your protected class members here

    private:

        //XXX add your private class members here
};

} // namespace gmt

#endif   // _TestMainCtrl_h_
