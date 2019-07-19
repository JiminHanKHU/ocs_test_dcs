
module.exports =
    elements:
        test_dcs_ctrl_pkg:
            elements:
                test_main_ctrl:   { language: ["cpp"], build: 'obj', deploy: 'dist', codegen: true, active: true}
                test_hw_adapter:  { language: ["cpp"], build: 'obj', deploy: 'dist', codegen: true, active: true}
                test_ctrl_app:    { language: ["cpp"], build: 'app', deploy: 'dist', codegen: true, active: true}
