#ifndef _test_motor_h_
#define _test_motor_h_

#include <msgpack.hpp>
#include <string>
#include <array>
#include <vector>
#include "test_motor_pos_control.h"
#include "test_motor_control.h"
#include "test_motor_status.h"

struct test_motor {
    test_motor_status        state;               // HMI motor devices state
    test_motor_control       command;             // HMI motor devices command
    test_motor_pos_control   pos_command;         // HMI motor devices pos_command
    MSGPACK_DEFINE_MAP(state, command, pos_command)
};


#endif // _test_motor_h_
