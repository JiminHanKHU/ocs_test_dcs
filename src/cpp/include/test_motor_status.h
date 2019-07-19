#ifndef _test_motor_status_h_
#define _test_motor_status_h_

#include <msgpack.hpp>
#include <string>
#include <array>
#include <vector>

struct test_motor_status {
    bool                     ready;               // Axis Ready
    bool                     enabled;             // Axis Enabled
    bool                     warning;             // warning
    bool                     error;               // error
    bool                     moving_positive;     // Axis Moving +
    bool                     moving_negative;     // Axis Moving -
    bool                     busy;                // Busy
    bool                     in_target;           // In_Rarget
    bool                     calibrated;          // calibrated
    bool                     accelerate;          // accelerate
    bool                     decelerate;          // decelerate
    uint32_t                 actual_position;     // Actual Position
    int16_t                  actual_velocity;     // Actual Velocity
    MSGPACK_DEFINE_MAP(ready, enabled, warning, error, moving_positive, moving_negative, busy, in_target, calibrated, accelerate, decelerate, actual_position, actual_velocity)
};


#endif // _test_motor_status_h_
