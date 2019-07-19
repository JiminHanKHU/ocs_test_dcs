#ifndef _test_motor_control_h_
#define _test_motor_control_h_

#include <msgpack.hpp>
#include <string>
#include <array>
#include <vector>

struct test_motor_control {
    bool                     enable;              // Axis Enable
    bool                     reset;               // Axis Reset
    MSGPACK_DEFINE_MAP(enable, reset)
};


#endif // _test_motor_control_h_
