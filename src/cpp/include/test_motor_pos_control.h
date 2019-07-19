#ifndef _test_motor_pos_control_h_
#define _test_motor_pos_control_h_

#include <msgpack.hpp>
#include <string>
#include <array>
#include <vector>

struct test_motor_pos_control {
    int16_t                  velocity;            // Velocity
    bool                     execute;             // Execute
    uint32_t                 target_position;     // Target_position
    uint16_t                 acceleration;        // Acceleration
    uint16_t                 deceleration;        // Deceleration
    uint16_t                 start_type;          // Start Type
    MSGPACK_DEFINE_MAP(velocity, execute, target_position, acceleration, deceleration, start_type)
};


#endif // _test_motor_pos_control_h_
